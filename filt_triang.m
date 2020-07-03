function H = filt_triang(f0,f1,f2,k)
H=zeros(size(k));
for i=1:length(k)
if k(i)<f0
 H(i)=0;
elseif (f0<=k(i)) & (k(i)<=f1)
 H(i)=(k(i)-f0)/(f1-f0);   
elseif (f1<=k(i)) & (k(i)<=f2)
 H(i)=(f2-k(i))/(f2-f1);
elseif k(i)>f2
 H(i)=0;
end

end

end