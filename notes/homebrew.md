# Attempt to reinstall Homebrew Package if options differ

```
# https://github.com/thoughtbot/laptop/issues/289
# http://stackoverflow.com/questions/8768420/how-to-convert-command-output-to-an-array-line-by-line-in-bash/8768435#8768435
# http://stackoverflow.com/questions/17988915/comparing-two-sorted-arrays/17989328#17989328

brew info php55 --json=v1 | jq --raw-output '.[0].linked_keg as $linked_keg | .[0].installed | map(select(.version == $linked_keg))[].used_options | sort | .[] | tostring'

IFS=$'\n'; used_options=( $(brew info php55 --json=v1 | jq --raw-output '.[0].linked_keg as $linked_keg | .[0].installed | map(select(.version == $linked_keg))[].used_options | sort | .[] | tostring') )

brew list -1 | while read line; do; echo $line; brew info $line --json=v1 | jq '.[0].linked_keg as $linked_keg | .[0].installed | map(select(.version == $linked_keg))[].used_options'; done

>> /dev/null; if [[ -z $(brew ls --versions coreutils) ]]; then brew install coreutils; fi

```