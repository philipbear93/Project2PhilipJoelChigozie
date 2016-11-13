function out = Patch( xvec, yvec, zvec )
%Conducts the Patch Test on the Brick Element
%   Defines a point inside the element to base the patch around. Then
%   applys a force to get a uniaxial strain. The strain at each corner of
%   each new element is compared. If the strain is uniform among the
%   corners and also among elements, the patch test is passed. 

xrange = max(xvec)-min(xvec);
yrange = max(yvec)-min(yvec);
zrange = max(zvec)-min(zvec);
xvec = xvec'
yvec = yvec'
zvec = zvec'

node1 = [xvec(1) yvec(1) zvec(1)];
node2 = [xvec(2) yvec(2) zvec(2)];
node3 = [xvec(3) yvec(3) zvec(3)];
node4 = [xvec(4) yvec(4) zvec(4)];
node5 = [xvec(5) yvec(5) zvec(5)];
node6 = [xvec(6) yvec(6) zvec(6)];
node7 = [xvec(7) yvec(7) zvec(7)];
node8 = [xvec(8) yvec(8) zvec(8)];

PatchPt = [(1/3*xrange), (0.5*yrange), (1/3*zrange)];

Bi1 = [(node1(1)+node2(1))/2, (node1(2)+node2(2))/2, (node1(3)+node2(3))/2];
Bi2 = [(node2(1)+node3(1))/2, (node2(2)+node3(2))/2, (node2(3)+node3(3))/2];
Bi3 = [(node3(1)+node4(1))/2, (node3(2)+node4(2))/2, (node3(3)+node4(3))/2];
Bi4 = [(node1(1)+node4(1))/2, (node1(2)+node4(2))/2, (node1(3)+node4(3))/2];
Bi5 = [(node5(1)+node6(1))/2, (node5(2)+node6(2))/2, (node5(3)+node6(3))/2];
Bi6 = [(node6(1)+node7(1))/2, (node6(2)+node7(2))/2, (node6(3)+node7(3))/2];
Bi7 = [(node7(1)+node8(1))/2, (node7(2)+node8(2))/2, (node7(3)+node8(3))/2];
Bi8 = [(node1(1)+node8(1))/2, (node1(2)+node8(2))/2, (node1(3)+node8(3))/2];
Bi9 = [(node1(1)+node5(1))/2, (node1(2)+node5(2))/2, (node1(3)+node5(3))/2];
Bi10 = [(node2(1)+node6(1))/2, (node2(2)+node6(2))/2, (node2(3)+node6(3))/2];
Bi11 = [(node3(1)+node7(1))/2, (node3(2)+node7(2))/2, (node3(3)+node7(3))/2];
Bi12 = [(node4(1)+node8(1))/2, (node4(2)+node8(2))/2, (node4(3)+node8(3))/2];
Bi13 = [(Bi1(1)+Bi3(1))/2, (Bi1(2)+Bi3(2))/2, (Bi1(3)+Bi3(3))/2];
Bi14 = [(Bi5(1)+Bi7(1))/2, (Bi5(2)+Bi7(2))/2, (Bi5(3)+Bi7(3))/2];
Bi15 = [(Bi1(1)+Bi5(1))/2, (Bi1(2)+Bi5(2))/2, (Bi1(3)+Bi5(3))/2];
Bi16 = [(Bi2(1)+Bi6(1))/2, (Bi2(2)+Bi6(2))/2, (Bi2(3)+Bi6(3))/2];
Bi17 = [(Bi3(1)+Bi7(1))/2, (Bi3(2)+Bi7(2))/2, (Bi3(3)+Bi7(3))/2];
Bi18 = [(Bi4(1)+Bi8(1))/2, (Bi4(2)+Bi8(2))/2, (Bi4(3)+Bi8(3))/2];

numlines = 0

%Element 1: Node1, Bi1, Bi13, Bi4, Bi9, Bi15, PatchPt, Bi18
Elem1 = [node1; Bi1; Bi13; Bi4; Bi9; Bi15; PatchPt; Bi18]
E1xvec = Elem1(:,1);
E1yvec = Elem1(:,2);
E1zvec = Elem1(:,3);



%Element 2: Bi9, Bi15, PatchPt, Bi18, node5, Bi5, Bi14, Bi8
Elem2 = [Bi9; Bi15; PatchPt; Bi18; node5; Bi5; Bi14; Bi8];
E2xvec = Elem2(:,1);
E2yvec = Elem2(:,2);
E2zvec = Elem2(:,3);



%Element 3: Bi1, node2, Bi2, Bi13, Bi15, Bi10, Bi16, PatchPt
Elem3 = [Bi1; node2; Bi2; Bi13; Bi15; Bi10; Bi16; PatchPt];
E3xvec = Elem3(:,1);
E3yvec = Elem3(:,2);
E3zvec = Elem3(:,3);



