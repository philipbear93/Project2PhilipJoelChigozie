function [ N ] = N_brick( Epsilon, Eta, Zeta )
% N_brick uses inputs Epsilon, Eta and Zeta to generate N
EpsilonI=[-1 -1 -1 -1 1 1 1 1];
EtaI=[-1 -1 1 1 -1 -1 1 1];
ZetaI=[1 -1 -1 1 1 -1 -1 1];
N=[];
for i=1:8
    Ni(i)=(1/8)*(1+Epsilon*EpsilonI(i))*(1+Eta*EtaI(i))*(1+Zeta*ZetaI(i));
    Ne=zeros(3,3);
    Ne([1 2 3],[1 2 3])=Ni(i);
    N=[N Ne];
end

end

