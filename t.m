ff=zeros(1,M);
[frames,points]=size(f);
fl=1125*log(1+0/700);
fh=1125*log(1+4000/700);
f=f.^2;
N=256
for i=1:M
    ff(i)=(N/fs)*b_MFCC( fl+(i-1)*(fh-fl)/(M+1) );
    
end
figure
for j=1:frames
for i=1:(M-2)
    h=filt_triang(ff(i),ff(i+1),ff(i+2),[0:(points-1)]);
    hold on
    plot(h)
 mel(j,i)= log(sum(f(j,:).*h));
end
end