%Element 4: Bi15, Bi10, Bi16, PatchPt, Bi5, node6, Bi6, Bi14 
Elem4 = [Bi15; Bi1; Bi16; PatchPt; Bi5; node6; Bi6; Bi14];
E4xvec = Elem4(:,1);
E4yvec = Elem4(:,2);
E4zvec = Elem4(:,3);



%Element 5: Bi4; Bi13; Bi3; node4; Bi18; PatchPt; Bi17; Bi12 
Elem5 = [ Bi4; Bi13; Bi3; node4; Bi18; PatchPt; Bi17; Bi12 ];
E5xvec = Elem5(:,1);
E5yvec = Elem5(:,2);
E5zvec = Elem5(:,3);



%Element 6:  Bi18; PatchPt; Bi17; Bi12; Bi8; Bi14; Bi7; node8 
Elem6 = [Bi18; PatchPt; Bi17; Bi12; Bi8; Bi14; Bi7; node8];
E6xvec = Elem6(:,1);
E6yvec = Elem6(:,2);
E6zvec = Elem6(:,3);



%Element 7:  Bi13; Bi2; node3; Bi3; PatchPt; Bi16, Bi11; Bi17
Elem7 = [Bi13; Bi2; node3; Bi3; PatchPt; Bi16; Bi11; Bi17];
E7xvec = Elem7(:,1);
E7yvec = Elem7(:,2);
E7zvec = Elem7(:,3);



