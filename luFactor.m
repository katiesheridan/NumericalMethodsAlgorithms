function [L,U,P] = luFactor(A)
%LU Factorization 
%Created by: Katie Sheridan
%Last edited: 2 April 2019
%
%   A= Initial matrix of coefficients from the linear equation
%   L= Lower triangular matrix from calculated elimination values. Values
% used to find the d matrix. 
%    U= Upper triangular matrix of values obtained from elimination.  Values
% used to find the unknown x values. 
%    P= Pivot matrix. Used to keep track of pivoting and helps ensure no division
% by zero
%
% Inp.uts must be an nxn matrix of values.
% Outputs will also be nxn matrices
%

%% Error checks 
if nargin~=1 
    error('There must be one input') %There must be only one matrix input
end

[m,n]= size(A); %store m and n as variables that are equal to each other
if m~= n, error('A must be a square matrix')%Make sure A is a square matrix
end


%% Pivoting, elimination, and creating U & P
P=eye(n); %create an identity matrix and set it equal to P
U=A;      %Set U equal to A so it can be further manipulated without changing A 
a=1;    
for b = 1:m   %Go by columns to check if pivoting is needed
    if abs(U(a,b))< max(abs(U(a:n,b)))  %Check column for the max value
        [~,f] = max(abs(U(a:n,b)));    %Set the row of that value equal to f
        f=f+a-1;    %Used in other iterations to ensure no pivoting of rows that shouldn't be included in the pivot (i.e. during second iteration don't pivot with the first row)
        U([a f],:)= U([f a],:);   %Pivot a and f if needed in U matrix
        P([a f],:)= P([f a],:);   %Pivot a and f in P matrix so it reflects the same pivot as U did
    end
    a = a+1; %Add one to a so iterations continue
    
    for c = a:n    %Now go by rows for elimination, ensures the elimination of each value for the whole colunm
        elim_ratio = (U(c,b)/U(b,b));  %Create the elimination ratio
        U(c,b:m) = U(c,b:m)-(U(c,b)/U(b,b))*U(b,b:m);  %Replace old U row with the new U row that has new values and eliminated values 
        U(c,b) = elim_ratio;  %Store the elimination ratio in the eliminated values of the row
    end    
end 

%% Create L matrix from values stored in U
L= eye(n);   %Create an identity matrix equal to L
for j=1:m    
    for i=j+1:n
        L(i,j)= U(i,j);  %Set the lower values in the L matrix equal to the elimination values stored in the U matrix
    end
end
for j=1:m 
    for i=j+1:n
        U(i,j)= 0; %Set those elimination values stored in U equal to zero so it becomes an upper matrix
    end
end

%% Displaying the outputs with labels and as matrices
 disp('L= ') %Display L and the corresponding L matrix
 disp(L)
 disp('U= ') %Display U and the corresponding U matrix
 disp(U)
 disp('P= ') %Display P and the corresponding P matrix
 disp(P)
 
