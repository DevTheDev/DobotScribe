function returnMsg = moveToPose(P, dobot)
    %P is the target pose P(1) = x, P(2) = y, P(3) = z, always in mm
    theta = getIK(P(1), P(2), P(3));
    theta = radtodeg(theta)
    %Might need to be in degrees
    dobot.setJointPositions(int16(theta(1)), int16(theta(2)), int16(theta(3)), int16(0));
%     dobot.setJointPositionsRad(double(theta(1)), double(theta(2)), double(theta(3)), 0.0);
%     dobot.setJointPositionsRad(0.5, 0.5, 0.5, 0);

    %NOTE Might have to pause for this operation to complete.
    pause(3);
    returnMsg = 'Moved Successfully';
end