%Element 8:  PatchPt; Bi16; Bi11; Bi17; Bi14; Bi6; Bi7; Bi7
Elem8 = [PatchPt; Bi16; Bi11; Bi17; Bi14; Bi6; Bi7; Bi7];
E8xvec = Elem8(:,1);
E8yvec = Elem8(:,2);
E8zvec = Elem8(:,3);


    
lines(numlines+1,:)=[Elem1(1,:) Elem1(2,:)];
lines(numlines+2,:)=[Elem1(2,:) Elem1(3,:)];
lines(numlines+3,:)=[Elem1(3,:) Elem1(4,:)];
lines(numlines+4,:)=[Elem1(4,:) Elem1(1,:)];
lines(numlines+5,:)=[Elem1(5,:) Elem1(6,:)];
lines(numlines+6,:)=[Elem1(6,:) Elem1(7,:)];
lines(numlines+7,:)=[Elem1(7,:) Elem1(8,:)];
lines(numlines+8,:)=[Elem1(8,:) Elem1(5,:)];
% lines(numlines+9,:)=[Bi18 Bi9];
% lines(numlines+10,:)=[Bi1 Bi15];
% lines(numlines+11,:)=[Bi13 PatchPt];
% lines(numlines+12,:)=[Bi4 Bi18];
% lines(numlines+13,:)=[Bi9 Bi15];
% lines(numlines+14,:)=[Bi15 PatchPt];
% lines(numlines+15,:)=[PatchPt Bi18];
% lines(numlines+16,:)=[Bi18 Bi9];
% lines(numlines+17,:)=[Bi9 node5];
% lines(numlines+18,:)=[node5 Bi5];
% lines(numlines+19,:)=[Bi5 Bi14];
% lines(numlines+20,:)=[Bi14 Bi8];
% lines(numlines+21,:)=[Bi8 node5];
% lines(numlines+22,:)=[Bi15 Bi5];
% lines(numlines+23,:)=[Bi14 PatchPt];
% lines(numlines+24,:)=[Bi18 Bi8];
% lines(numlines+25,:)=[Elem3(1,:) Elem3(2,:)];
% lines(numlines+26,:)=[Elem3(2,:) Elem3(3,:)];
% lines(numlines+27,:)=[Elem3(3,:) Elem3(4,:)];
% lines(numlines+28,:)=[Elem3(4,:) Elem3(1,:)];
% lines(numlines+29,:)=[Elem3(5,:) Elem3(6,:)];
% lines(numlines+30,:)=[Elem3(6,:) Elem3(7,:)];
% lines(numlines+31,:)=[Elem3(7,:) Elem3(8,:)];
% lines(numlines+32,:)=[Elem3(8,:) Elem3(5,:)];
% lines(numlines+33,:)=[Elem3(1,:) Elem3(5,:)];
% lines(numlines+34,:)=[Elem3(2,:) Elem3(6,:)];
% lines(numlines+35,:)=[Elem3(3,:) Elem3(7,:)];
% lines(numlines+36,:)=[Elem3(4,:) Elem3(8,:)];
% lines(numlines+37,:)=[Elem4(1,:) Elem4(2,:)];
% lines(numlines+38,:)=[Elem4(2,:) Elem4(3,:)];
% lines(numlines+39,:)=[Elem4(3,:) Elem4(4,:)];
% lines(numlines+40,:)=[Elem4(4,:) Elem4(1,:)];
% lines(numlines+41,:)=[Elem4(5,:) Elem4(6,:)];
% lines(numlines+42,:)=[Elem4(6,:) Elem4(7,:)];
% lines(numlines+43,:)=[Elem4(7,:) Elem4(8,:)];
% lines(numlines+44,:)=[Elem4(8,:) Elem4(5,:)];
% lines(numlines+45,:)=[Elem4(1,:) Elem4(5,:)];
% lines(numlines+46,:)=[Elem4(2,:) Elem4(6,:)];
% lines(numlines+47,:)=[Elem4(3,:) Elem4(7,:)];
% lines(numlines+48,:)=[Elem4(4,:) Elem4(8,:)];
% lines(numlines+49,:)=[Elem5(1,:) Elem5(2,:)];
% lines(numlines+50,:)=[Elem5(2,:) Elem5(3,:)];
% lines(numlines+51,:)=[Elem5(3,:) Elem5(4,:)];
% lines(numlines+52,:)=[Elem5(4,:) Elem5(1,:)];
% lines(numlines+53,:)=[Elem5(5,:) Elem5(6,:)];
% lines(numlines+54,:)=[Elem5(6,:) Elem5(7,:)];
% lines(numlines+55,:)=[Elem5(7,:) Elem5(8,:)];
% lines(numlines+56,:)=[Elem5(8,:) Elem5(5,:)];
% lines(numlines+57,:)=[Elem5(1,:) Elem5(5,:)];
% lines(numlines+58,:)=[Elem5(2,:) Elem5(6,:)];
% lines(numlines+59,:)=[Elem5(3,:) Elem5(7,:)];
% lines(numlines+60,:)=[Elem5(4,:) Elem5(8,:)];
% lines(numlines+61,:)=[Elem6(1,:) Elem6(2,:)];
% lines(numlines+62,:)=[Elem6(2,:) Elem6(3,:)];
% lines(numlines+63,:)=[Elem6(3,:) Elem6(4,:)];
% lines(numlines+64,:)=[Elem6(4,:) Elem6(1,:)];
% lines(numlines+65,:)=[Elem6(5,:) Elem6(6,:)];
% lines(numlines+66,:)=[Elem6(6,:) Elem6(7,:)];
% lines(numlines+67,:)=[Elem6(7,:) Elem6(8,:)];
% lines(numlines+68,:)=[Elem6(8,:) Elem6(5,:)];
% lines(numlines+69,:)=[Elem6(1,:) Elem6(5,:)];
% lines(numlines+70,:)=[Elem6(2,:) Elem6(6,:)];
% lines(numlines+71,:)=[Elem6(3,:) Elem6(7,:)];
% lines(numlines+72,:)=[Elem6(4,:) Elem6(8,:)];
% lines(numlines+73,:)=[Elem7(1,:) Elem7(2,:)];
% lines(numlines+74,:)=[Elem7(2,:) Elem7(3,:)];
% lines(numlines+75,:)=[Elem7(3,:) Elem7(4,:)];
% lines(numlines+76,:)=[Elem7(4,:) Elem7(1,:)];
% lines(numlines+77,:)=[Elem7(5,:) Elem7(6,:)];
% lines(numlines+78,:)=[Elem7(6,:) Elem7(7,:)];
% lines(numlines+79,:)=[Elem7(7,:) Elem7(8,:)];
% lines(numlines+80,:)=[Elem7(8,:) Elem7(5,:)];
% lines(numlines+81,:)=[Elem7(1,:) Elem7(5,:)];
% lines(numlines+82,:)=[Elem7(2,:) Elem7(6,:)];
% lines(numlines+83,:)=[Elem7(3,:) Elem7(7,:)];
% lines(numlines+84,:)=[Elem7(4,:) Elem7(8,:)];
% lines(numlines+73,:)=[Elem8(1,:) Elem8(2,:)];
% lines(numlines+74,:)=[Elem8(2,:) Elem8(3,:)];
% lines(numlines+75,:)=[Elem8(3,:) Elem8(4,:)];
% lines(numlines+76,:)=[Elem8(4,:) Elem8(1,:)];
% lines(numlines+77,:)=[Elem8(5,:) Elem8(6,:)];
% lines(numlines+78,:)=[Elem8(6,:) Elem8(7,:)];
% lines(numlines+79,:)=[Elem8(7,:) Elem8(8,:)];
% lines(numlines+80,:)=[Elem8(8,:) Elem8(5,:)];
% lines(numlines+81,:)=[Elem8(1,:) Elem8(5,:)];
% lines(numlines+82,:)=[Elem8(2,:) Elem8(6,:)];
% lines(numlines+83,:)=[Elem8(3,:) Elem8(7,:)];
% lines(numlines+84,:)=[Elem8(4,:) Elem8(8,:)]


plotline = [lines(1,1:3); lines(1,4:6)];
plot3(plotline(:,1), plotline(:,2), plotline(:,3));


hold on
for i = 1:84
    plotline = [lines(i,1:3); lines(i,4:6)]
    plot3(plotline(:,1), plotline(:,2), plotline(:,3))
end



end

