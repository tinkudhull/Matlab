a = [1 2 1 2 ; 2 6 1 7 ; 1 1 4 3 ];
[m,n] = size(a);
for i = 1:m
    if a(i,i) == 0;
        t = a(i,:);
        a(i,:) = a(i+1,:);
        a(i+1,:) = t;
    end
    for j = i+1:m
        a(j,:) = a(j,:)-a(i,:)*a(j,i)/a(i,i);
    end
end
x = zeros(1,m);
for s = m:-1:1
    c = 0;
    for k = 2:m
        c = c+a(s,k)*x(k);
    end
    x(s) = (a(s,n)-c)/a(s,s);
end
disp('Answer of the linear system of equations is :');
a
x'