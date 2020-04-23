#!/bin/bash
#===============================================================================
#
#          FILE:  euroformix_install.sh
#
#         USAGE:  ./euroformix_install.sh
#
#   DESCRIPTION:  EuroForMix and CaseSolver installation script
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Adam Michaleas (), adam.michaleas@ll.mit.edu
#       COMPANY:  MIT Lincoln Laboratory
#       VERSION:  1.0
#       CREATED:  09/14/2018 12:20:51 PM EDT
#      REVISION:  ---
#===============================================================================

DISTRIBUTION STATEMENT A. Approved for public release. Distribution is unlimited.

This material is based upon work supported by the United States Air Force under Air Force Contract No. FA8702-15-D-0001. Any opinions, findings, conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the United States Air Force.

© 2019 Massachusetts Institute of Technology.

The software/firmware is provided to you on an As-Is basis

Delivered to the U.S. Government with Unlimited Rights, as defined in DFARS Part 252.227-7013 or 7014 (Feb 2014). Notwithstanding any copyright notice, U.S. Government rights in this work are defined by DFARS 252.227-7013 or DFARS 252.227-7014 as detailed above. Use of this work other than as specifically authorized by the U.S. Government may violate any copyrights that exist in this work.



### Global Variable Declarations ###

YUM_PKGS=`yum install -y libcurl libcurl-dev xorg-x11-xauth xorg-x11-server-dev libX11-dev libXt-dev chromedriver chromium xorg-x11-server-Xvfb tk tcl tk-dev tcl-dev`
R_DIR=$PWD/R-3.6.2/
R_INSTALL_LOC=/usr/local
EFM_DIR=/data



### Install EuroForMix prerequisite system dependencies ###

echo "";
echo "Installing pre-requisite requirements for Euroformix..."
echo "";

$YUM_PKGS

echo "";


### Install R 3.6.2 from source in $R_INSTALL_LOC ###

tar -xvf $PWD/R-3.6.2.tar.gz
cd $R_DIR && ./configure --prefix=$R_INSTALL_LOC
cd $R_DIR && make
cd $R_DIR && make install


### Install all pre-requisite R dependencies for EuroForMix ###

xvfb-run $R_INSTALL_LOC/bin/R --no-save -e "install.packages('gWidgetstcltk', repos='http://cran.rstudio.com')"
xvfb-run $R_INSTALL_LOC/bin/R --no-save -e "install.packages('gWidgets2tcltk', repos='http://cran.rstudio.com')"
xvfb-run $R_INSTALL_LOC/bin/R --no-save -e "install.packages('Rcpp', repos='http://cran.rstudio.com')"
xvfb-run $R_INSTALL_LOC/bin/R --no-save -e "install.packages('BH', repos='http://cran.rstudio.com')"
xvfb-run $R_INSTALL_LOC/bin/R --no-save -e "install.packages('RcppArmadillo', repos='http://cran.rstudio.com')"
xvfb-run $R_INSTALL_LOC/bin/R --no-save -e "install.packages('forensim', repos='http://cran.rstudio.com')"
xvfb-run $R_INSTALL_LOC/bin/R --no-save -e "install.packages('cubature', repos='http://cran.rstudio.com')"
xvfb-run $R_INSTALL_LOC/bin/R --no-save -e "install.packages('snow', repos='http://cran.rstudio.com')"


### Build the Euroformix package to be installed into R ###

cd $EFM_DIR && unzip euroformix-master.zip
cd $EFM_DIR/euroformix-master && $R_INSTALL_LOC/bin/R CMD build euroformix_2.2.1 .
cd $EFM_DIR/euroformix-master && $R_INSTALL_LOC/bin/R CMD INSTALL build euroformix_2.2.1.tar.gz


### Install casesolver 1.5.0 ###

cd $EFM_DIR && unzip casesolver_1.5.0.zip
cd $EFM_DIR && $R_INSTALL_LOC/bin/R CMD INSTALL -l $R_INSTALL_LOC/lib64/R/library casesolver
