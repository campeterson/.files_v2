if [ ! -d "$HOME/.tmp" ]; then
  mkdir $HOME/.tmp
fi

if [ $# -eq 0 ]; then
  files=`ls | grep -v 'setup.sh' | grep -v '.gitignore' | grep -v 'README.md' | grep -v '.gitmodules' | grep -v 'useful_commands.md'`
else
  files=$@
fi

for file in $files; do
  if [ -e "$HOME/.$file" ]; then
    echo ".$file exists ... skipping"
  else
    echo "linking $file"
    ln -s `pwd`/$file $HOME/.$file
  fi
done
