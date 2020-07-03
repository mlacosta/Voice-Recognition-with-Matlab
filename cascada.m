clear all
clc
load('cas_filt.mat')
format long
[r,p,k]=residue(Num,Den)

e01=r(1)+r(2)
e11=(r(1)*p(2)+r(2)*p(1))*-1
a11=p(1)+p(2)
a21=-1*(p(1)*p(2))

e02=r(3)+r(2)
e12=(r(3)*p(4)+r(4)*p(3))*-1
a12=p(3)+p(4)
a22=-1*(p(3)*p(4))

e03=r(5)+r(6)
e13=(r(5)*p(6)+r(6)*p(5))*-1
a13=p(5)+p(6)
a23=-1*(p(5)*p(6))

e04=r(7)+r(8)
e14=(r(7)*p(8)+r(8)*p(7))*-1
a14=p(7)+p(8)
a24=-1*(p(7)*p(8))


e01=round(real(e01)*2^21)
e11=round(real(e11)*2^21)
a11=round(real(a11)*2^21)
a21=round(real(a21)*2^21)

e02=round(real(e02)*2^21)
e12=round(real(e12)*2^21)
a12=round(real(a12)*2^21)
a22=round(real(a22)*2^21)

e03=round(real(e03)*2^21)
e13=round(real(e13)*2^21)
a13=round(real(a13)*2^21)
a23=round(real(a23)*2^21)

e04=round(real(e04)*2^21)
e14=round(real(e14)*2^21)
a14=round(real(a14)*2^21)
a24=round(real(a24)*2^21)