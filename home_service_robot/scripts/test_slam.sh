xterm -e "export ROBOT_INITIAL_POSE='-x -3 -y -2 -Y 1.570796'; roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$(rospack find home_service_robot)/maps/kholood.world" &
sleep 5
xterm -e "roslaunch turtlebot_gazebo gmapping_demo.launch map_file:=$(rospack home_service_robot)/maps/map.yaml" &
sleep 5
xterm -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5
xterm -e "roslaunch turtlebot_teleop keyboard_teleop.launch"

# xterm  -e  "roslaunch turtlebot_simulator turtlebot_gazebo launch turtlebot_world.launch" &
# sleep 5

# xterm  -e  "roslaunch turtlebot_simulator turtlebot_gazebo gmapping_demo.launch" & 
# xterm  -e  "roslaunch '/home/workspace/catkin_ws/src/turtlebot_simulator/turtlebot_gazebo/launch/gmapping_demo.launch" & 

# sleep 5
# xterm  -e  "roslaunch '/home/workspace/catkin_ws/src/turtlebot_simulator/turtlebot_gazebo/launch/gmapping_demo.launch" & 

# sleep 5

# xterm  -e  "roslaunch turtlebot_interactions turtlebot_rviz_launchers view_navigation.launch"&
# sleep 5

# xterm  -e  "roslaunch turtlebot turtlebot_teleop launch/keyboard_teleop.launch"
