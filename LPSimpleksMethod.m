%{
    % Simpleks Methode
    input : 1. how many constraint u have   ex  : 4
            2. objective function           ex  : [1 2] => x1 + 2*x2
            3. input constraint             ex  : [2 1 20]
            4. sign                         ex  : '<'or '>' otherwise '=' 
    procces
            1. Choose column key         objektif function maximum
                                         so choose the most negative from
                                         the last row, but if there is doesn't
                                         exists, stop the iteration
            2. continue iteration 1/0 ? :input 0 to stop,otherwise to
                                         continue
    output  : integer point x1,x2,x3,...,xn
              max f(x1,x2,x3,...,xn)
%}

clc;clear;close all;format rational;
nConstraint = input("how many constraint u have : ");
fixnCons = nConstraint;
Z = input("objective function : ");nVariable = length(Z);fixnVar = nVariable;% Masukkan dalam bentuk matriks
    header = "x" + string(1:nVariable);
    header (nVariable+1 : nVariable+nConstraint) = "s" + string(1:nConstraint);
    header (end + 1) = "NK";
    RowNames = "s" + string(1:nConstraint);
    RowNames(end + 1) = "Z";
    RowNames = RowNames';

Z = -1.*Z; Z = [Z zeros(1,nConstraint+1)];

x = zeros (1,nConstraint)';
matConstraint = zeros (nConstraint,nVariable+1);
for i = 1 : nConstraint
    matConstraint (i,:) = input("input constraint at - " + i + " : ");
    signCons(i) = input("sign : ");
    if signCons(i) == '>'
        matConstraint(i,:) = -1*matConstraint(i,:);
        x(i) = 1;
    elseif signCons == '='
        x(i) = 2;
    end
    if matConstraint(i,end) < 0
        matConstraint(i,:) = -1*matConstraint(i,:);
        if signCons(i,1) == '<' 
            signCons(i,1) = '>';
            x(i) = 1;
        elseif signCons(i,1) =='>'
            signCons(i,1) = '<';
            x(i) = 0;
        end
    end
end
Matrices = [matConstraint(:,1:end-1) eye(nConstraint) matConstraint(:,end)];
for i = 1:nConstraint
    if x(i) == 1
        Matrices(i,:) = -Matrices(i,:);
    elseif x(i) == 2
        Matrices(i,nVariable+i) = 0;
    end
end
V = zeros(nConstraint,1);

M = [Matrices;Z];
M = array2table(sym(M),'VariableNames',header,'RowNames',RowNames);
disp(M);
k = 1;
while (true)
    VariableKunci = input("Choose column key : ");
    format short;
    Rasio = Matrices(1:nConstraint,end)./Matrices(1:nConstraint,VariableKunci);
    Rasio = Rasio'
    format rat;
    BarisKunci = input("Choose row key : ");
    RowNames(BarisKunci) = "x" + string(VariableKunci);
    V(BarisKunci) = VariableKunci;
    Matrices(BarisKunci,:) = Matrices(BarisKunci,:)./Matrices(BarisKunci,VariableKunci);
    for j = 1 : nConstraint
        if j ~= BarisKunci
            Matrices(j,:) = Matrices(j,:) - Matrices(BarisKunci,:).*Matrices(j,VariableKunci);
        end
    end
    disp("ITERASI KE - " + k);
    Z = Z - Matrices(BarisKunci,:).*Z(VariableKunci);
    M = [Matrices;Z];
    M = array2table(sym(M),'VariableNames',header,'RowNames',RowNames);
    disp(M);
    x = input("continue iteration 1/0 ? : ");
    k = k+1;
    if x == 0
        break;
    end
end

disp ("the optimal solution :" + Z(end));
for k = 1 : nConstraint
    if V(k) ~=0 && V(k) <= nVariable
        disp ("Variable at - " + V(k) + " = " + Matrices(k,end));
    end
end
