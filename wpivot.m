a = [3 2 105 104; 2 -3 103 98; 1 1 3 3];
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
a
