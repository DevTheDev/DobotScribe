function returnMsg = drawSegment(p, dobot, pastPose, rot)
    %Draws the appropriate segment based on the letter coordinates given by
    %p (x y z vector) (z is pen up/down 0 = down)
    %pastPose is the prior pose vector that the robot was in
    % rot is the angle that we are writing at (should start at 0 and then
    % be modified by the camera.
    %NOTE: Check if the pen is dragging, might need up/down to be a
    %separate operation.
    thetas = dobot.getJointPositionsRad();
    thetas = thetas(1:3); %Trim off the servo
%     pose = projekt_forward(thetas); %Need to know where we are to know where to go
    scaling = 15.0; %Letter units to size factor
%     pastPose
%     p
    rotationMatrix = [cos(rot) -sin(rot) 0;
                      sin(rot) cos(rot) 0;
                      0 0 1];
    target = pastPose + rotationMatrix*p * scaling;
    pastPose = target;
    returnMsg = moveToPose(target, dobot);
end