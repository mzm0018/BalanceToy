syms dt;
syms p_00 p_01 p_10 p_11;
P_t_1_t_1=[p_00, p_01; p_10, p_11];
F=[1,dt;0,1];

syms varTHETA_t covTHETAGYRO_t varGYRO_t;
Q=[varTHETA_t,covTHETAGYRO_t;covTHETAGYRO_t,varGYRO_t];
P_t_t_1=F*P_t_1_t_1*F.'+Q;

syms varTHETA_m covTHETAGYRO_m varGYRO_m;
R=[varTHETA_m,covTHETAGYRO_m;covTHETAGYRO_m,varGYRO_m];
K=P_t_t_1/(P_t_t_1+R);

syms THETA_best_0 GYRO_best_0;
x_0=[THETA_best_0; GYRO_best_0];

syms THETA_m GYRO_m;
z_t=[THETA_m;GYRO_m];
x_t_t=x_t_t_1+K*(z_t-x_t_t_1);

Q_angle=0.001;
Q_gyro=0.005;
dt=0.005;
c_0=1;
theta_noise_variance=0.01;
R_angle=0.5;
