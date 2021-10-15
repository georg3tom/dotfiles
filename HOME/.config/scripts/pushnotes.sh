#! /bin/sh

cd /home/$USER/Documents/notes/
dateToday=$(date '+%d-%m-%y')

msg="Automated push - $dateToday"
git add .
git commit -m "$msg"
git push
