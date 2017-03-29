a = [4 -1 0 1 0 ; -1 4 -1 0 1 ; 0 -1 4 -1 0 ; 1 0 -1 4 -1 ; 0 1 0 -1 4];
b = [100 ;100; 100; 100; 100 ];
[m,n] = size(a)
it = 20;
x = zeros(it+1,m);
r = zeros(it,m);
br = zeros(1,n)
for k = 1:it
    for i = 1:m
     r(k,i) = b(i,1) - a(i,1)*x(k,1) - a(i,2)*x(k,2) - a(i,3)*x(k,3)- a(i,4)*x(k,4)-a(i,5)*x(k,5);
     x(k+1,i) = x(k,i) + r(k,i)/a(i,i);
    end
  for kk = 1 : m
      br(1,kk) = (abs(x(k+1,kk)-x(k,kk)))
  end
  if ( br(1,1:kk) < 0.000001)
      noit = k
      break;
  end
end
x,noit