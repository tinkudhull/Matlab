a = [3 2 105 104 ; 2 -3 103 98 ; 1 1 3 3  ];
[m,n] = size(a);
for i = 1:m
    o = zeros(m,1);
    for j = i:m
        o(j,1) = a(j,i)/max(abs(a(j,1:n)));
    end
        [c,d]=max(abs(o));
        temp = a(i,:) ; a(i,:) = a(d,:) ; a(d,:) = temp;
    for k = i+1:m
        a(k,:) = a(k,:)-a(i,:)*a(k,i)/a(i,i);
     end
end
a
  