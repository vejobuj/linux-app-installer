##########################################################################
# This script contains common variables used by installation scripts or
# subscripts. Also, it checks if the script is being running like root
# user.
#
# Author: César Rodríguez González
# Version: 1.0
# Last modified date (dd/mm/yyyy): 09/05/2014
# Licence: MIT
##########################################################################

########################################################################################################################
# Variables
########################################################################################################################
if [ "$2" != "" ]; then
	# username is passed by second parameter
	username="$2"
else
	username=`whoami`
fi
if [ "$username" == "root" ]; then
	homeFolder="/root"
else
	homeFolder="/home/$username"
fi
if [ "$3" != "" ]; then
	desktop="$3"
fi
homeDownloadFolder="$homeFolder/`cat $homeFolder/.config/user-dirs.dirs | grep "XDG_DOWNLOAD_DIR" | awk -F "=" '{print $2}' | tr -d '"' | awk -F "/" '{print $2}'`"

########################################################################################################################
# Check if the script is being running like root user (root user has id equal to 0)
########################################################################################################################
if [ $(id -u) != 0 ]
then
	echo ""
	echo "This script must be executed by a root or sudoer user"
	echo ""
	exit 1
fi
