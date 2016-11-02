function [ Emat ] = E_matrix( E,G )
% E_matrix solves for Emat given E and G
nu=(E/(2*G))-1;
val1=1-nu;
val2=1+nu;
val3=1-2*nu;
Emat=zeros(6,6);
Emat(1:3,1:3)=nu;
Emat([1,2,3],[1,2,3])=val1;
Emat([4,5,6],[4,5,6])=val3/2;
Emat=Emat*E/(val2*val3);

end

