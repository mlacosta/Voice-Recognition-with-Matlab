function c = cuadros (x,n,puntos)

c=zeros(n,puntos);
l=length(x);
d=puntos*(1-(1/puntos*(puntos-floor((l-puntos)/(n-1)))));
a=zeros(1,n);
b=zeros(1,n);
for i=1:n
    if i==1
       a(i)=1;
       b(i)=puntos;
    else
        a(i)=a(i-1)+d-1;
        b(i)=a(i)+puntos-1;
    end
end

for i=1:n
    c(i,:)=x(a(i):b(i));
end

end