#!/bin/bash -x
#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
set +x && test "$debug" = true && set -x 				;
#########################################################################
export debug=$debug							;
#########################################################################
folders=" configs secrets " 						;
for folder in $folders 							;
do 									\
  sudo rm --recursive --force --verbose /$folder 			;
done 									;
#########################################################################
