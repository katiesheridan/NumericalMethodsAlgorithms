function [root,fx,ea,iter] = falseposition(func,xl,xu,es,maxiter)
%This function is designed to find the root of a function using the false
%position method
%
% Enter function as falseposition(@(x) func,xl,xu,es,maxiter)
%
%IF FUNCTION IS NOT WORKING OR RETURNING AN ERROR, TRY BOUNDS THAT ARE
%CLOSER TOGETHER AND NON-ZERO INTEGERS
%
%INPUTS
%  func: the function you are trying to find the root of (in terms of x)
%       typed as follows func = @(x) function in terms of x
%  xl: the lower bound
%  xu: the upper bound
%  es: the desired relative error (will defalut to .00001%)
%  maxiter: the number of iterations desired (will default to 200)
%
%OUTPUTS
%  root: estimated location of the root (the x value)
%  fx: the function evaluated at the root
%  ea: the approximate relative error (%)
%  iter: the number of iterations it took to get there
% 
format long

if nargin<3;  %Tests to assign the values to variables in the fuction not defined by the user
    error('At least 3 inputs required.')
end

if nargin<4;
    es=.00001;
end

if nargin<5; 
     maxiter=200;
end

test1= func(xl)*func(xu); %Test for sign chane along interval
if test1>0;
    error ('No sign change along the interval.  Please choose new bounds.')
end

if xl==0;   %Make zeros into non-zero numbers
    xl=.0000001;
elseif xu==0;
    xu=-.0000001;
end

iter=0;
xr=xl;
ea=100;
while(1)  %while loop to find xr values and plug them in for the bounds
    xro=xr;
    xr = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    iter= iter+1;
    if xr~=0 
        ea = abs(((xr-xro)/xr)*100);
    end
    
  if sign(xr)<=0 && sign(xl)<=0;  %if statement to figure out whether to plug xr value in for xl or xu
        xl=xr;
    elseif sign(xr)<=0 && sign(xu)<=0;
        xu=xr;
    elseif sign(xr)==1 && sign(xl)==1;
        xl=xr;
    elseif sign(xr)==1 && sign(xu)==1;
        xu=xr;
 end

  if ea<= es || iter >= maxiter   %conditional statement to end the while loop
      break
  end
end
root = xr;
fx= func(xr);

fprintf ('The root is %f\n', root)  %fprints to display the outputs
fprintf ('f(x) = %f\n',fx)
fprintf ('The approximate relative error is %f\n', ea)
fprintf ('The number of iterations is %f\n', iter)

end

