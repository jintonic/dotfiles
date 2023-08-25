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

## Exclude certain dot files

There is no need to check out [.minttyrc](.minttyrc) when you are in a Mac terminal. You need to enable [sparse checkout](https://git-scm.com/docs/git-sparse-checkout) to exclude it from being checked out:

```sh
git sparse-checkout set
```

This will add the following two lines in `.git/config`:

```
[core]
  sparseCheckout = true
```

Then run

```sh
git sparse-checkout add '/*'
```

to add `/*` to `.git/info/sparse-checkout` to white list everything, and run

```sh
git sparse-checkout add '!.minttyrc'
```

to add `!.minttyrc` to `.git/info/sparse-checkout` to avoid checking it out. This will also immediately remove [.minttyrc](.minttyrc) from your working directory. You can use

```sh
git sparse-checkout list
```

to print out the content of `.git/info/sparse-checkout`.

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
