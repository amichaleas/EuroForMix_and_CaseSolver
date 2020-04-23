#===============================================================================
#
#          FILE:  README.txt
#
#
#   DESCRIPTION:  EuroForMix and Casesolver Singularity Container README.txt
#
#        AUTHOR:  Adam Michaleas (), adam.michaleas@ll.mit.edu
#        AUTHOR:  Philip Fremont-Smith (), philip.fremont-smith@ll.mit.edu
#        AUTHOR:  Darrell Ricke (), darrell.ricke@ll.mit.edu
#       COMPANY:  MIT Lincoln Laboratory
#       VERSION:  1.0
#       CREATED:  01/08/2020 13:30 PM EDT
#      REVISION:  ---
#===============================================================================

DISTRIBUTION STATEMENT A. Approved for public release. Distribution is unlimited.

This material is based upon work supported by the United States Air Force under Air Force Contract No. FA8702-15-D-0001. Any opinions, findings, conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the United States Air Force.

© 2019 Massachusetts Institute of Technology.

The software/firmware is provided to you on an As-Is basis

Delivered to the U.S. Government with Unlimited Rights, as defined in DFARS Part 252.227-7013 or 7014 (Feb 2014). Notwithstanding any copyright notice, U.S. Government rights in this work are defined by DFARS 252.227-7013 or DFARS 252.227-7014 as detailed above. Use of this work other than as specifically authorized by the U.S. Government may violate any copyrights that exist in this work.

### Installed Software versions ###

R=3.6.2
EuroForMix=2.2.1
CaseSolver=1.5.0


### Instructions for Singularity 3.x ###
 
### To build the EuroForMix and CaseSolver Singularity container ###

singularity build EuroForMix.sif EuroForMix.def

### To run EuroForMix/CaseSolver using local data and making it available to the Singularity container ###

singularity shell -B <$LOCAL_PATH_TO_DATA>:<$PATH_TO_CONTAINER> $CONTAINER_FILE_NAME

Ex. singularity shell -B /data/EuroForMix_Data:/data EuroForMix.sif

*This would logically map the /data/EuroForMix_Data directory on the system to the /data directory on the container*

### Instructions for running EuroForMix from within the Singularity container ###

After entering the Singularity container interactive shell, please perform the following steps to run EuroForMix:

Singularity EuroForMix.sif:~> R

> library('euroformix')
> efm()
Loading required package: gWidgets
Loading required package: tcltk
Loading required package: digest
>


### Instructions for running CaseSolver from within the Singularity container ###

After entering the Singularity container interactive shell, please perform the following steps to run EuroForMix:

Singularity EuroForMix.sif:~> R

> library('casesolver')
Loading required package: euroformix
> gui()
Loading required package: digest
Loading required package: memoise
Loading required package: tcltk
> 

