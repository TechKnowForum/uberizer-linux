#!/bin/bash
VER="1.0"
# ZDiR [beta]
# (C) 2013 Jakub Skrzypnik <skrzyp>
usage(){
  echo "ZDiR Lister v"$VER" by skrzyp for HcH's Uberizer"
	echo "Usage: list [-hftpl] [-i INPUT_TEXT] [-d DIR]"
	echo "Show files in selected (or current) directory in numbered list for pick, and export user's input as FILE variable"
	echo "Usable in scripts as frontend to selecting files"
	echo "Options:"
	echo "-h	- display this text"
	echo "-f	- show files only"
	echo "-t	- use TABs instead of spaces"
	echo "-l	- use full path in FILE variable"
	echo "-i TEXT   - use custon input prompt"
	echo "-d DIR	- list files from another directory";}
while getopts ":hftli:d:" OPTION; do
	case $OPTION in
	h) usage ; exit 1 ;;
	f) FONLY=1 ;;
	t) TABS=1 ;;
	l) FULL=1 ;;
	i) INPUT=$OPTARG ;;
	d) DIR=$OPTARG ;;
	\?) usage; exit 127 ;;
	esac
done
## MAGIC BEGINS ##
CT=0
LINES=$(tput lines)
if [[ -z $DIR ]]; then DIR=$PWD; fi
if [[ ! -x $DIR ]]; then echo "list: $DIR: directory not found"; exit 127; fi
if [[ -z $INPUT ]]; then INPUT="Pick file:"; fi
for F in $( if [[ -z $FONLY ]]; then ls -1 $DIR; else ls -l $DIR | grep ^- | awk '{print $9}'; fi); do
	FILES[$CT]=$F
	if [[ -z $TABS ]]; then echo $CT": "$F; else echo -e $CT":\t"$F; fi
	(( CT++ ))
	if [[ $CT -gt $LINES ]]; then read -sr; fi
done
until [[ $UI =~ ^[0-9]+$ ]]; do echo -n $INPUT" "; read UI; done
if [[ -z $FULL ]]; then FILE=${FILES[$UI]}; else FILE=$DIR"/"${FILES[$UI]}; fi
export FILE
echo $FILE
## END OF MAGIC ##
