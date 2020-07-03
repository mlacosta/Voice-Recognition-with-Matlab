function c = ventanado (x)

[n,m]=size(x);
w=hamming(m)';

for i=1:n
    c(i,:)=w.*x(i,:);

end