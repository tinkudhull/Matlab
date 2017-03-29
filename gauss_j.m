a = [2 1 -4 1 ; -4 3 5 -2 ; 1 -1 1 -1 ; 1 3 -3 2 ];
b = [4 -10 2 -1];
c = [1 0 0 0 ; 0 1 0 0 ; 0 0 1 0; 0 0 0 1];
d = [a c];
[m n] = size(d);
for i = 1 : m
   if d(i,i) == 0;
       temp = d(i,:); d(i,:) = d(i+1,:) ; d(i+1,:) = temp;
   end
   for j = i+1 : m 
       d(j,:) = d(j,:) - d(i,:)*d(j,i)/d(i,i);
   end
   for k = 1 : i-1
       d(k,:) = d(k,:) - d(i,:)*d(k,i)/d(i,i);
   end
end
d
for p = 1:m
    d(p,:) = d(p,:) / d(p,p)
end
d
ainv = d(1:4,5:8);
x = ainv * b'
disp(' Inverse of A is :')
ainv
disp('solution of the linear equations is :')
x
