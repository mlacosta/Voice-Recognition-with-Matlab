function Coef = MFCC(mel,c);
[m n] = size(mel);
Coef=zeros(m,n);
for i=1:m
   Coef(i,:)=TransformDCT(mel(i,:),2) ;
end
Coef=Coef(:,1:c);

end