function rho_mat=rk4(rho_mat,dt,g1,g2)
rho_mat0=rho_mat;
K_1(1)=dt*f11(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_1(2)=dt*f12(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_1(3)=dt*f13(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_1(4)=dt*f14(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_1(5)=dt*f22(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_1(6)=dt*f23(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_1(7)=dt*f24(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_1(8)=dt*f33(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_1(9)=dt*f34(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);

rho_mat=rho_mat0+K_1/2;

K_2(1)=dt*f11(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_2(2)=dt*f12(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_2(3)=dt*f13(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_2(4)=dt*f14(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_2(5)=dt*f22(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_2(6)=dt*f23(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_2(7)=dt*f24(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_2(8)=dt*f33(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_2(9)=dt*f34(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);

rho_mat=rho_mat0+K_2/2;

K_3(1)=dt*f11(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_3(2)=dt*f12(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_3(3)=dt*f13(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_3(4)=dt*f14(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_3(5)=dt*f22(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_3(6)=dt*f23(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_3(7)=dt*f24(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_3(8)=dt*f33(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_3(9)=dt*f34(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);

rho_mat=rho_mat0+K_3;

K_4(1)=dt*f11(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_4(2)=dt*f12(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_4(3)=dt*f13(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_4(4)=dt*f14(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_4(5)=dt*f22(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_4(6)=dt*f23(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_4(7)=dt*f24(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_4(8)=dt*f33(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);
K_4(9)=dt*f34(rho_mat(1),rho_mat(2),rho_mat(3),rho_mat(4),rho_mat(5),rho_mat(6),rho_mat(7),rho_mat(8),rho_mat(9),g1,g2);

rho_mat=K_1/6+K_2/3+K_3/3+K_4/6;
end