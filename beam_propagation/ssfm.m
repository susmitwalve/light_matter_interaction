function res=ssfm(kx,ky,dz,k,susc_mat,g)
res=ifft2(fftshift(exp((-1i*dz*(kx.^2+ky.^2))/(2*k)).*fftshift(fft2(exp(2*pi*1i*k*susc_mat*dz).*g))));
% res=ifft2(fft2(exp(2*pi*1i*k*susc_mat*dz).*g));
% disp(isnan(exp(2*pi*1i*k*susc_mat*dz).*g))

end