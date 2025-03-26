function Para=Parameters()
global Para

%% Initial Speed and position in Earth-fixed frame

Para.ICPos = [0 0 2 0 0 0];
Para.ICSpeed = [0 0 0 0 0 0] ;

%% General parameters
Para.rho_water = 1000 ;                     % Masse volumique de l'eau (kg/m^3)
Para.R = 0.115 ;                             % Sparus Radius (m)
Para.L = 1.6;  	                            % Sparus length (m)
Para.m = 52 ; 	                            % Sparus mass (kg)
Para.mb = 52.1;                           	% Sparus buoyancy mass  (kg) 
Para.g = 9.81 ;                             % Earth Gravity (m*s^(-2))
Para.P = Para.m * Para.g;	                % Sparus weight (N)
Para.B = Para.mb * Para.g;	                % Buoyancy (N)

%% Center of gravity and Buoyancy position in body-fied frame

Para.xg = 0 ;    %x-positon of Center of gravity
Para.yg = 0 ;    %y-positon of Center of gravity
Para.zg = 0 ;    %z-positon of Center of gravity

Para.rg = [Para.xg Para.yg Para.zg]' ;


Para.xb = 0      ;    % x-positon of Center of Buoyancy
Para.yb = 0      ;    % y-positon of Center of Buoyancy
Para.zb = -0.02  ;    % z-positon of Center of Buoyancy

Para.rb = [Para.xb Para.yb Para.zb]' ;

%% Body positions

% Main Body S0;
Para.S0.r=[0,0,0]'; % Position (m)
% right thruster S1;
Para.S1.r=[-0.59,0.17,0]'; % Position (m)
% left thruster S2;
Para.S2.r=[-0.59,-0.17,0]'; % Position (m)
% antenna S3;
Para.S3.r=[-0.39,0,-0.24]'; % Position (m)

%% Sparus total Real Mass matrix at global CO

Para.Mb = [52,     0,     0,     0,  -0.1,     0;
            0,    52,     0,   0.1,     0,  -1.3;
            0,     0,    52,     0,   1.3,     0;
            0,   0.1,     0,   0.5,     0,     0;
            -0.1,     0,   1.3,     0,   9.4,     0;
            0,  -1.3,     0,     0,     0,   9.5];


%% Sparus total added Mass matrix at global CO (CG)

Para.Ma = [2.9889, 0,       0,       0,       0.1821,  0;
            0,       59.0911, 0,      -1.5338, 0,       3.9430;
            0,       0,       92.3511, 0,      -23.8864, 0;
            0,      -1.5338, 0,       1.1226,  0,      -0.2161;
            0.1821,  0,      -23.8864, 0,      21.6733,  0;
            0,       3.9430, 0,      -0.2161,  0,       9.7672];


%% Generalized mass matrix

Para.Mg = Para.Mb + Para.Ma;


%% Generalized coriolis matrix

% Computed in RovModel.m

%% Friction matrices

% Main Body S0
Para.S0.Kq = [2.0774,         0,         0,         0,         0,         0;
                    0,   55.20,         0,         0,         0,         0;
                    0,         0,   55.20,         0,         0,         0;
                    0,         0,         0,         0,         0,         0;
                    0,         0,         0,         0,    7.0656,         0;
                    0,         0,         0,         0,         0,    7.0656];


% right thruster S1
Para.S1.Kq = [0.5655,         0,         0,         0,         0,         0;
                   0,         0,         0,         0,         0,         0;
                   0,         0,   4.320,         0,         0,         0;
                   0,         0,         0,         0,         0,         0;
                   0,         0,         0,         0,    0,         0;
                   0,         0,         0,         0,         0,    0];


% left thruster S2
Para.S2.Kq = [0.5655,         0,         0,         0,         0,         0;
                   0,         0,         0,         0,         0,         0;
                   0,         0,   4.320,         0,         0,         0;
                   0,         0,         0,         0,         0,         0;
                   0,         0,         0,         0,    0,         0;
                   0,         0,         0,         0,         0,    0];



% antenna S3
Para.S3.Kq = [11.875,         0,         0,         0,         0,         0;
                   0,         19.00,         0,         0,         0,         0;
                   0,         0,         0,         0,         0,         0;
                   0,         0,         0,         0,         0,         0;
                   0,         0,         0,         0,    0,         0;
                   0,         0,         0,         0,         0,    0];



%% Thruster modelling

%Thruster positions in body-fixed frame

Para.d1x = 0        ; 
Para.d1y = 0        ;
Para.d1z = 0.08     ;
Para.d2x = -0.59    ; 
Para.d2y = 0.17     ;
Para.d2z = 0        ;
Para.d3x = -0.59    ;
Para.d3y = -0.17    ;
Para.d3z = 0        ;


Para.rt1 = [Para.d1x, Para.d1y, Para.d1z]' ;
Para.rt2 = [Para.d2x, Para.d2y, Para.d2z]' ;
Para.rt3 = [Para.d3x, Para.d3y, Para.d3z]' ;


Para.rt = [Para.rt1 Para.rt2 Para.rt3] ;

%Thruster gains

Para.kt1 = 28.5    ;
Para.kt2 = 30    ;
Para.kt3 = 30    ;


%Thruster gain vectors

Para.Kt=[Para.kt1;Para.kt2;Para.kt3];

%Thruster time constants

Para.Tau1 = 0.4 ;
Para.Tau2 = 0.8 ;
Para.Tau3 = 0.8 ;


%Thruster time constant vectors

Para.Tau = [Para.Tau1;Para.Tau2;Para.Tau3] ;

% Mapping of thruster

Para.Eb_F = [0, 1, 1;
             0, 0, 0;
             1, 0, 0];
    
Para.Eb_M = [0, 0,         0;
             0, 0,         0;
             0, -Para.d2y, -Para.d3y];

Para.Eb = [ Para.Eb_F ; Para.Eb_M ] ;

% Inverse Mapping of thruster
Para.Ebinv = pinv(Para.Eb) ;

end