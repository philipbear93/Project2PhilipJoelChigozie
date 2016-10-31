function [ B ] = B_brick( dNdx, dNdy, dNdz )
% B_brick takes dNdx, dNdy, and dNdz as output from J_brick and calculates
% B for a brick element with it
B=zeros(6,24);
for i=1:8
    Bi=[dNdx(i) 0       0;
        0       dNdy(i) 0;
        0       0       dNdz(i);
        dNdy(i) dNdx(i) 0;
        0       dNdz(i) dNdy(i);
        dNdz(i) 0       dNdx(i)];
    j=1+(i-1)*3;
    k=i*3;
    B(:,j:k)=Bi(:,:);
end

end

