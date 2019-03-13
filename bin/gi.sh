#! /bin/sh

function usage() {
    cat <<EOM
Usage: $0 [-p] tool

tool   Tool you use in the project (AppCode, PyCharm, and so on).
-p     Create a private repository.

EOM

    exit 1
}

while getopts ad:h OPT
do
    case $OPT in
        p) FLAG_P=1
           ;;
        h) usage
           ;;
    esac
done

CURRENT_DIR=$(pwd)
DIR_NAME=$(basename $CURRENT_DIR)

TOOL=$1

touch README.md
echo "# $DIR_NAME" >> README.md

cp ~/gitignores/$TOOL/.gitignore $CURRENT_DIR/.gitignore

git init
git add README.md .gitignore
git commit -m "\[Add] create README.md and .gitignore"

if [$FLAGP == 1]
then
    hub create -p $DIR_NAME
else
    hub create $DIR_NAME
fi

wait $!

git remote add origin git@github.com:ttsutchi/$DIR_NAME.git
git push -u origin master

echo "Git repository is successfully initialized."

