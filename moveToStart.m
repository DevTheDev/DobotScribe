function returnMsg = moveToStart(dobot, camera)
    %Takes in the dobot object and the camera, does vision processing and
    %moves the dobot arm to be pen up above the last written letter in the
    %lower left corner
    image = snapshot(camera);
    imshow(image);
    cameraCoords = visionproc(image);
    worldCoords = camToWorld(cameraCoords, dobot);
    returnMsg = moveToPose(worldCoords, dobot);
end