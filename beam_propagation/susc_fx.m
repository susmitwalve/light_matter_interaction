function res=susc_fx(sigma,g)
C=Constants;
res=(C.N*sigma*(C.mu^2))./(4*pi*C.epsilon*C.hbar*g);
end