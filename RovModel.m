function [AccG] = RovModel(Thrust,PosE,VitB)

global Para




%% Attitudes in earth frame
% z=PosE(3,1);
phi     = PosE(4,1)	;
theta   = PosE(5,1)	;

%% Gravity Force

Fg = 1* [-Para.P * sin(theta) ;
        Para.P * cos(theta)*sin(phi) ;
        Para.P * cos(theta)*cos(phi) ;
        0 ;
        0 ;
        0 ];
    
% Expressed in b and computed in G
    
%% Force d'Archimède

Fa_F = [Para.B * sin(theta) ;
        -Para.B * cos(theta)*sin(phi) ;
        -Para.B * cos(theta)*cos(phi) ;
        ];
%  Expressed in b


Fa_M = S_(Para.rb-Para.rg) * Fa_F ; % Computed in G

Fa = [ Fa_F ; Fa_M ] ;
%  Expressed in b and computed in G

%% Force de Coriolis

% 
p = VitB(4,1)   ;   %Body fixed velocity roll (rad*s^(-1))
q = VitB(5,1)   ;   %Body fixed velocity pitch (rad*s^(-1))
r = VitB(6,1)   ;   %Body fixed velocity yaw (rad*s^(-1))
W_ = [p;q;r]     ;  %General vector

Wb = [  S_(W_),       zeros(3,3) ;
    zeros(3,3),      S_(W_) ];

C_all = Wb * Para.Mg ;

%coriolis Force :
Fc = C_all * VitB;

%% Friction forces at Sparus Global CO

%main body S0
V_buoyancy_main_body = [eye(3) (S_(Para.S0.r))'; zeros(3,3) eye(3)] * VitB;
Ff_buoyancy_main_body =  -Para.S0.Kq * abs(V_buoyancy_main_body).*V_buoyancy_main_body;
Ff_main_body_CO =  transpose([eye(3) (S_(Para.S0.r))'; zeros(3,3) eye(3)])* Ff_buoyancy_main_body;

%right thruster S1
V_buoyancy_right_thruster = [eye(3) (S_(Para.S1.r))'; zeros(3,3) eye(3)] * VitB;
Ff_buoyancy_right_thruster =  -Para.S1.Kq * abs(V_buoyancy_right_thruster).*V_buoyancy_right_thruster;
Ff_right_thruster_CO =  transpose([eye(3) (S_(Para.S1.r))'; zeros(3,3) eye(3)])* Ff_buoyancy_right_thruster;

%left thruster S2
V_buoyancy_left_thruster = [eye(3) (S_(Para.S2.r))'; zeros(3,3) eye(3)] * VitB;
Ff_buoyancy_left_thruster =  -Para.S2.Kq * abs(V_buoyancy_left_thruster).*V_buoyancy_left_thruster;
Ff_left_thruster_CO =  transpose([eye(3) (S_(Para.S2.r))'; zeros(3,3) eye(3)])* Ff_buoyancy_left_thruster;

%left thruster S3
V_buoyancy_antenna = [eye(3) (S_(Para.S3.r))'; zeros(3,3) eye(3)] * VitB;
Ff_buoyancy_antenna =  -Para.S3.Kq * abs(V_buoyancy_antenna).*V_buoyancy_antenna;
Ff_antenna_CO =  transpose([eye(3) (S_(Para.S3.r))'; zeros(3,3) eye(3)])* Ff_buoyancy_antenna;

%total friction force
%Ff_total = Ff_main_body_CO + Ff_right_thruster_CO + Ff_left_thruster_CO + Ff_antenna_CO   ;
Ff_total = Ff_main_body_CO+ + Ff_right_thruster_CO + Ff_left_thruster_CO  +Ff_antenna_CO ;

%% Propulsions Forces
Fp = Para.Eb * Thrust ;

%% Accelearion computation :
AccG = Para.Mg\ (Ff_total+ Fa + Fg+ Fp-Fc) ; % Mg\ = Mg^-1 computed at the gravity center of the Sparus