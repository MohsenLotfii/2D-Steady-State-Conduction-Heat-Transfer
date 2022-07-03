
% Created by: 'Mohsen Lotfi'
% Last Revised: 18 April 2017
% Persian Gulf University, Bushehr, Iran

% A program for solving the Poisson equation:
% DEL^2 U = F(X,Y)
% on the rectangle 0 <= X <= 1 , 0 <= Y <= 1
% with Dirichlet boundary condition
% The number of X grid points is 20
% The number of Y grid points is 20
% The X grid spacing is 0.05
% The Y grid spacing is 0.05

tic
    
% clear work space
clear
clc

% boundary conditions
u1 = 0; 
u2 = 200;

W = 1; % Width of domain
H = 1; % Height of domain

a = 0; 
b = 1;
m = 160;
h = (b-a)/(m-1); % Mesh spacing
% [x,y] = meshgrid(a:h:b); % Uniform mesh, including boundary points.

x_range = 0:h:1;
y_range = 0:h:1;

% Place holder for u
u = zeros(length(x_range) , length(y_range)); 

for i = 1:length(x_range)
    x = x_range(i);
    
    for j = 1:length(y_range)
        y = y_range(j);
        
        % u = u_exact
        syms n
        u(j,i) = u1+(2/pi)*(u2-u1)*symsum(((1+(-1)^n+1)/n)*sin(n*pi*x)*((sinh(n*pi*y/W)/(sinh(n*pi*H/W)))) , n , [1 1])
    end
end

u_exact = u

% Plotting the exact solution
figure(1)
contourf(u); title('Temperature plot (contourf)')
colorbar

figure(2)
contour(u); title('Temperature plot (contour)')
colorbar

% Calculating Error:
load u_num160

Error = abs(u_exact - u_numerical);
Err = (norm(Error)/norm(u_exact))
 
toc

