cd

DIR="RobotProject"
if test -d $DIR; then
    cd "$DIR"
else
    mkdir $DIR
fi

cd $DIR

WS="practice_ws"

if test -d $WS; then
    cd "$WS"
else
    mkdir -p "$WS/src"
fi

cd $WS

catkin_make

cd src/


if [ -d "myrobot" ]; then
    echo "myrobot package exists already."
    cd ../
    catkin_make
else
    catkin_create_pkg myrobot urdf
fi

source devel/setup.bash

cd src/myrobot

if [ -d "urdf" ]; then
    echo "urdf directory exists already."
else
    mkdir "urdf"
fi

if [ -d "launch" ]; then
    echo "launch directory exists already."
else
    mkdir "launch"
fi

