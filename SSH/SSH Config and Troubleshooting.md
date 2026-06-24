# SSH Config and Troubleshooting

Once passwordless login works ([[SSH Passwordless Login]]), `~/.ssh/config` removes the need to remember IPs, usernames, and key paths — and `ssh-agent` removes the need to retype a key passphrase.

## `~/.ssh/config` — Host Aliases

Create/edit on your **client**:

```sshconfig
# ~/.ssh/config

Host myserver
    HostName 192.168.1.50
    User andrii
    Port 22
    IdentityFile ~/.ssh/id_ed25519

Host work-box
    HostName work.example.com
    User andrii
    Port 2222
    IdentityFile ~/.ssh/id_ed25519_work
```

Now connect with just:

```bash
ssh myserver
```

No IP, no username, no `-i` flag needed — and the same alias works for `scp myserver:/path/file .` too.

## `ssh-agent` — Stop Retyping Your Passphrase

If your private key has a passphrase, the agent caches it in memory for the session.

```bash
# Start the agent (often already running on macOS/Linux desktop sessions)
eval "$(ssh-agent -s)"

# Add your key — prompts for the passphrase once
ssh-add ~/.ssh/id_ed25519

# List keys currently loaded
ssh-add -l
```

On Windows (PowerShell), the OpenSSH Authentication Agent service does the same job:

```powershell
Get-Service ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent
ssh-add $env:USERPROFILE\.ssh\id_ed25519
```

## Copying Files: `scp` and `rsync`

```bash
# Copy a file to the server
scp localfile.txt myserver:/home/andrii/

# Copy a directory recursively from the server
scp -r myserver:/home/andrii/project ./project

# Better for large/incremental transfers
rsync -avz ./project/ myserver:/home/andrii/project/
```

These use the same key and config alias as `ssh` automatically.

## Common Errors and Fixes

| Error | Cause | Fix |
|---|---|---|
| `Permission denied (publickey).` | Key not authorized, or offering the wrong key | Confirm `authorized_keys` on server; use `-i path/to/key` or fix `~/.ssh/config` |
| `WARNING: UNPROTECTED PRIVATE KEY FILE!` | Private key permissions too open | `chmod 600 ~/.ssh/id_ed25519` |
| `REMOTE HOST IDENTIFICATION HAS CHANGED!` | Server's host key changed (reinstall, IP reuse) — **or** a real MITM | If expected, remove the stale line: `ssh-keygen -R server-ip` then reconnect and verify the new fingerprint out-of-band |
| Connection just hangs | Firewall blocking the port, or `sshd` not running | `sudo systemctl status sshd` on server; check security group / firewall rules |
| `Too many authentication failures` | Too many keys offered before the right one | Add `IdentitiesOnly yes` under the `Host` entry in `~/.ssh/config` |
| Connects but drops instantly | Shell misconfigured for that user, or account locked | Check `/etc/passwd` shell field and account status on server |

## Diagnostic Commands

```bash
# Verbose client output (add more -v for more detail, up to -vvv)
ssh -v username@server-ip

# Check what the server is actually listening on
sudo ss -tlnp | grep ssh        # run on the server

# Confirm sshd is running and see recent auth attempts
sudo systemctl status sshd
sudo journalctl -u sshd -n 50   # or /var/log/auth.log on some distros
```

## Exercises

1. Add a `Host` entry to `~/.ssh/config` for a server you use and connect with the short alias.
2. Start `ssh-agent`, add a passphrase-protected key, and confirm a second `ssh` connection doesn't reprompt.
3. Intentionally connect with the wrong key (`-i`) and read the `-v` output to see where it fails.

## Related

- [[SSH Passwordless Login]] - the setup this builds on
- [[SSH Key Generation]] - generating additional keys per host
- [[Tmux Sessions]] - keeping a remote session alive after you disconnect
- [[Home]]

#ssh #intermediate
