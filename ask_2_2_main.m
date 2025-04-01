clc
clear

cpudata = xlsread("Machine CPU.xlsx"); % Read data from the Excel file  

x = cpudata(:,4:9); 
assoi = ones(length(x),1); % Create a column vector of ones with the same number of rows as x
x = [x assoi]; % Append a column of ones to the matrix x

y = cpudata(:,10);

% Compute all coefficients
[a,b,yp,mare,r2] = func3(x,y);

% 1st Plot
plot(1:209,y,'b') % Plot actual values in blue
hold on
plot(1:209,yp,'r') % Plot predictions in red
legend('Real','Estimated');
xlabel('Data');
ylabel('CPU Performance');
hold off

% 2nd Plot - Actual vs. Predicted values
scatter(y,yp); 
xlabel('Estimated');
ylabel('Real');

% Uncomment the following lines for 3D surface visualization:
% k = linspace(8000,16000,100);
% c = linspace(32,128,100);
% [kk,cc] = meshgrid(k,c);
% x2 = [200 3000 k c 6 16 1];
% z = x2*a;
% mesh(kk,cc,z)