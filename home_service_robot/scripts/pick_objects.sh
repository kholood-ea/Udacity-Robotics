#!/bin/sh
export TURTLEBOT_GAZEBO_WORLD_FILE="$(rospack find map_my_world)/worlds/kholood.world"
export TURTLEBOT_GAZEBO_MAP_FILE="$(rospack find home_service_robot)/map/map.yaml"
export ROBOT_INITIAL_POSE="-x 2.0 -y 2.0 -Y 0"

xterm -e "roslaunch turtlebot_gazebo turtlebot_world.launch" & 
sleep 5

xterm -e "roslaunch turtlebot_gazebo amcl_demo.launch" & 
sleep 5
xterm -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5
xterm -e "source devel/setup.bash; rosrun pick_objects pick_objects"

