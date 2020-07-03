function y = preenf(x)

n=length(x);

for i=2:n
 x(i)=x(i)-.95*x(i-1);
    
end

y=x;
end