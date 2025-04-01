clc 
clear 
load ampldata.mat % Load the file that contains the data

x = log10(dat(:,1)); % Compute the base-10 logarithm of the frequency from the first column of ampldata
y = dat(:,2); % Extract the gain from the second column of ampldata

[a,b,yp,mare,r2] = func(x,y); % Call the function from Question A

% Plot the graph for Question B
plot(x,y,'r'); % Actual values in red
hold on
plot(x,yp,'b'); % Predictions in blue
legend('Real','Estimated');
xlabel('Frequency');
ylabel('Gain');

% Call the function from Question B
g = func2(a,b,0);