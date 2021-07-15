#!/bin/sh

xterm -e "roslaunch turtlebot_gazebo turtlebot_world.launch" & 
sleep 5

xterm -e "roslaunch turtlebot_gazebo amcl_demo.launch" & 
sleep 5
xterm -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5
<<<<<<< HEAD
xterm -e "source devel/setup.bash; rosrun pick_objects pick_objects"
=======

xterm -e "source devel/setup.bash; rosrun pick_objects pick_objects" 
>>>>>>> 7050df1b03c3366e471aa0639453403fa9ff59e7
