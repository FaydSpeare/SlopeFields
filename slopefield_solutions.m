hold off
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



ivp=[0,1;1.17165,0];
pairs = size(ivp,1);

step = 0.01;

upper = 5;
lower = -5;

arrowheads = 'on';


colors = ['r';'g';'b';'k'];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[x y]=meshgrid(lower:0.3:upper);

dydx = equ(x,y);

dx = 0.1./(1+(dydx).^2).^0.5;
dy = (0.1.*dydx)./(1+(dydx).^2).^0.5;

h = quiver(x,y,dx,dy);
set(h, 'AutoScaleFactor',0.5, 'ShowArrowHead',arrowheads);
axis tight;
axis equal;





steper = 0;
colour_choice;

for i = 1 : 1 : pairs

    colour_choice = color(i);
    colour_choice = strcat(colour_choice,'.');
    n=0;
    matrix(1, 2)= ivp(i,1);
    matrix(1, 1)= ivp(i,2);
    
    while n < (upper-(ivp(i,2)))./step
      n= n + 1;
      matrix(n+1,1)=matrix(n,1)+step;
      matrix(n+1,2) = matrix(n,2)+(equ(matrix(n,1),matrix(n,2)).*step);
      hold on
      if matrix(n,2) < upper && matrix(n,2) > lower && matrix(n,1) < upper && matrix(n,1) > lower
        plot(matrix(n,1),matrix(n,2),colour_choice);
      end
    end
    steper = steper + 0.5;
    a = [num2str(steper),' completed'];
    disp(a)
    n=0;
    while n < -(lower-ivp(i,2))/step
      n= n + 1;
      matrix(n+1,1)=matrix(n,1)-step;
      matrix(n+1,2) = matrix(n,2)-(equ(matrix(n,1),matrix(n,2)).*step);
      hold on
      if matrix(n,2) < upper & matrix(n,2) > lower & matrix(n,1) < upper & matrix(n,1) > lower
        plot(matrix(n,1),matrix(n,2),colour_choice);
      end
    end
    steper = steper + 1./2;
    a = [num2str(steper),' completed'];
    disp(a)
    
    plot(ivp(i,2),ivp(i,1),'b*')
end
disp('plotting...')
title('')

function m = equ(x,y)
m = x.^3 + y.^3 -6.*x.*y;
m = x-y;
end