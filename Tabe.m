function [output] =  Tabe(input_image, cutoff_frequency)
[M,N]= size(input_image);
dx=1;
dy=1;
KX0=(mod(1/2+(0:(N-1))/N,1)-1/2);
KX1=sort(pi*KX0/dx);
KY0=(mod(1/2+(0:(M-1))/M,1)-1/2);
KY1=sort(pi*KY0/dy);
[KX,KY]= meshgrid(KX1,KY1);
filter=(KX.^2 +KY.^2) < cutoff_frequency^2;
FT_image=fftshift(fft2(input_image));
FT_filter=filter.*FT_image;
filtered_image=ifft2(ifftshift(FT_filter),'symmetric');
output=filtered_image;
end
