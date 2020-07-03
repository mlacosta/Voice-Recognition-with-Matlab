function [y] = epd (x)

n=length(x);
sss=std(x(1:1000));
umbral=5*sss;

for i=1:n
   
    if abs(x(i))>umbral
       pi=i;
       break;
    end
    
end

for i=n:-1:1
   
    if abs(x(i))>umbral
       pf=i;
       break;
    end
    
end
y=x(pi:pf);
end