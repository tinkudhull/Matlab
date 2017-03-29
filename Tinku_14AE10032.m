% Name - Tinku, Roll No. - 14AE10032
clc; clear all;
load('Input_data')
load('Output_data')
Input_data;
Output_data;
%scaling of data
mu = 0.88; 
scmin = -.5;
scmax = .5;
[n ni] = size(Input_data);
[n no] = size(Output_data);
smin = min([Input_data Output_data]);
smax = max([Input_data Output_data]);
scalefac = (scmax- scmin)./(smax- smin);
for i = 1:ni
    Iput(:,i) = scmin +(Input_data(:,i)- smin(i))*scalefac(i);
end
for i = 1:no
    Oput(:,i) = scmin + (Output_data(:,i) - smin(i+ni))*scalefac(i+ni);
end
X = Iput;
Z = Oput;
nh = 5 ; % number of units in hidden layer
w1 = scmin+(scmax-scmin).*rand(nh,2); 
w2 = scmin+(scmax-scmin).*rand(2,nh);
for kk = 1:200
%1
for k = 1 : n
u0 = X;
y1(k,:) = u0(k,:)*w1';
u1(k,:) = tanh(y1(k,:));
y2(k,:) = u1(k,:)*w2';
u2(k,:) = tanh(y2(k,:));
%2
diffy2(k,:) = sech(y2(k,:)).^2;
diffy1(k,:) = sech(y1(k,:)).^2;
%3
e2b(k,:) = diffy2(k,:).*(Z(k,:)-u2(k,:));
e1b(k,:) = diffy1(k,:).*(e2b(k,:)*w2);
%4
w2 = w2 + mu.*e2b(k,:)'*(u1(k,:));
w1 = w1 + mu.*e1b(k,:)'*(u0(k,:));
end

end
[nx ny] = size(Z);
sigma2 = 1/(nx*ny)*sum(sum((Z-u2)'*(Z-u2)));


%descaling of data
for i = 1:ni
    DSIput(:,i) = smin(i) + (Iput(:,i) - scmin)/scalefac(i);
end
for i = 1:no
    DSOput(:,i) = smin(i+ni) + (Oput(:,i) - scmin)/scalefac(i+ni);
    Caloput(:,i) = smin(i+ni) + (u2(:,i)-scmin)/scalefac(i+ni);
end

% Plots
plot(DSOput(:,1))
hold on
plot(Caloput(:,1),'r')

figure
plot(DSOput(:,2))
hold on
plot(Caloput(:,2),'r')

MSE_mean_square_error = sigma2
