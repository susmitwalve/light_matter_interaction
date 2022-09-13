function y=f14(rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34,g1,g2)
C=Constants_pulse;
y=-1i*(C.deltap-C.beta_l)*rho14-1i*C.beta_t*rho24+1i*conj(g1).*(1-2*rho11-rho22-rho33)-1i*conj(g2).*rho13-C.tau41*rho14;
end