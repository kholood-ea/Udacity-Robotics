#!/bin/sh

# export ROBOT_INITIAL_POSE="-x -4.0 -y -4.0 -Y -3.114166"

xterm -e "roslaunch turtlebot_gazebo turtlebot_world.launch" & 
sleep 5

xterm -e "roslaunch turtlebot_gazebo amcl_demo.launch" & 
sleep 5

xterm -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep ß5

xterm -e "rosrun pick_objects pick_objects" &
