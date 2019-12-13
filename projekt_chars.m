function[ x ]=projekt_chars(char)

syms char0 char1 char2 char3 char4 char5 char6 char7 char8 char9

char0=[[0;0;0],[1;0;0],[1;2;0],[0;2;0],[1;0;0],[0;2;0],[0;0;0],[0;0;2]];
char1=[[0.5;0;0],[0.5;2;0],[0;1.5;0],[0;0;2]];
char2=[[1;0;0],[0;0;0],[1;1;0],[1;2;0],[0.5;2;0],[0;1.5;0],[0;0;2]];
char3=[[0;0;0],[1;1;0],[0;1;0],[1;2;0],[0;2;0],[0;0;2]];
char4=[[1;0;0],[1;2;0],[1;1;0],[0;1;0],[0.5;2;0],[0;0;2]];
char5=[[0;0;0],[1;0.5;0],[1;1;0],[0.5;1.5;0],[0;1;0],[0;2;0],[1;2;0],[0;0;2]];
char6=[[0;1;0],[1;1;0],[1;0;0],[0;0;0],[0;1;0],[0.5;2;0],[1;1.5;0],[0;0;2]];
char7=[[0;0;0],[1;2;0],[0;0;2],[0;0;2]];
char8=[[0;1;0],[1;1;0],[1;0;0],[0;0;0],[0;2;0],[1;2;0],[1;1;0],[0;0;2]];
char9=[[1;0;0],[1;2;0],[0;2;0],[0;1;0],[1;1.5;0],[0;0;2]];

if char=='0'
    x= char0;
elseif char=='1'
    x= char1;
elseif char=='2'
    x= char2;
elseif char=='3'
    x= char3;
elseif char=='4'
    x= char4;
elseif char=='5'
    x= char5;
elseif char=='6'
    x= char6;
elseif char=='7'
    x= char7;
elseif char=='8'
    x= char8;
elseif char=='9'
    x= char9;
end

values = {zero, one, two, three};
    
    allLetters = containers.Map(keys, values);

end