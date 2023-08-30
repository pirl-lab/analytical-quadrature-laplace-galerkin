function cas=getcase(h1,h2,h3,h4)
if h1~=0 && h2+h3+h4==0
    cas=1;
elseif h2~=0 && h1+h3+h4==0
    cas=2;
elseif h1~=0 && h2~=0 && h3+h4==0
    cas=3;
elseif h3~=0 && h1~=0 && h2+h4==0
    cas=4;
elseif h3~=0 && h2~=0 && h1+h4==0
    cas=5;
elseif h4~=0 && h1~=0 && h2+h3==0
    cas=6;
elseif h4~=0 && h2~=0 && h1+h3==0
    cas=7;
else
    cas=8;
end