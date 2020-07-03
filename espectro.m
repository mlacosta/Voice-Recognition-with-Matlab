function f = espectro (c)

[n,m]=size(c);
f=zeros(size(c));

for i=1:n
    f(i,:)=abs(fft(c(i,:),m));

end
f=f(:,1:(m/2));