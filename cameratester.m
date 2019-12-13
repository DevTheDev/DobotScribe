%Web cam tester and picture taking module
clear('cam');
% webcamlist;
cam = webcam('USB Camera'); %Note that this might be mac only
preview(cam)
% cam.AvailableResolutions
i = snapshot(cam);
imshow(i);
visionproc(i);