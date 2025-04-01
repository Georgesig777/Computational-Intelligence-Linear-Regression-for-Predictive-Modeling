function [a,b,yp,mare,r2] = func(x,y)

p = length(x); % Set the number of data points (p) equal to the number of elements  
               % in vector x, which contains the data.  
               % We could also use the length of y.  

ssxx = sum(x.^2,[1 p]) - (sum(x,[1 p]).^2/p); % Compute the sum of squares for x  
ssxy = sum((x.*y),[1 p]) - ((sum(x,[1 p]) * sum(y,[1 p]))/p); % Compute the sum of cross products  
a = ssxy / ssxx; % Calculate the slope coefficient  

yavg = sum(y,[1 p]) / p; % Compute the mean of y  
xavg = sum(x,[1 p]) / p; % Compute the mean of x  

b = yavg - (a * xavg); % Compute the intercept  

yp = (a * x) + b; % Compute predictions for all available data  

mare = 100 * (sum(abs(y - yp) ./ y) / p); % Compute the Mean Absolute Relative Error (MARE)  

sse = sum((y - yp).^2,[1 p]); % Compute the Sum of Squared Errors (SSE)  
sst = sum((y - yavg).^2,[1 p]); % Compute the Total Sum of Squares (SST)  

r2 = 1 - (sse / sst); % Compute the R-squared (R²) coefficient  