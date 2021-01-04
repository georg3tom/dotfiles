note () {
  local dir="/home/$USER/Documents/notes"
  local dateToday=$(date '+%d-%m-%y')
  local ext=".md"
  local fileName="${dateToday}${ext}"
  pushd "$dir" >> /dev/null
  if [ -d $1 ]
  then
      vim "$1/$fileName"
  else
      echo -n "Create dir $dir/$1(Y/y): "
      read  yn
      if [ "$yn" = "Y" ] || [ "$yn" = "y" ]
      then
          md $1
          vim "$1/$fileName"
      fi
  fi
  popd >> /dev/null
}
