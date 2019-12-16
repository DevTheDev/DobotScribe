function wc = camToWorld(cc, dobot)
    %Creates the transformation matrix from camera coords to world coords
    %Then applies the transform to cc (2x1 vector of camera coords)
    %Returns result of the transformation
    camToEEx = 5; %mm, distance from the camera sensor to the end effector (should be static)
    camToEEy = 0;
    camToEEz = 10; %mm
    thetas = dobot.getJointPositionsRad();
    pose = transpose(projekt_forward(thetas(1:3)));
    cameraPose = pose + [camToEEx camToEEy camToEEz] % This tells us where the camera is
    % Calculate the location of what the camera is looking at (i.e. work
    % out the cam 0,0 in world coords
    cameraWorld = [cameraPose(1) cameraPose(2) 0]  % Z is always 0
    cc1 = cc(1);
    cc2 = cc(2);
    cc(2) = cc2 * 110/640-25; %Make the scaling dynamic. also rotate coords
    cc(1) = cc1 * 85/480-54;
    cc % CC now in mm relative to the 0,0 of the frame.
    wc = cc + cameraWorld;
end