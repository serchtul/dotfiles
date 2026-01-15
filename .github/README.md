# Sergio's Dotfiles

This repository contains my dotfiles.

As you may notice from the files, the following software is required:

- git (duh)
- zsh (with [oh-my-zsh](https://ohmyz.sh/))
- [Homebrew](https://brew.sh/)

These files are tracked locally using a **bare git repository**, so I don't have to turn my whole home directory into a repo (or create symlinks everywhere with [stow](https://www.gnu.org/software/stow/)). I took inspiration from this [article by Greg Owen](https://stegosaurusdormant.com/bare-git-repo), so it's worth a read if you want more context.

## Setup

To set up these dotfiles on a new machine:

1. Clone the repository. The bare repo and the working tree should be [separate](https://git-scm.com/docs/git-clone#Documentation/git-clone.txt-code--separate-git-dirltgit-dirgtcode)

```bash
cd
git clone --separate-git-dir=$HOME/dotfiles <github-url> dotfiles-tmp
```

2. Configure the bare repo to not show untracked files in its status

```bash
git --git-dir=$HOME/dotfiles --work-tree=$HOME config status.showUntrackedFiles no
```

3. Copy the contents of the temporary folder to your home directory:

```bash
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
```

4. Remove the temporary directory:

```bash
rm -rf dotfiles-tmp
```

## Adding and Committing Changes from your Machine

The `.zshrc` file includes two simple functions (`dotfiles`, `undotfiles`) that set up the correct git directory and working tree. This allows us to work with the bare repo using your usual git commands (and/or aliases).

After setting up your dotfiles bare repo, you can commit changes to your dotfiles as follows:

1. Configure git to work with your dotfiles repo

```bash
dotfiles
```

**Note:** This assumes you are not using neither the `GIT_DIR` nor the `GIT_WORK_TREE` environment variables for any other purpose. Calling this function will override both of them.

2. Do all relevant `git`-ing related to your dotfiles, for example:

```bash
git add -u # -u Updates all *tracked* files only
git commit -m "a commit message"
git push
```

**Important:** Don't use `git add .`, this will add **all the files** in your home directory (instead of only the tracked ones) to the staging area!

3. Revert git's config to its usual defaults

```bash
undotfiles
```
