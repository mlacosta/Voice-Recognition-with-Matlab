
clc,close all,clear all
n=25; %cantidad de cuadros
puntos=256; %cantidad de puntos por cuadros
M=27; %cantidad de filtros de mel
fs=8000;
cant_coef=10; %cantidad de coeficientes de la DCT-II

%grabar voz
grabar;
plot(y)
title('Grabaci?n')
pause

%reducir frecuencia de muestreo
load('coef.mat');
y=filter(Num,1,y);%filtrado
load('coef_H.mat');
y=filter(Num_H,1,y);
x=diezmar(y);
figure
plot(x)
title('Grabaci?n Diezmada')
soundsc(x,8000)
pause

%pre enfatizar
x=preenf(x);
plot(x)
title('Grabaci?n Pre-enfatizada')
soundsc(x,8000)
pause
% %end point detection
x=epd(x);
figure 
plot(x)
title('Voz Detectada')
soundsc(x,8000)
% x=x/max(x);
pause

% %segmentado de la se?al de voz
c = cuadros (x,n,puntos);
figure
title('Segmentado de la Voz')
for i=1:25
subplot(5,5,i)
plot(c(i,:)) 
end
pause

% %ventanado de segmentos
c = ventanado (c);
title('Ventaneo de Segmentos')
for i=1:25
subplot(5,5,i)
plot(c(i,:))
end
pause
% %calculo del espectro
f=espectro (c);
for i=1:25
subplot(5,5,i)
plot(f(i,:))
end
pause
% %filtros de MEL
mel=filt_mel (f,M,fs,puntos);

for i=1:25
subplot(5,5,i)
stem(mel(i,:))
end

% %c?lculos de los MFCC
Coef = MFCC(mel,cant_coef);

%vector de caracter?sticas
[m n]=size(Coef);
train=reshape(Coef',1,m*n);

