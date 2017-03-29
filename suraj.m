clc; clear all;
load('Input_data')
load('Output_data')
mu = 0.5; 
scmin = -.5;
scmax = .5;
[n nI] = size(Input_data);
[n no] = size(Output_data);
smin = min([Input_data Output_data]);
smax = max([Input_data Output_data]);
ScaleFac = (scmax- scmin)./(smax- smin);
for i = 1:nI
    Iput(:,i) = scmin +(Input_data(:,i)- smin(i))*ScaleFac(i);
end
for i = 1:no
    Oput(:,i) = scmin + (Output_data(:,i) - smin(i+nI))*ScaleFac(i+nI);
end
u0 = Iput;
Z = Oput;
w1 = scmin+(scmax-scmin).*rand(2,2); 
w2 = scmin+(scmax-scmin).*rand(2,2);
for j = 1:200
for i = 1 : n
y1(i,:) = u0(i,:)*w1';
u1(i,:) = tanh(y1(i,:));
y2(i,:) = u1(i,:)*w2';
u2(i,:) = tanh(y2(i,:));
e2bk(i,:) = (sech(y2(i,:)).^2).*(Z(i,:)-u2(i,:));
e1bk(i,:) = (sech(y1(i,:)).^2).*(e2bk(i,:)*w2);
w2 = w2 + mu.*e2bk(i,:)'*(u1(i,:));
w1 = w1 + mu.*e1bk(i,:)'*(u0(i,:));
end
end
for i = 1:nI
    DSIput(:,i) = smin(i) + (Iput(:,i) - scmin)/ScaleFac(i);
end
for i = 1:no
    DSOput(:,i) = smin(i+nI) + (Oput(:,i) - scmin)/ScaleFac(i+nI);
end
for i = 1:no
    predict(:,i) = smin(i+nI) + (u2(:,i)-scmin)/ScaleFac(i+nI);
end
plot(DSOput(:,1))
hold on
plot(predict(:,1),'r')
figure
plot(DSOput(:,2))
hold on
plot(predict(:,2),'r')