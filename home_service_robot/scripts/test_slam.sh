#!/bin/sh
export TURTLEBOT_GAZEBO_WORLD_FILE="$(rospack find map_my_world)/worlds/kholood.world"
export ROBOT_INITIAL_POSE="-x 9.0 -y -2.3 -Y 0"

xterm -e "roslaunch turtlebot_gazebo turtlebot_world.launch" &  
sleep 5

xterm -e "roslaunch map_my_world gmapping.launch" &
sleep 5

xterm -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5

xterm -e "rosrun teleop_twist_keyboard teleop_twist_keyboard.py"


