# bluerov_auto
Medium level autonomy and automation functions for BlueROV

Bulit on top of bluerov_ros_playground


## How to set up everything and get started?
Honestly, I forgot (it was 2 years ago), but the instructions here in the readme seem about right. Let me know if you get stuck https://github.com/AYUSH477/BlueRov_new/tree/master/src/bluerov_ros_playground
## Files to understand autonomy: 
BlueRov_new/src/bluerov_ros_playground/src/bluerov/Control.py
BlueRov_new/src/bluerov_ros_playground/src/bluerov/Control_Autonomou.py
BlueRov_new/src/bluerov_ros_playground/src/bluerov/joystick.py
(All of these are pretty similar. They all use a PID control implementation (except joystick.py) and send the resulting forces to the thrusters. joystick.py reads the command from the joystick and sends it to the robot in form of forces. The autonomous ones use a basic set-point based algorithm to send a robot to the desired destination. The code is kind of messy, but nothing too complicated.)

## Localization
### Autonomy is achieved using localization and this is how it's achieved:
BlueRov_new/src/bluerov_ros_playground/src/bluerov/send_depth.py
(This is responsible for publishing the depth of the robot to a topic using an in-built barometer)

BlueRov_new/src/waterlinked_ros_driver/
(This package is responsible for the x, y localization of the robot. Ask Maurelli if they still have the waterlinked for localization. I heard they have a new fancy sonar. Maybe you can use that instead for localization. Anyway, waterlinked publishes the x,y position of the robot in a topic. It is very noisy.)

## TODO

1. You can implement an actual path-planning algorithm (A* for ex.) to automate the robot. Write a separate node for that.
2. The incoming data from waterlinked is very noisy. Maybe, you can find ways to stabilize it. OR 
3. You can use the new sonar to publish the localization data on topics and use those instead for automation.
4. You can write a node for fault-detection.(For example: stop the robot when the battery charge is too low)

### Quick tip:
Check out the launch files in BlueRov_new/src/bluerov_ros_playground/launch esp. user_mav.launch to understand which nodes are important.
