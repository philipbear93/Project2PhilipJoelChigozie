function DeflectionCleaner3dg( filename )
% DeflectionCleaner takes deflections output by WFEM and cleans them up for
% nicer viewing and plotting purposes
% filename must contain a variable Xg standing for the global deflections
% Xg must contain nodal deflections where each node has only 3 deflections
load(filename);
% Check to see if variable is sparse
if issparse(Xg)
    Xg=nonzeros(Xg);
end
% set pseudo-zero values to zero
for i=1:size(Xg,1)
    if abs(Xg(i))<10^-9
        Xg(i)=0;
    end
end
% round other values to more reasonable precision
Xg=round(Xg,6,'significant');
% Xg contains 3*n values corresponding to n nodes
% Rearrange Xg into a 3 x n array
j=0;
k=1;
for i=1:size(Xg,1)
    j=j+1;
    Xgnew(k,j)=Xg(i);
    if j==3
        j=0;
        k=k+1;
    end
end
save(filename,'Xgnew');
end
