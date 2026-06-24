# SSH Overview

SSH (Secure Shell) is a protocol for securely logging into and running commands on a remote machine over an encrypted connection. It's how you get a terminal on a Linux server from anywhere.

## Client and Server

```
Your machine (client)  --ssh-->  Linux server (sshd)
   ~/.ssh/id_ed25519                 ~/.ssh/authorized_keys
   (private key, secret)             (public keys, allowed to log in)
```

- The **server** runs the `sshd` daemon and listens on port 22 by default.
- The **client** is the `ssh` command you run from your terminal (works the same from WezTerm/PowerShell on Windows, or any Unix shell).
- Authentication can be by **password** or by **key pair** — keys are faster, scriptable, and what you want for passwordless login.

## Quick Connect (password auth, the default first time)

```bash
ssh username@server-ip-or-hostname

# Custom port
ssh -p 2222 username@server-ip

# Run a single command without opening a shell
ssh username@server-ip "uptime"
```

## Connecting from Windows

Windows 10/11 ships an OpenSSH **client** out of the box, so `ssh` works natively from PowerShell, Windows Terminal, or [[WezTerm Overview|WezTerm]] — no PuTTY or third-party tool required.

```powershell
# Confirm the client is installed
ssh -V

# If it's missing, add the optional feature (run as Administrator)
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Connect exactly like on Linux
ssh username@server-ip-or-hostname

# Custom port
ssh -p 2222 username@server-ip
```

The first connection prompts to confirm the server's host key fingerprint — type `yes` to trust it; this is recorded in `$env:USERPROFILE\.ssh\known_hosts`. Everything downstream (passwordless login, `~/.ssh/config` aliases, `ssh-agent`) works the same way as on Linux, just rooted at `$env:USERPROFILE\.ssh\` instead of `~/.ssh/`.

## Why Switch to Key-Based Auth

- No password prompts — essential for scripts, cron jobs, CI
- Stronger than most passwords, and can be passphrase-protected itself
- Lets you disable password auth on the server entirely (much safer against brute force)

## Learning Path

1. [[SSH Key Generation]] — create a key pair and understand which half goes where
2. [[SSH Passwordless Login]] — install your public key on the server and connect with no prompt
3. [[SSH Config and Troubleshooting]] — host aliases, agent setup, and fixing common errors

## Related

- [[Git Setup and Config]] - SSH keys for GitHub/GitLab specifically
- [[Shell Basics]] - the shell you land in after connecting
- [[Home]]

#ssh #beginner
