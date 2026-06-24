# SSH Key Generation

An SSH key is a **pair** of files: a private key (secret, never shared) and a public key (safe to copy anywhere). Generate the pair once on your **client** machine — the one you connect *from*.

## Generate the Pair

```bash
# Recommended: Ed25519 (modern, fast, short keys)
ssh-keygen -t ed25519 -C "andtkach@gmail.com"

# If you must support very old servers: RSA 4096
ssh-keygen -t rsa -b 4096 -C "andtkach@gmail.com"
```

You'll be prompted for:

```
Enter file in which to save the key (/home/you/.ssh/id_ed25519):  [Enter accepts default]
Enter passphrase (empty for no passphrase):                       [optional extra protection]
```

Pressing Enter at the file prompt uses the default location and filename. A passphrase encrypts the private key at rest — recommended, paired with `ssh-agent` (see [[SSH Config and Troubleshooting]]) so you don't retype it constantly.

## What You Get

```bash
~/.ssh/id_ed25519          # PRIVATE key — stays on the client, never leaves it
~/.ssh/id_ed25519.pub      # PUBLIC key  — safe to copy to any server
```

## Where Does Each File Go?

```
CLIENT (your laptop / WezTerm terminal)        SERVER (the Linux box you SSH into)
─────────────────────────────────────          ──────────────────────────────────
~/.ssh/id_ed25519      (private, KEEP HERE)    ~/.ssh/authorized_keys
~/.ssh/id_ed25519.pub  (public, copy it →) ───▶ (paste the .pub contents here, one per line)
```

> **Key rule:** the private key never gets copied to the server. Only the contents of the `.pub` file go into the server's `authorized_keys`. See [[SSH Passwordless Login]] for that step.

## Generating a Key *On* a Linux Server

If you want the **server itself** to act as a client elsewhere (e.g., the server needs to `git pull` over SSH, or `ssh` into a third machine), generate the pair directly on it the same way:

```bash
# Run on the Linux server
ssh-keygen -t ed25519 -C "server-to-thirdhost"
cat ~/.ssh/id_ed25519.pub   # copy this to the THIRD machine's authorized_keys
```

The logic doesn't change — whichever machine initiates the connection is the "client" and holds the private key; whichever machine accepts the connection is the "server" and holds the matching public key in `authorized_keys`.

## Generating a Key on Windows (PowerShell)

Windows 10/11 ships OpenSSH client built in, so `ssh-keygen` works the same way in PowerShell — no extra install needed.

```powershell
# Check it's installed (should print a version, e.g. OpenSSH_for_Windows_9.x)
ssh -V

# If missing, install the optional Windows feature
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
```

```powershell
# Generate the pair — same flags as Linux
ssh-keygen -t ed25519 -C "andtkach@gmail.com"
```

```
Enter file in which to save the key (C:\Users\Andrii/.ssh/id_ed25519):  [Enter accepts default]
Enter passphrase (empty for no passphrase):
```

## Where the Files Live on Windows

```powershell
$env:USERPROFILE\.ssh\id_ed25519        # PRIVATE key
$env:USERPROFILE\.ssh\id_ed25519.pub    # PUBLIC key

# Print the public key to copy it
Get-Content $env:USERPROFILE\.ssh\id_ed25519.pub
```

Same rule as Linux applies: this `.pub` content goes into the Linux server's `~/.ssh/authorized_keys`; the private key stays on the Windows machine. See [[SSH Passwordless Login]] for the Windows-specific copy step (PowerShell doesn't ship `ssh-copy-id`).

## File Permissions Matter

SSH refuses to use keys/files with overly permissive access. Set these on **both** client and server:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/authorized_keys
```

## Viewing / Re-printing Your Public Key

```bash
cat ~/.ssh/id_ed25519.pub
```

Output looks like:

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx andtkach@gmail.com
```

That whole line is what gets pasted into `authorized_keys` on the server.

## Exercises

1. Generate an Ed25519 key pair with a passphrase.
2. Run `ls -la ~/.ssh` (Linux) or `Get-Item $env:USERPROFILE\.ssh\id_ed25519` (Windows) and confirm the permissions match the table above.
3. Print your public key with `cat` (Linux) or `Get-Content` (PowerShell) and identify the three parts: algorithm, key data, comment.

## Related

- [[SSH Overview]] - client/server model
- [[SSH Passwordless Login]] - what to do with the public key next
- [[Git Setup and Config]] - using the same kind of key pair for GitHub
- [[Home]]

#ssh #beginner
