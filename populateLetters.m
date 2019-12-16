function allLetters = populateLetters()
    %Creates a container map of the letter paths we have in our system
    %These paths should be represented as follows
    %P = [segment1 segment2 segment3 ... segmentn]
    %segment = [x y isPenUp]
    %All coords should be assuming that 0,0 is in the bottom left, and that
    %we start there (i.e. don't include it).
    %keys = [0 1 2 3 4 5 6 7 8 9]
    keys = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D'} %All available characters
%     keys = '0123456789ABCD';
    char0=[[0;0;0],[1;0;0],[1;2;0],[0;2;0],[1;0;0],[0;2;0],[0;0;0],[0;0;2]];
    char1=[[0.5;0;2],[0.5;0;0],[0.5;2;0],[0;1.5;0],[0;0;2]];
    char2=[[1;0;0],[0;0;0],[1;1;0],[1;2;0],[0.5;2;0],[0;1.5;0],[0;0;2]];
    char3=[[0;0;0],[1;1;0],[0;1;0],[1;2;0],[0;2;0],[0;0;2]];
    char4=[[1;0;1],[1;0;0],[1;2;0],[1;1;0],[0;1;0],[0.5;2;0],[0;0;2]];
    char5=[[0;0;0],[1;0.5;0],[1;1;0],[0.5;1.5;0],[0;1;0],[0;2;0],[1;2;0],[0;0;2]];
    char6=[[0;1;0],[1;1;0],[1;0;0],[0;0;0],[0;1;0],[0.5;2;0],[1;1.5;0],[0;0;2]];
    char7=[[0;0;0],[1;2;0],[0;0;2],[0;0;2]];
    char8=[[0;1;0],[1;1;0],[1;0;0],[0;0;0],[0;2;0],[1;2;0],[1;1;0],[0;0;2]];
    char9=[[1;0;0],[1;2;0],[0;2;0],[0;1;0],[1;1.5;0],[0;0;2]];
    
    charA=[[0;0;0],[0.5;2;0],[1;0;0],[0.75;1;0],[0.2;1;0],[0;0;2]];
    charB=[[0;0;0],[0;2;0],[1;1.8;0],[1;1.2;0],[0;1;0],[1;0.8;0],[1;0.2;0],[0;0;0],[0;0;2]];
    charC=[[1;1.5;1],[1;1.5;0],[0.5;2;0],[0;1.5;0],[0;0.5;0],[0.5;0;0],[1;0.5;0],[0;0;2]];
    charD=[[0;0;0],[0;2;0],[1;1.5;0],[1;0.5;0],[0;0;0],[0;0;2]];
    
    values = {char0, char1, char2, char3, char4, char5, char6, char7, char8, char9, charA, charB, charC, charD};
%     values = {char0, char1, char2, char3, char4, char5, char6, char7, char8, char9};
    
    allLetters = containers.Map(keys, values);
end