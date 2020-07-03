clc,close all,clear all
n=25; %cantidad de cuadros
puntos=256; %cantidad de puntos por cuadros
M=27; %cantidad de filtros de mel
fs=8000;
cant_coef=10; %cantidad de coeficientes de la DCT-II

train=zeros(30,250);
target=zeros(30,6);

for i=1:30
%grabar voz
grabar;

%reducir frecuencia de muestreo
load('coef.mat');
y=filter(Num,1,y);%filtrado
load('coef_H.mat');
y=filter(Num_H,1,y);
x=diezmar(y);


%pre enfatizar
x=preenf(x);

% %end point detection
x=epd(x);
figure 
plot(x)
title('Voz Detectada')
soundsc(x,8000)
% x=x/max(x);
pause

% %segmentado de la señal de voz
c = cuadros (x,n,puntos);


% %ventanado de segmentos
c = ventanado (c);

% %calculo del espectro
f=espectro (c);

% %filtros de MEL
mel=filt_mel (f,M,fs,puntos);


% %cálculos de los MFCC
Coef = MFCC(mel,cant_coef);

%vector de características
% [m n]=size(Coef);
train(i,:)=reshape(Coef',1,250);
var=input('numero?','s');
switch var
    case '1'
        target(i,:)=[0 0 0 0 0 1];
    case '2'
        target(i,:)=[0 0 0 0 1 0];
    case '3'
        target(i,:)=[0 0 0 1 0 0];
    case '4'
        target(i,:)=[0 0 1 0 0 0];
    case '5'
        target(i,:)=[0 1 0 0 0 0];
    case '6'
        target(i,:)=[1 0 0 0 0 0];
end
disp('Continuar');
i
pause
end
