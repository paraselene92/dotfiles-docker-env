# dotfiles

## Requirement

* Vim 8.0  (https://github.com/Shougo/dein.vim)

## Usage
curl -o - https://raw.githubusercontent.com/paraselene92/dotfiles-docker-env/master/install.sh | bash

## How to deal encrypt files(.secret files)

## Decrypt

1. Import Private Key.

`gpg --import (privatekey)`

2. Decrypt Command.

```
cd .aws
git secret reveal *
```

## Update & re-Encrypt

1. Import Private Key.

`gpg --import (privatekey)`

2. Decrypt Command.

```
cd .aws
git secret reveal *
```

3. Update decrypt files.

4. re-Encrypt Command.

```
git secret add (encryptfile)
git secret hide
```

5. git push 

