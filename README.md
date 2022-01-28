## Initialize a new home environment

```sh
cd ~
git init
git remote add origin git@github.com:jintonic/dotfiles.git
git fetch --depth 1
git checkout master
```

Log out and log back in to feel like \$HOME

## Exclude certain files

There is no need to check out [.minttyrc](.minttyrc) when you are in a Mac terminal. You need to enable [sparse checkout](https://git-scm.com/docs/git-sparse-checkout) to exclude it from being checked out:

```sh
git sparse-checkout set
```

This will add the following two lines in `.git/config`:

```
[core]
  sparseCheckout = true
```
