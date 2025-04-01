function [a,b,yp,mare,r2] = func3(x,y)

a = ((x'*x)^-1) * x' * y; % Compute the coefficient matrix A  

yp = x * a; % Compute predictions  

b = yp(:,end); % Extract the constant term b  

% Compute the Mean Absolute Relative Error (MARE)  
p = length(y); % Number of data points  
mae = sum(y - yp, [1 p]) / p; % Mean absolute error  

mare = 100 * mae; % Convert to percentage  

% Compute the R-squared (R²) coefficient  
yavg = sum(y, [1 p]) / p; % Compute mean of y  
sse = sum((y - yp).^2, [1 p]); % Compute Sum of Squared Errors (SSE)  
sst = sum((y - yavg).^2, [1 p]); % Compute Total Sum of Squares (SST)  

r2 = 1 - (sse / sst); % Compute R² value  