#!/bin/bash
#
# Author  : Perry Driscoll - https://github.com/PezzaD84
# Created : 25/4/2023
# Updated : 25/4/2023
# Version : v1
#
#########################################################################################
# Description:
#			  Extension attribute to display the creation date of the LAPS account
#
#########################################################################################
# Copyright © 2023 Perry Driscoll <https://github.com/PezzaD84>
#
# This file is free software and is shared "as is" without any warranty of 
# any kind. The author gives unlimited permission to copy and/or distribute 
# it, with or without modifications, as long as this notice is preserved. 
# All usage is at your own risk and in no event shall the authors or 
# copyright holders be liable for any claim, damages or other liability.
#########################################################################################

LAPSLOG="/Library/.LAPS/Logs/LAPS.log"

LAPS_CREATION=$(grep "LAPS Account creation" $LAPSLOG | tail -1 | awk '{print $5,$6}')

echo "<result>$LAPS_CREATION</result>"