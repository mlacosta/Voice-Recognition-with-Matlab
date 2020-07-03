function y = diezmar (x)
%diezma un factor de 6

for i=1:6:length(x)
    if i==1
        y(1)=x(1);
    end
y((i-1)/6+1)=x(i);   
    
end
