#!/bin/bash -x
#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
export debug=$debug							;
export stack=$stack							;
#########################################################################
set +x && test "$debug" = true && set -x 				;
#########################################################################
pwd=$( dirname $( readlink -f $0 ) ) 					;
#########################################################################
test -z "$stack" && echo PLEASE DEFINE THE VALUE FOR stack && exit 1 	;
#########################################################################
git clone https://github.com/secobau/docker.git 			;
source docker/AWS/common/functions.sh 					;
rm --recursive --force docker 						;
#########################################################################
folders=" configs secrets " 						;
for folder in $folders 							;
do 									\
  command=" sudo rm --recursive --force --verbose /$folder ; " 		;
  targets=" InstanceManager1 " 						;
  for target in $targets 						;
  do 									\
    send_command "$command" "$target" "$stack" 				;
  done 									;
done 									;
#########################################################################
