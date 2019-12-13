robot = RobotRaconteur.Connect('tcp://localhost:10001/dobotRR/dobotController');

start_angles = int16( [0 0 0 0] );
robot.setJointPositions(start_angles(1),start_angles(2),start_angles(3),start_angles(4));
% robot.setJointPositionsRad(0,0,0,0);
pause(5);

disp 'Going into twitch loop'
a = 0; b = 20;
% Use ik to find some angles for start position
% getIKFor(100,100,100,robot.getJointPositions())
% Move in a line parallel to the surface

