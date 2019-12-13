function wc = camToWorld(cc, dobot)
    %Creates the transformation matrix from camera coords to world coords
    %Then applies the transform to cc (2x1 vector of camera coords)
    %Returns result of the transformation
    camToEEx = 100; %mm, distance from the camera sensor to the end effector (should be static)
    camToEEz = 100; %mm, NOTE that these are guesses and need to be measured
    thetas = dobot.getJointPositionsRad();
    pose = projekt_forward(thetas(1:3));
    wc = cc + [camToEEx 0 camToEEz] + pose; %Should be a linear transform only
    %NOT sure if this works (I think there might be a problem just adding
    %to the camera coords)
end