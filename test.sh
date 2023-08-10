#! /usr/bin/env bash
a=$(cat package.json | grep 'version' | awk '{print $2}' | grep -Eo '[0-9a-z.-]+')
echo "$a "
echo b=$(echo $a | cut -d'.' -f3 | cut -d'-' -f1)
for item in {a..z};do
  if [ "${a:(-1)}" == "w" ]; then
     for item2 in {1..100}; do
       if [ "$b" == "$item2" ]; then
         echo "a"
    #     sed -i -E 's/(^"version")'
       fi
     done
  else
    if [ "${a:(-1)}" == "$item" ]; then
	  next_char=$(printf "\x$(printf %x $(($(printf %d "'$item") + 1)))")
      echo "$next_char"
      version=$(echo "$a" | grep -Eo [0-9.-]+)$next_char
      echo "$version"
      cat package.json | sed -E 's/("version":) (.+)/\1 "'${version}'"/' 
    fi
  fi
done
