function [I] = Simpson(x,y)
%Created by: Katie Sheridan
%Created on: April 15 2019
%Last Edited: April 17 2019
%
%This function uses Simpsons 1/3 rule to find the integral of a function
%over a given interval
%
%  x = array of evenly spaced input values
%  y = array of f(x) values corresponding to the values in the x array
% Make sure the values in y have the same indexing as their corresponding x
% value
%
%  I = value of the integral
%   

%% Error Checks and Variable Values
if nargin ~=2  %Make sure there are only two inmputs
    error('There must be two inputs.')
end

if length(x) <= 1  %Make sure x is more than one element
    error ('x must have more than one element')
end

if length(x) ~= length(y)  %Make sure x and y have the same number of values
    error ('x and y must be the same size')
end


format long
w=length(x); 
v=length(y);
z=linspace(x(1), x(w), length (x));   %Create a z array that has linear spacing. For comparison to x array
I=0;   %Initial integration is equal to 0

%% Integration
if z==x  
    if mod(w,2)~=0  %To find if the number of x values is even or odd, if it's odd continue with Simpsons
        d=((x(3)-x(1))/6);  %First part of Simpsons formula
        for i=1:2:w-2  %Determine how many iterations of Simpsons need to be used
            f= y(i)+(4*y(i+1))+ y(i+2);  %Second part of Simpsons formula
            I=I+(d*f);  %Calculate the integral and add it to the values from the previous iterations
        end
    else mod(w,2)==0  %If the number of x values is even, other methods must be added
        d=((x(3)-x(1))/6);   
        for i=1:2:w-2  %Same iterations and formulas for Simpsons, but leaving out the last values
            f= y(i)+(4*y(i+1))+y(i+2);
            I=I+(d*f);
        end
        g=((y(v-1)+y(v))/2)*(x(w)-x(w-1));  %Trapezoidal method used to calculate area of the final interval
        I=I+g;  %Integral is equal to the integral from Simpsons plus the Trapezoidal integral
        disp('Trapezoidal Method was used in addition to Simpsons to find the integral')  %Warn the user that Trapezoidal method was used
    end
    else z~=x  %If the intervals of x are not equal, the user needs to redo them so they are even
        error('The intervals between x values are not constant. Please re-evaluate the intervals') %Warn the user to redo x intervals
end
disp('I= ')
disp(I)

end

