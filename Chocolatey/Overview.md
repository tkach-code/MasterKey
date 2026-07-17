# Chocolatey Overview

Chocolatey is a command-line package manager for Windows. It installs, upgrades, and uninstalls software from a central repository, so you can manage applications the same way you would with `apt` on Linux or `brew` on macOS.

> Most commands change system-wide software, so run them in a terminal with **administrator rights**.

## Manage Software

| Command | Description | Example |
|---------|-------------|---------|
| `choco install <app>` | Install a package | `choco install git` |
| `choco upgrade <app>` | Upgrade a single package | `choco upgrade git` |
| `choco upgrade all` | Upgrade every installed package | `choco upgrade all` |
| `choco uninstall <app>` | Remove a package | `choco uninstall git` |
| `choco list --local-only` | List installed packages | `choco list --local-only` |
| `choco search <term>` | Find packages in the repository | `choco search vim` |

```powershell
# Upgrade all installed packages
choco upgrade all

# Install an app
choco install app-name

# Uninstall an app
choco uninstall app-name
```

## Export / Import

Chocolatey can save your installed packages to a `packages.config` file and reinstall them later — handy for setting up a new machine.

```powershell
# Export the list of installed apps to a file
choco export
# or specify an output path
choco export -o="'c:\packages.config'"

# Install every app listed in the file
choco install packages.config
```

## Related

- [[Shell Basics]] - the terminal Chocolatey runs in
- [[WezTerm Overview]] - a terminal you might install with Chocolatey
- [[Git Setup and Config]] - install Git via `choco install git`
- [[Home]]

#chocolatey #beginner
