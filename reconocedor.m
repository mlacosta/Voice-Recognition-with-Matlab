clc,clear all
load('red_1')
n=25; %cantidad de cuadros
puntos=256; %cantidad de puntos por cuadros
M=27; %cantidad de filtros de mel
fs=8000;
cant_coef=10; %cantidad de coeficientes de la DCT-II

train=zeros(1,250);


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


% %segmentado de la se?al de voz
c = cuadros (x,n,puntos);


% %ventanado de segmentos
c = ventanado (c);

% %calculo del espectro
f=espectro (c);

% %filtros de MEL
mel=filt_mel (f,M,fs,puntos);

% %c?lculos de los MFCC
Coef = MFCC(mel,cant_coef);

%vector de caracter?sticas
% [m n]=size(Coef);
train(:)=reshape(Coef',1,250);
neural=net(train');
neural=round(neural);
for i=1:7
    if i<7 & neural(i)>.7
%        switch i
%            case 1
%                disp('Play. Entendido.');
%            case 2
%                disp('Pausa. Entendido.');
%            case 3
%                disp('Siguiente. Entendido.');
%            case 4
%                disp('Atr?s. Entendido.');
%            case 5
%                disp('Subir. Entendido.');
%            case 6
%                disp('Bajar. Entendido.');
%           
%        end

       switch i
           case 1
               imshow('C:\MLA003\Project  Fpga Comunicaciones\Sistema Matlab\Imagenes\play.png');
           case 2
               imshow('C:\MLA003\Project  Fpga Comunicaciones\Sistema Matlab\Imagenes\pausa.png');
           case 3
               imshow('C:\MLA003\Project  Fpga Comunicaciones\Sistema Matlab\Imagenes\siguiente.jpg');
           case 4
               imshow('C:\MLA003\Project  Fpga Comunicaciones\Sistema Matlab\Imagenes\atras.jpg');
           case 5
               imshow('C:\MLA003\Project  Fpga Comunicaciones\Sistema Matlab\Imagenes\subir.jpg');
           case 6
               imshow('C:\MLA003\Project  Fpga Comunicaciones\Sistema Matlab\Imagenes\bajar.jpg');
          
       end

       break;
    elseif i==7 
            disp('No te entend?.');
    end
  
end

