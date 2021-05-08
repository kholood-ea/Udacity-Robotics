#include "ros/ros.h"
#include "ball_chaser/DriveToTarget.h"
#include <sensor_msgs/Image.h>
#include <iostream>
#include <cmath>
using namespace std;

// Define a global client that can request services
ros::ServiceClient client;

// This function calls the command_robot service to drive the robot in the specified direction
void drive_robot(float lin_x, float ang_z)
{
    ROS_INFO_STREAM("Moving car to requested point");
    ball_chaser::DriveToTarget srv;
    srv.request.linear_x = lin_x;
    srv.request.angular_z =  ang_z;

    if (!client.call(srv))
        ROS_ERROR("Failed to call service DriveToTarget");
}

// This callback function continuously executes and reads the image data
void process_image_callback(const sensor_msgs::Image img)
{
    int leftCol = img.step/3;
    int rightCol = img.step*2/3 ;
    int white_pixel = 255;

    int ball_found_flag = 0;


    for(int i = 0; i<img.height; i++)
    {   
       
        int row_offset = i*img.step;
        for(int j = 0; j<img.step; j+=3)
        {
            if ((img.data[row_offset + j] == white_pixel) && (img.data[row_offset + j + 1] == white_pixel)
             && (img.data[row_offset + j + 2] == white_pixel))
            {
                // Check the sector
                int sector = j%img.step;
                if(sector < leftCol)
                {
                    drive_robot(0.0, 0.5);
                    ball_found_flag = 1;
                    break;
                }
                else if (sector < rightCol)
                {
         			drive_robot(0.5, 0.0);
                    ball_found_flag = 1;
                    break;
                }
                else
                {
     				drive_robot(0.0, -0.5);
                    ball_found_flag = 1;
                    break;
                }
                
            }        
        }
        if(ball_found_flag)
        {
            break;
        }
        
    }
    if(!ball_found_flag)
    {
        drive_robot(0.0, 0.0); // Stop
    }
}


int main(int argc, char** argv)
{
    // Initialize the process_image node and create a handle to it
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;

    // Define a client service capable of requesting services from command_robot
    client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");

    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    ros::Subscriber sub1 = n.subscribe("/camera/rgb/image_raw", 10, process_image_callback);

    // Handle ROS communication events
     ros::spin();

    return 0;
}