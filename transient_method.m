clear;
C=Constants;
rho11=1/3;
rho12=0;
rho13=0;
rho14=0;
rho22=1/3;
rho23=0;
rho24=0;
rho33=1/3;
rho34=0;
t=0;
dt=3e-14;
rho_mat=[rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34];

i=0;
while t<3e-9
    i=i+1;
    rho_mat=rho_mat+rk4(rho_mat,dt,C.g1,C.g2);
    t=t+dt;
    t1(i)=t;
    yax1(i)=rho_mat(1);
%     hold on
%     plot(t,yax1(i),'*')
%     pause(0.002)
    yax2(i)=rho_mat(5);
    yax3(i)=rho_mat(8);
    yax14(i)=rho_mat(4);
%     disp(yax1(i))
    disp(t)
end
hold on
grid on
% plot(t1,yax1,':','LineWidth',1)
% plot(t1,yax2,'-.','LineWidth',1)
% plot(t1,yax3,'--','LineWidth',1)
plot(t1,yax14,'LineWidth',1)
% axis([0 5e4 0 1])


