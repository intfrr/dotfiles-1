# Set up SSH Keys

```
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -C "al.johri@gmail.com"
    eval "$(ssh-agent -s)"
    ssh-add "$HOME/.ssh/id_rsa"
    pbcopy < "$HOME/.ssh/id_rsa.pub"
    # open https://github.com/settings/ssh
fi
```