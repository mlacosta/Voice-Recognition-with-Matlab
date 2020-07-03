function mel=filt_mel (f,M,fs,N);


%f=espectro,M=cantidad de cuadros, fs=frecuencia de muestreo, N=tamaño fft
%nota= frecuencia mas baja es 100hz, la mas alta es 4000hz
ff=zeros(1,M);
[frames,points]=size(f);
fl=1125*log(1+0/700);
fh=1125*log(1+4000/700);
f=f.^2;
mel=zeros(frames,M-2); 

for i=1:M
    ff(i)=(N/fs)*b_MFCC( fl+(i-1)*(fh-fl)/(M+1) );
    
end

for j=1:frames
for i=1:(M-2)
    h=filt_triang(ff(i),ff(i+1),ff(i+2),[0:(points-1)]);
 mel(j,i)= log(sum(f(j,:).*h));
end
end

end
