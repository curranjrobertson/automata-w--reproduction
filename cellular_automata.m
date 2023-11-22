clear all;clc;close all
N = 1500;
x = 1:1:N+1;
y = 1:1:N+1;

Z = zeros(N+1,N+1);
Z(1, N/2) = 1;
Z(1, N/2-1) = 1;
Z(1, N/2+1) = 1;

for i = 1:N
  for j = 2:N
    if Z(i,j-1) >= 0.5 && Z(i,j) >= 0.5 && Z(i,j+1) >= 0.5
      mu = (1+1+1)/3;
      Z(i+1,j) = 1;
    elseif Z(i,j-1) >= 0.5 && Z(i,j) >= 0.5 && Z(i,j+1) < 0.5
      mu = (1+1+0)/3;
      Z(i+1,j) = 1;
    elseif Z(i,j-1) >= 0.5 && Z(i,j) < 0.5 && Z(i,j+1) >= 0.5
      mu = (1+1+1)/3;
      Z(i+1,j) = 1;
    elseif Z(i,j-1) < 0.5 && Z(i,j) >= 0.5 && Z(i,j+1) >= 0.5
      mu = (0+1+1)/3;
      Z(i+1,j) = 5*mu*rand;
    elseif Z(i,j-1) < 0.5 && Z(i,j) < 0.5 && Z(i,j+1) >= 0.5
      mu = (0+0+1)/3;
      Z(i+1,j) = 6*mu*rand;
    elseif Z(i,j-1) < 0.5 && Z(i,j) >= 0.5 && Z(i,j+1) < 0.5
      mu = (0+1+0)/3;
      Z(i+1,j) = 3*mu*rand;
    elseif Z(i,j-1) >= 0.5 && Z(i,j) < 0.5 && Z(i,j+1) < 0.5
      mu = (1+0+0)/3;
      Z(i+1,j) = 1*mu*rand;
    elseif Z(i,j-1) < 0.5 && Z(i,j) < 0.5 && Z(i,j+1) < 0.5
      Z(i+1,j) = 0;
    end
  end
end

[X,Y] = meshgrid(x,y);
surf(X,Y,Z);

hold on;
view(2);


