function [ Kr,Mr ] = ZeroDOFs( Ke,Me )
%ZeroDOFs takes two input square matrices Ke and Me and removes degrees of
%freedom with no stiffness or no mass. The reduced matrices are Kr and Mr

% remove degrees of freedom with zero stiffness from Ke
Kval=zeros(size(Ke,1),size(Ke,2));
% find values with zero stiffness
for i=1:size(Ke,1)
    for j=1:size(Ke,2)
        if abs(Ke(i,j))<10^-12
            Kval(i,j)=1;
        end
    end
end
Klocations=[];
% find rows and collumns with zero stiffness
for i=1:size(Ke,1)
    if sum(Kval(i,:))==size(Kval,1) && sum(Kval(:,i))==size(Kval,1)
        Klocations=[Klocations i];
    end
end
% delete rows and collumns with zero stiffness
Ke(:,Klocations)=[];
Ke(Klocations,:)=[];
Kr=Ke;

% remove degrees of freedom with zero stiffness from Me
Mval=zeros(size(Me,1),size(Me,2));
% find values with zero mass
for i=1:size(Me,1)
    for j=1:size(Me,2)
        if abs(Me(i,j))<10^-12
            Mval(i,j)=1;
        end
    end
end
Mlocations=[];
% find rows and collumns with zero mass
for i=1:size(Me,1)
    if sum(Mval(i,:))==size(Mval,1) && sum(Mval(:,i))==size(Mval,1)
        Mlocations=[Mlocations i];
    end
end
% delete rows and collumns with zero mass
Me(:,Mlocations)=[];
Me(Mlocations,:)=[];
Mr=Me;
end