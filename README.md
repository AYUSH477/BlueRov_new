# bluerov_auto
Medium level autonomy and automation functions for BlueROV

Bulit on top of bluerov_ros_playground


## How to set up everything and get started?
Honestly, I forgot (it was 2 years ago), but the instructions here in the readme seem about right. Let me know if you get stuck https://github.com/AYUSH477/BlueRov_new/tree/master/src/bluerov_ros_playground
## Files to understand autonomy: 
BlueRov_new/src/bluerov_ros_playground/src/bluerov/Control.py
BlueRov_new/src/bluerov_ros_playground/src/bluerov/Control_Autonomou.py
BlueRov_new/src/bluerov_ros_playground/src/bluerov/joystick.py
(All of these are pretty similar. They all use a PID control implementation and send the resulting forces to the thrusters. joystick.py reads the command from the joystick and sends it to the robot in form of forces. The autonomous ones use a basic set-point based algorithm to send a robot to the desired destination. The code is kind of messy, but nothing too complicated.)

## Localization
### Autonomy is achieved using localization and this is how it's achieved:
BlueRov_new/src/bluerov_ros_playground/src/bluerov/send_depth.py
(This is responsible for publishing the depth of the robot to a topic using an in-built barometer)

BlueRov_new/src/waterlinked_ros_driver/
(This package is responsible for the x, y localization of the robot. Ask Maurelli if they still have the waterlinked for localization. I heard they have a new fancy sonar. Maybe you can use that instead for localization. Anyway, waterlinked publishes the x,y position of the robot in a topic. It is very noisy.)

## TODO

1. Right now 
