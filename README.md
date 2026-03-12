# git-auto-sync

A simple **Bash script to automatically sync a local directory with a Git repository**.

The script will:

1. Pull the latest changes from the remote repository  
2. Detect any local file changes  
3. Commit the changes with a timestamp  
4. Push them to the remote repository  

This is useful for automatically syncing folders such as:

- Obsidian vaults
- Notes
- Documents
- Configuration files
- Any local project directory

---

## Features

- Automatic `git pull`
- Detects file changes
- Auto commit with date
- Auto push to remote
- Simple Bash script (no dependencies)

---

## Requirements

### 1. Git must be installed

```bash
git --version
````

### 2. The directory must be a Git repository

Run inside the folder you want to sync:

```bash
git init
```

Then connect your remote repository:

```bash
git remote add origin git@github.com:your-username/your-repo.git
```

---

## Important Setting

Git normally stops searching for repositories when crossing filesystem boundaries.

To allow the script to work properly, you must set:

```bash
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
```

### Make it permanent

Add this line to your shell configuration file.

For **Bash**:

```bash
nano ~/.bashrc
```

Add:

```bash
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
```

Reload your shell:

```bash
source ~/.bashrc
```

For **Zsh**:

Add the same line to:

```
~/.zshrc
```

---

## Configuration

Edit the variables inside the script:

```bash
REMOTE="origin"
BRANCH="main"
REMOTE_URL="git@github.com:your-username/your-repo.git"
DIR="/path/to/your/folder"
```

Example:

```bash
DIR="$HOME/Documents/Obsidian Vault"
```

---

## Usage

Run the script:

```bash
bash git-auto-sync.sh
```

The script will:

1. Change to the configured directory
2. Pull latest changes
3. Detect modifications
4. Commit changes
5. Push them to the remote repository

---

## Example Commit Message

```
commit on 12 March 2026
```

---

## Example Use Case

Sync an **Obsidian vault across multiple devices**:

* Laptop
* Desktop
* Work machine
* Server backup

Every time you run the script, your vault stays up to date.

---

## Repository Structure

```
git-auto-sync
├── git-auto-sync.sh
└── README.md
```

---
