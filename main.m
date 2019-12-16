% Main file, run this to run the code on the robot
% This is the DobotScribe project, our full implementation of robotic
% handwriting, using inverse kinematics and computer vision.
% Authors: Noah Ashton and Dev Rangarajan

% Raconteur Stuff, mount the dobot and get it ready for use
dobot = RobotRaconteur.Connect('tcp://localhost:10001/dobotRR/dobotController');
% dobot.setJointPositionsRad(0,0,0,0);
dobot.setJointPositions(int16(0),int16(0),int16(0),int16(0));
pause(1);
% Set up Camera and open a preview window for us to use for debug.
clear('camera');
webcamlist;
camera = webcam('Logitech HD Webcam C270'); %NOTE that this is computer specific
% Set Up all availaible letters
allLetters = populateLetters();
% Main Loop, prompt the user for text input and then draw
disp('Welcome to DobotScribe');

firstTime = true; % Handler so that we don't trigger vision processing when there's a blank page.
while 1
    
    %Take in single character input
    L = input('Enter the next letter you want the dobot to draw or `stop` to stop: ', 's');
    if(strncmp(L,'stop',1))
        break
    end
    %Make letter uppercase
    L = upper(L);
    %Give error if needed (valid character and only 1 character)
    if(isKey(allLetters, L) == 0 || length(L) > 1)
        disp('invalid character');
        continue
    end
    %Pass the validated input to the drawing module
    msg = drawLetter(L, dobot, allLetters, camera, firstTime); %This function blocks until the robot is done
    firstTime = false;
    %Print success or error message
    disp(msg);
    %Repeat
end

% End Clean Up, unmount camera, close figures, etc.
close all
