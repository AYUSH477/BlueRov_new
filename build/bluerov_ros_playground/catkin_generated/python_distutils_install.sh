#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ayush/bluerov_auto/src/bluerov_ros_playground"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ayush/bluerov_auto/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ayush/bluerov_auto/install/lib/python2.7/dist-packages:/home/ayush/bluerov_auto/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ayush/bluerov_auto/build" \
    "/usr/bin/python2" \
    "/home/ayush/bluerov_auto/src/bluerov_ros_playground/setup.py" \
    build --build-base "/home/ayush/bluerov_auto/build/bluerov_ros_playground" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/ayush/bluerov_auto/install" --install-scripts="/home/ayush/bluerov_auto/install/bin"
