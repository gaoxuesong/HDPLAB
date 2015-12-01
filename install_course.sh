#!/bin/bash
#
# The install_course.sh script pulls a repository from GitHub and 
# then executes a series of commands to build a classroom lab environment.
#
# This script must be executed as root.
#
# The argument passed in is provided to you in the course setup guide.

if [ $# -lt 1 ]
  then
    echo "Usage: install_course.sh <course_id>"
    exit
fi

# Pull the course files from GitHub
echo "Downloading course files for $1..."
if [ -d "$1" ]; then
        echo "Refreshing $1 repository"
        cd "$1"
        git reset HEAD --hard
        git pull
        cd ..
else
        echo "Cloning $1 repository"    
        git clone git://github.com/HortonworksUniversity/$1.git
fi

# Build the Docker images
cd $1
./build.sh $1

echo "Course $1 is now installed"
