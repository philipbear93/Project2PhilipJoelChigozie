function [ J,dNdx,dNdy,dNdz ] = J_brick( Epsilon, Eta, Zeta, x, y, z )
% J_brick takes given Epsilon, Eta, Zeta (doubles), x, y, and z (1x8 vectors)
% for a brick element and returns J. Epsilon, Eta, and Zeta go from -1 to 1.
EpsilonI=[-1 -1 -1 -1 1 1 1 1];
EtaI=[-1 -1 1 1 -1 -1 1 1];
ZetaI=[1 -1 -1 1 1 -1 -1 1];

for i=1:8
    dNdEpsilon(i)=(1/8)*EpsilonI(i)*(1+Eta*EtaI(i))*(1+Zeta*ZetaI(i));
    dNdEta(i)=(1/8)*EtaI(i)*(1+Epsilon*EpsilonI(i))*(1+Zeta*ZetaI(i));
    dNdZeta(i)=(1/8)*ZetaI(i)*(1+Epsilon*EpsilonI(i))*(1+Eta*EtaI(i));
end

J=[dNdEpsilon; dNdEta; dNdZeta]*[x' y' z'];
Jp=J^-1;

for i=1:8
    Resultant=Jp*[dNdEpsilon(i); dNdEta(i); dNdZeta(i)];
    dNdx(i)=Resultant(1);
    dNdy(i)=Resultant(2);
    dNdz(i)=Resultant(3);
end

