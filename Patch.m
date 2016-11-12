function out = Patch( xvec, yvec, zvec )
%Conducts the Patch Test on the Brick Element
%   Defines a point inside the element to base the patch around. Then
%   applys a force to get a uniaxial strain. The strain at each corner of
%   each new element is compared. If the strain is uniform among the
%   corners and also among elements, the patch test is passed. 

xrange = max(xvec)-min(xvec);
xmid = xrange/2;
yrange = max(yvec)-min(yvec);
ymid = yrange/2;
zrange = max(zvec)-min(zvec);
zmid = zrange/2;

node1 = (xvec(1), yvec(1), zvec(1));
node2 = (xvec(2), yvec(2), zvec(2));
node3 = (xvec(3), yvec(3), zvec(3));
node4 = (xvec(4), yvec(4), zvec(4));
node5 = (xvec(5), yvec(5), zvec(5));
node6 = (xvec(6), yvec(6), zvec(6));
node7 = (xvec(7), yvec(7), zvec(7));
node8 = (xvec(8), yvec(8), zvec(8));

PatchPt = [(1/3*xrange), (0.5*yrange), (1/3*zrange)];

Bi1 = [(node1(x)+node2(x))/2, (node1(y)+node2(y))/2, (node1(z)+node2(z))/2];
Bi2 = [(node2(x)+node3(x))/2, (node2(y)+node3(y))/2, (node2(z)+node3(z))/2];
Bi3 = [(node3(x)+node4(x))/2, (node3(y)+node4(y))/2, (node3(z)+node4(z))/2];
Bi4 = [(node1(x)+node4(x))/2, (node1(y)+node4(y))/2, (node1(z)+node4(z))/2];
Bi5 = [(node5(x)+node6(x))/2, (node5(y)+node6(y))/2, (node5(z)+node6(z))/2];
Bi6 = [(node6(x)+node7(x))/2, (node6(y)+node7(y))/2, (node6(z)+node7(z))/2];
Bi7 = [(node7(x)+node8(x))/2, (node7(y)+node8(y))/2, (node7(z)+node8(z))/2];
Bi8 = [(node1(x)+node8(x))/2, (node1(y)+node8(y))/2, (node1(z)+node8(z))/2];
Bi9 = [(node1(x)+node5(x))/2, (node1(y)+node5(y))/2, (node1(z)+node5(z))/2];
Bi10 = [(node2(x)+node6(x))/2, (node2(y)+node6(y))/2, (node2(z)+node6(z))/2];
Bi11 = [(node3(x)+node7(x))/2, (node3(y)+node7(y))/2, (node3(z)+node7(z))/2];
Bi12 = [(node4(x)+node8(x))/2, (node4(y)+node8(y))/2, (node4(z)+node8(z))/2];
Bi13 = [(Bi1(x)+Bi3(x))/2, (Bi1(y)+Bi3(y))/2, (Bi1(z)+Bi3(z))/2];
Bi14 = [(Bi5(x)+Bi7(x))/2, (Bi5(y)+Bi7(y))/2, (Bi5(z)+Bi7(z))/2];
Bi15 = [(Bi1(x)+Bi5(x))/2, (Bi1(y)+Bi5(y))/2, (Bi1(z)+Bi5(z))/2];
Bi16 = [(Bi2(x)+Bi6(x))/2, (Bi2(y)+Bi6(y))/2, (Bi2(z)+Bi6(z))/2];
Bi17 = [(Bi3(x)+Bi7(x))/2, (Bi3(y)+Bi7(y))/2, (Bi3(z)+Bi7(z))/2];
Bi18 = [(Bi4(x)+Bi8(x))/2, (Bi4(y)+Bi8(y))/2, (Bi4(z)+Bi8(z))/2];

numlines = 0

%Element 1
lines(numlines+1,:)=[node1 Bi1];
lines(numlines+2,:)=[Bi1 Bi13];
lines(numlines+3,:)=[Bi13 Bi4];
lines(numlines+4,:)=[Bi4 node1];
lines(numlines+5,:)=[node1 Bi9];
lines(numlines+6,:)=[Bi9 Bi15];
lines(numlines+7,:)=[Bi15 PatchPt];
lines(numlines+8,:)=[PatchPt Bi18];
lines(numlines+9,:)=[Bi18 Bi9];
lines(numlines+10,:)=[Bi1 Bi15];
lines(numlines+11,:)=[Bi13 PatchPt];
lines(numlines+12,:)=[Bi4 Bi18];












end

