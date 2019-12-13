function returnMsg = drawSegment(p, dobot)
    %Draws the appropriate segment based on the letter coordinates given by
    %p (x y z vector) (z is pen up/down 0 = down)
    %NOTE: Check if the pen is dragging, might need up/down to be a
    %separate operation.
    thetas = dobot.getJointPositionsRad();
    thetas = thetas(1:3); %Trim off the servo
    pose = projekt_forward(thetas); %Need to know where we are to know where to go
    scaling = 50; %Letter units to size factor
    target = pose + p * scaling;
    target
    returnMsg = moveToPose(target, dobot);
end