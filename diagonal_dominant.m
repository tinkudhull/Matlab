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
b = bbb'
a = aa(:,1:3)
a,b