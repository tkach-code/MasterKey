# Disk Performance Testing

Measure your hard drive or SSD's sequential and random read/write speeds using built-in Linux tools and dedicated benchmarks. No special hardware needed — most tools ship with the OS or are one `apt install` away.

## Quick Reference

| Tool     | Read | Write | Random I/O | Notes                               |
| -------- | ---- | ----- | ---------- | ----------------------------------- |
| `dd`     | Yes  | Yes   | No         | Built-in, destructive write test    |
| `hdparm` | Yes  | No    | No         | Buffered + cached read; drive-level |
| `fio`    | Yes  | Yes   | Yes        | Most accurate; needs install        |
| `iostat` | —    | —     | —          | Live monitoring, not a benchmark    |
| `iotop`  | —    | —     | —          | Per-process I/O monitor             |

---

## dd — Built-in Benchmark

`dd` is always available. It measures **sequential** throughput by copying a large block of data.

### Write speed

```bash
# Write 1 GB to a temp file and measure throughput
dd if=/dev/zero of=/tmp/testfile bs=1M count=1024 conv=fdatasync status=progress
```

- `if=/dev/zero` — source of data (all zeroes, never a bottleneck)
- `of=/tmp/testfile` — destination on the drive you want to test
- `bs=1M count=1024` — 1 MB blocks × 1024 = 1 GB total
- `conv=fdatasync` — flush to disk before stopping (removes RAM cache effect)
- `status=progress` — live throughput display

```bash
# Clean up afterward
rm /tmp/testfile
```

### Read speed

```bash
# Drop the page cache first so you measure the disk, not RAM
sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"

# Read the file back
dd if=/tmp/testfile of=/dev/null bs=1M status=progress
```

> Always drop the page cache before a read test, otherwise Linux reads from RAM and the result will be 5–20 GB/s regardless of the drive.

---

## hdparm — Drive-Level Read Test

`hdparm` talks directly to the drive. It provides both a **cached** (RAM) and **buffered** (disk) read speed.

```bash
# Install if needed
sudo apt install hdparm

# Identify your disk
lsblk

# Buffered (real disk) read — run 3 times for consistency
sudo hdparm -t /dev/sda

# Cached (RAM) read — shows memory bandwidth for comparison
sudo hdparm -T /dev/sda
```

Example output:

```
/dev/sda:
 Timing buffered disk reads: 312 MB in  3.00 seconds = 104.01 MB/sec
```

| Flag | Meaning |
|------|---------|
| `-t` | Buffered read (actual disk speed) |
| `-T` | Cached read (memory speed, not the disk) |
| `-I` | Full drive info (model, firmware, features) |

> `hdparm` only tests reads. Use `dd` or `fio` for write speed.

---

## fio — Full Benchmark (Most Accurate)

`fio` is the industry-standard tool for storage benchmarks. It tests sequential and random I/O with precise control over queue depth and block size.

```bash
sudo apt install fio
```

### Sequential write

```bash
fio --name=seqwrite --rw=write --bs=1M --size=1G \
    --numjobs=1 --ioengine=libaio --direct=1 \
    --filename=/tmp/fiotest --end_fsync=1
```

### Sequential read

```bash
fio --name=seqread --rw=read --bs=1M --size=1G \
    --numjobs=1 --ioengine=libaio --direct=1 \
    --filename=/tmp/fiotest
```

### Random 4K read/write (IOPS test — important for SSDs)

```bash
fio --name=randread --rw=randread --bs=4k --size=1G \
    --numjobs=4 --ioengine=libaio --direct=1 \
    --filename=/tmp/fiotest --iodepth=32

fio --name=randwrite --rw=randwrite --bs=4k --size=1G \
    --numjobs=4 --ioengine=libaio --direct=1 \
    --filename=/tmp/fiotest --iodepth=32
```

```bash
# Clean up
rm /tmp/fiotest
```

| Key fio parameter | Meaning |
|-------------------|---------|
| `--rw=read/write/randread/randwrite` | I/O pattern |
| `--bs=` | Block size (1M for sequential, 4k for IOPS) |
| `--direct=1` | Bypass page cache (measures real disk speed) |
| `--ioengine=libaio` | Async I/O (most realistic for Linux) |
| `--iodepth=` | Outstanding I/O requests (higher = better SSD utilisation) |
| `--numjobs=` | Parallel workers |

---

## iostat — Live I/O Monitoring

`iostat` shows real-time read/write activity per device. Part of the `sysstat` package.

```bash
sudo apt install sysstat

# Refresh every 2 seconds
iostat -xh 2

# Watch a specific device
iostat -xh 2 /dev/sda
```

Key columns:

| Column | Meaning |
|--------|---------|
| `r/s` | Reads per second |
| `w/s` | Writes per second |
| `rMB/s` | Read throughput (MB/s) |
| `wMB/s` | Write throughput (MB/s) |
| `await` | Average I/O wait time (ms) — lower is better |
| `%util` | Disk utilisation — near 100% means saturated |

---

## iotop — Per-Process I/O Monitor

`iotop` shows which processes are hammering the disk right now.

```bash
sudo apt install iotop

# Interactive mode (like top, but for disk I/O)
sudo iotop

# Non-interactive snapshot — top 10 I/O users
sudo iotop -b -n 1 | head -15
```

| Key | Action in interactive mode |
|-----|---------------------------|
| `o` | Show only processes doing I/O |
| `p` | Toggle between processes and threads |
| `a` | Show accumulated I/O (total since start) |
| `q` | Quit |

---

## Typical Reference Speeds

Use these as a rough sanity check for your results:

| Drive type | Sequential read | Sequential write |
|------------|----------------|-----------------|
| HDD (5400 rpm) | 80–120 MB/s | 70–110 MB/s |
| HDD (7200 rpm) | 120–180 MB/s | 100–160 MB/s |
| SATA SSD | 500–550 MB/s | 400–520 MB/s |
| NVMe SSD (Gen 3) | 2000–3500 MB/s | 1500–3000 MB/s |
| NVMe SSD (Gen 4) | 4000–7000 MB/s | 3000–6500 MB/s |
| SD card (class 10) | 20–100 MB/s | 10–60 MB/s |

> Raspberry Pi SD card and USB drive speeds are often the bottleneck — expect 20–90 MB/s sequential.

---

## Exercises

1. Run `dd` write and read tests on your system disk. Note the speeds.
2. Drop the page cache and repeat the read test — compare the two results to see how large the cache effect is.
3. Install `hdparm` and run `-t` three times on your main disk. Do the results vary?
4. Install `fio` and compare sequential 1M block speed vs random 4K IOPS. Explain the difference.
5. Open `iotop` in one terminal, then copy a large file in another. Watch which process appears.

---

## Related

- [[Shell Basics]] - Shell fundamentals and config files
- [[Home]]

#linux #beginner #intermediate #shell
