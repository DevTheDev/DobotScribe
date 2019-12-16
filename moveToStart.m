function [position, rot] = moveToStart(dobot, camera)
    %Takes in the dobot object and the camera, does vision processing and
    %moves the dobot arm to be pen up above the last written letter in the
    %lower left corner
    preview(camera)
    thetas = dobot.getJointPositionsRad();
    thetas = thetas(1:3); %Trim off the servo
    pose = projekt_forward(thetas); %Need to know where we are to know where to go
    pose(3) = pose(3) + 50;
    pose
    moveToPose(pose,dobot);
    %%Changing to a step back and take a picture approach
    image = snapshot(camera);
    imshow(image);
    [cameraCoords, rot] = visionproc(image);
    rot = 0;
    worldCoords = camToWorld(cameraCoords, dobot);
    worldCoords(1) = worldCoords(1) + 15;
    moveToPose(worldCoords, dobot);
    position = transpose(worldCoords);
end