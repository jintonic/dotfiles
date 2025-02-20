## Initialize a new home environment

```sh
cd ~
git init
git remote add origin git@github.com:jintonic/dotfiles.git
git fetch --depth 1
git checkout master
git submodule update --init
```

Log out and log back in to feel like \$HOME

## Machine-specific settings

Machine-specific settings, such as `export PATH=~/geant4/11.3.0/bin`, can go to `~/.zshenv`, which is not included in this repository. `~/.zshenv` will be sourced before `~/.zshrc`. Ref. <https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/>.

For bash, local settings should be in `~/.bash_local`, which is also not included in this repository.

### Exclude certain files

There is no need to check out [.minttyrc](.minttyrc) when you are in a Mac terminal. You need to enable [sparse checkout](https://git-scm.com/docs/git-sparse-checkout) to exclude it from being checked out:

```sh
git sparse-checkout set --no-cone '/*' '!*.slurm' '!.bashrc' '!.profile' '!.minttyrc'
```

This will add the following lines in `.git/config.worktree`:

```
[core]
    sparseCheckout = true
    sparseCheckoutCone = false
[index]
    sparse = false
```

and the following patterns in `.git/info/sparse-checkout`:

```sh
/*
!*.slurm
!.bashrc
!.profile
!.minttyrc
```

The first line white lists everything. Other lines exclude specific files. You can use

```sh
git sparse-checkout list
```

to print out the content of `.git/info/sparse-checkout`.

Note that sparse checkout by default is in the *cone* mode, which expects ONLY existing folders in `.git/info/sparse-checkout`. In order to use exclusion patterns in this file, the `--no-cone` option has to be used. However, the *no-cone* mode is discouraged by git due to performance concerns, which is not important for such a small repository.

## Vim plugins

List all existing plugins: `cat ~/.gitmodules`.

Add a plugin:
```sh
git submodule add --depth 1 https://github.com/tpope/vim-unimpaired .vim/pack/age/start/vim-unimpaired
git config -f .gitmodules submodule..vim/pack/age/start/vim-unimpaired.shallow true
git commit -am 'added vim plugin unimpared'
git push
```

Update plugins:
```sh
git submodule update --remote
git commit -am 'updated plugins'
```

Remove a plugin (a git [submodule][]):
```sh
git submodule deinit .vim/pack/age/start/vim-unimpaired
git rm .vim/pack/age/start/vim-unimpaired
git commit -m 'removed vim plugin unimpaired'
```

[submodule]: https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule

