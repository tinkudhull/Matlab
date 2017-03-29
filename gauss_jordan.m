a = [2 1 -4 1 4 ; -4 3 5 -2 -10 ; 1 -1 1 -1 2 ; 1 3 -3 2 -1];
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
    for k = 1 : i-1
        a(k,:) = a(k,:)-a(i,:)*a(k,i)/a(i,i);
    end
end
x = zeros(1,m)
for p = 1:m
    x(1,p) = a(p,n)/a(p,p);
end
a
x'