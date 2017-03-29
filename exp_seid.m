cc = [1 1 6 ; 1 9 -2 ; 8 2 -1 ];
bb = [-61.3 ; 49.1 ; 185.8 ];
aa = [cc  bb];
[m,n] = size(aa);
for ii = 1:m
    for jj = ii+1 :m
        if abs(aa(ii,ii)) < abs(aa(ii,jj))
            temp = aa(ii,:) ; aa(ii,:) = aa(jj,:) ; aa(jj,:) = temp;
        end
    end
end
aa
bbb = aa(:,4)
b = bbb
a = aa(:,1:3)
[m,n] = size(a)
it = 20;
x = zeros(it+1,m);
r = zeros(it,m);
br = zeros(1,n)
for k = 1:it
    for i = 1:m
        sum1 = 0;
        sum2 = 0;
        sum = 0;
        for ii = 1 : n
            if ii < i
            sum1 = sum1 + a(i,ii)*x(k+1,ii);
            end
            if ii >= i
                sum2 = sum2 + a(i,ii)*x(k,ii);
            end
            sum = sum1 + sum2;
                
        end
     r(k,i) = b(i,1) - sum;
     x(k+1,i) = x(k,i) + r(k,i)/a(i,i);
    end
  for kk = 1 : m
      br(1,kk) = (abs(x(k+1,kk)-x(k,kk)))
  end
  if ( br(1,1:kk) < 10E-06)
      noit = k
      break;
  end
end
x(noit,:), noit