# SSH Passwordless Login

Once you have a key pair ([[SSH Key Generation]]), the server needs your **public** key in its `authorized_keys` file before it will let you in without a password.

## Method 1: `ssh-copy-id` (easiest)

Run this from your **client**, pointing at the Linux server. It will ask for your password once, then install the key for you:

```bash
ssh-copy-id username@server-ip

# Custom port
ssh-copy-id -p 2222 username@server-ip

# Specific key (if you have more than one)
ssh-copy-id -i ~/.ssh/id_ed25519.pub username@server-ip
```

Under the hood this appends your `.pub` contents to `~/.ssh/authorized_keys` on the server and fixes permissions for you.

## Method 2: Manual Copy (when `ssh-copy-id` isn't available, e.g. Windows without it installed)

```bash
# 1. Print your public key on the client
cat ~/.ssh/id_ed25519.pub
```

```bash
# 2. Log into the server (password auth, this one time)
ssh username@server-ip

# 3. On the server: create the .ssh dir if needed, then append the key
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo "ssh-ed25519 AAAA...your...public...key... andtkach@gmail.com" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

> Use `>>` (append), never `>` (overwrite) — `>` would destroy any other keys already authorized on that account.

### One-liner from the client (no manual paste)

```bash
cat ~/.ssh/id_ed25519.pub | ssh username@server-ip "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
```

## Method 3: From Windows (PowerShell) — No `ssh-copy-id`

Windows' built-in OpenSSH client doesn't ship `ssh-copy-id`, so do the equivalent in one PowerShell line:

```powershell
Get-Content $env:USERPROFILE\.ssh\id_ed25519.pub | ssh username@server-ip "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
```

This still types your server password once (it's the password-auth fallback doing the install), then `ssh username@server-ip` afterward connects with no prompt.

If you'd rather do it by hand:

```powershell
# 1. Print your public key
Get-Content $env:USERPROFILE\.ssh\id_ed25519.pub

# 2. SSH into the server (password auth, this one time) and paste it into authorized_keys
ssh username@server-ip
#   mkdir -p ~/.ssh && chmod 700 ~/.ssh
#   echo "ssh-ed25519 AAAA...your...public...key..." >> ~/.ssh/authorized_keys
#   chmod 600 ~/.ssh/authorized_keys
```

## Test the Passwordless Connection

```bash
ssh username@server-ip
```
	
You should land in a shell with **no password prompt** (a passphrase prompt for the key itself is normal if you set one — see `ssh-agent` below to avoid retyping it).

## If It Still Asks for a Password

Run with verbose output to see why:

```bash
ssh -v username@server-ip
```

Common causes, in order of likelihood:

| Symptom in `-v` output | Fix |
|---|---|
| `Permissions 0644 for '~/.ssh/id_ed25519' are too open` | `chmod 600 ~/.ssh/id_ed25519` on the **client** |
| Server's `~/.ssh` or `~/.ssh/authorized_keys` perms wrong | `chmod 700 ~/.ssh` and `chmod 600 ~/.ssh/authorized_keys` on the **server** |
| `Offering public key` then `Authentications that can continue: password` | Key not in server's `authorized_keys`, or wrong key offered (`-i` to specify) |
| Wrong owner on server's `~/.ssh` | `chown -R username:username ~/.ssh` on the **server** |
| `PubkeyAuthentication no` in `/etc/ssh/sshd_config` | Enable it on the server (see below) and restart `sshd` |

## Server-Side: Confirm Key Auth Is Enabled

On the Linux server, check `/etc/ssh/sshd_config`:

```
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
```

Restart after changes:

```bash
sudo systemctl restart sshd
```

## Optional Hardening: Disable Password Login Entirely

Only do this **after** confirming key login works — otherwise you can lock yourself out.

```
# /etc/ssh/sshd_config
PasswordAuthentication no
```

```bash
sudo systemctl restart sshd
```

## Exercises

1. Use `ssh-copy-id` (Linux/macOS) or the PowerShell one-liner (Windows) to install your key on a test server and connect without a password.
2. Deliberately `chmod 644` your private key, observe the failure with `ssh -v`, then fix it.
3. Add a second public key (e.g. from another machine) to the same `authorized_keys` and confirm both can log in.

## Related

- [[SSH Key Generation]] - creating the key pair this depends on
- [[SSH Config and Troubleshooting]] - host aliases and `ssh-agent` for passphrase-protected keys
- [[Home]]

#ssh #intermediate
