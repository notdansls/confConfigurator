#!/bin/bash

# This is a script to assist with configuring shit
#
# Change log
# +---------+------------------------------------------------------------------------------------+------------+
# | Version | Change                                                                             | ISO Date   |
# +---------+------------------------------------------------------------------------------------+------------+
# |    0.00 | Initial version                                                                    | 2020-11-06 |
# |         |  + New file so no changes have been comitted yet.                                  |            |
# |         |    - function to include config files                                              |            | 
# +---------+------------------------------------------------------------------------------------+------------+
#
# Configuration goes here
confConf=".config/configurator.conf"

# Functions go here...
convertDate(){
	# - grab the file name, append .bak and date in ISO 8601 format
	currentDate="$(date +%Y-%m-%d)"
	echo "new file name will be $1.bak.$currentDate"
}

getConfigFiles(){
	configurationFiles=('One' 'Two' 'Three' 'Four' 'Five' 'Six' 'Seven' 'Eight')
	echo "Array before addition"
	for i in "${configurationFiles[@]}"; do
		echo $i
	done
	echo ""
	echo "Now to add $1 to the array..."
	configurationFiles+=($1)
	echo "Now to view the array after the addition"
	for value in "${configurationFiles[@]}"; do
		echo $value
	done
}

initialize(){
	echo "Starting configuration script..."
	if [ ! -f $confConf ]; then
		touch $confConf
		initialize
	elif [ -f $confConf ]; then
		value=$(<$confConf)
		echo "$value"
	fi
}

addToconfConf(){
	#echo "Begin adding to $confConf."
	#echo "                          + you will be adding $1"
	echo $1 >> $confConf
	importconfConf
}

importconfConf(){
	confImported=$(<$confConf)
	
	x=1
	for i in "${confImported[@]}"; do
		#echo "${x} $i"
		echo $x
		#$x=$x+1
		#$x++
		x=$(($x + 1))
	done
}


# Code goes here...
initialize

# add to conf...
echo -n "What configuration file would you like to add: "
read addition
#echo $addition

addToconfConf $addition

#fileName="file.conf"
#convertDate $fileName
#getConfigFiles "tingle"
