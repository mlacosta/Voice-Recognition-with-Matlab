clear all
close all
z=[1 1 1 1 -1 -1 -1 -1]';
p=[0.8595*exp(2*0.4723*j) .8962*exp(2*0.4723*j) .8962*exp(-2*0.4723*j) 0.8595*exp(-2*0.4723*j)]';
zplane(z,p)
[b,a] = zp2tf(z,p,1);
figure
freqz(b,a)