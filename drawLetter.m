function returnMsg = drawLetter(L, dobot, allLetters, camera, firstTime)
    %Find the path for the letter (set of target points)
    C = num2cell(L);
    LetterPaths = values(allLetters,C);
    global pastPose
    if(~firstTime)
      %Go to the start based on prior letter (w/ camera)
      [pastPose, rot] = moveToStart(dobot, camera); % This is a wrapper on the moveToPose command
    else
      %Move to the paper and start drawing (doesn't really matter where)
      %NOTE: Needs to be tuned.
      moveToPose([200 0 1], dobot);
      pastPose = [200; 0; 1];
      rot = 0;
    end
    %Loop
    for P = LetterPaths{1};
        drawSegment(P, dobot, pastPose, rot); %Another wrapper on the moveToPose command
    end
    returnMsg = 'Operation Successful';
end
