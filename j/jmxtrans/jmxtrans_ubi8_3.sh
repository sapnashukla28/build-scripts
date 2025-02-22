# ----------------------------------------------------------------------------
#
# Package       : jmxtrans
# Version       : jmxtrans-parent-272
# Source repo   : https://github.com/jmxtrans/jmxtrans
# Tested on     : UBI 8.3
# Script License: MIT License
# Maintainer    : Varsha Aaynure <Varsha.Aaynure@ibm.com>
#
# Disclaimer: This script has been tested in root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#
# ----------------------------------------------------------------------------

#!/bin/bash

#Variables
PACKAGE_URL=https://github.com/jmxtrans/jmxtrans.git
PACKAGE_VERSION=jmxtrans-parent-272

echo "Usage: $0 [<PACKAGE_VERSION>]"
echo "PACKAGE_VERSION is an optional parameter whose default value is jmxtrans-parent-272, not all versions are supported."

PACKAGE_VERSION="${1:-$PACKAGE_VERSION}"

yum update -y 

#Install required files
yum install -y git maven

#Cloning Repo
git clone $PACKAGE_URL
cd jmxtrans/
git checkout $PACKAGE_VERSION

#Build and test package
mvn install

echo "Complete!"
