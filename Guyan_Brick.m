function [ Kr,Mr ] = Guyan_Brick( Ke,Me )
% Guyan_Brick reduces the stiffness and mass matrix size to 24x24 using
% guyan reduction

% check to see if Ke needs to be reduced
if size(Ke,1)>24 || size(Ke,2)>24
    K11=Ke(1:24,1:24);
    K12=Ke(1:24,25:end);
    K21=Ke(25:end,1:24);
    K22=Ke(25:end,25:end);
    K22i=K22^-1;
    Kr=K11-(K12*K22i*K21);
else
    Kr=Ke;
end

% check to see if Me needs to be reduced
if size(Me,1)>24 || size(Me,2)>24
    M11=Me(1:24,1:24);
    M12=Me(1:24,25:end);
    M21=Me(25:end,1:24);
    M22=Me(25:end,25:end);
    M22i=M22^-1;
    Mr=M11-(M12*M22i*M21);
else
    Mr=Me;
end
end

