#!/bin/bash
scriptRootFolder=`pwd`/..
. $scriptRootFolder/common/commonFunctions
appName="Catfish"
logFile="catfish.log"

########################################################################################################################
# MAIN
########################################################################################################################
prepareScript "$scriptRootFolder" "$logFile"
installAndSetupApplications $appName
