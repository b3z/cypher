# GPG directory encryption

Import this snippet into your .zshrc

### Usage

Before first run:

```zsh
gpg --gen-key

# set name "cypher"
````
Important: The name you set should be "cypher". This key is then only used for this script.

```zsh
# Encrypt the directory "yourDir"
$ encrypt yourDir

# Decrypt "yourDir.cypher"
$ decrypt yourDir.cypher
````

### What happens?

On encryption the whole directory is packed into a .tar.gz.

This ball is then encrypted using gpg. The sideproducts and original directory are deleted.

Decryption works the other way around.
