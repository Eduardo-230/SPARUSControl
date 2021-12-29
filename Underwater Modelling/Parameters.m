function Para=Parameters()

global Para
Matrices = load('Matrices.mat');

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

% S0: Main Hull.
% S1: Sensor1.
% S2: Sensor2.
% S3: Antenna.
% S4: Thruster1.
% S5: Thruster2.
% S6: BottomSphere. (BodyMass only)
% S7: TopSphere. (BodyMass only)

% Main Body S0;
Para.S0.r=[0,0,0]'; % Position (m)
% First Body S1;
Para.S1.r=[0,0,0]'; % Position (m)
% Second Body S2;
Para.S2.r=[0,0,0]'; % Position (m)

%% Body Mass matrices

% Main Body S0; Cylinder
Para.S0.Mb = Matrices.BodyMassMatrix.cylinder ; 

% First Body S1; 
Para.S1.Mb = Matrices.BodyMassMatrix.sensor1 ; 

% Second Body S2;
Para.S2.Mb = Matrices.BodyMassMatrix.sensor2 ; 

% Third Body S3;
Para.S3.Mb = Matrices.BodyMassMatrix.antenna ; 

% Fourth Body S4;
Para.S4.Mb = Matrices.BodyMassMatrix.thruster1 ; 

% Fifth Body S5;  
Para.S5.Mb = Matrices.BodyMassMatrix.thruster2 ; 

% Sixth Body S6;  
Para.S6.Mb = Matrices.BodyMassMatrix.botsph ; 

% Seventh Body S7;  
Para.S7.Mb = Matrices.BodyMassMatrix.topsph ; 

%% Body added Mass matrices

% Main Body S0;
Para.S0.Ma = Matrices.AddedMassMatrix.cylinder ; 

% First Body S1;
Para.S1.Ma = Matrices.AddedMassMatrix.sensor1 ; 

% Second Body S2;
Para.S2.Ma = Matrices.AddedMassMatrix.sensor2 ; 

% Third Body S3;
Para.S3.Ma = Matrices.AddedMassMatrix.antenna ; 

% Fourth Body S4;
Para.S4.Ma = Matrices.AddedMassMatrix.thruster1 ; 

% Fifth Body S5;
Para.S5.Ma = Matrices.AddedMassMatrix.thruster2 ; 

%% Generalized mass matrix

Para.S0.Mg = Para.S0.Mb + Para.S0.Ma ; 
Para.S1.Mg = Para.S1.Mb + Para.S1.Ma ;
Para.S2.Mg = Para.S2.Mb + Para.S2.Ma ;
Para.S3.Mg = Para.S2.Mb + Para.S2.Ma ;
Para.S4.Mg = Para.S2.Mb + Para.S2.Ma ;
Para.S5.Mg = Para.S2.Mb + Para.S2.Ma ;


Para.Mg = Para.S0.Mg + Para.S1.Mg + Para.S2.Mg + Para.S3.Mg + Para.S4.Mg + Para.S5.Mg + Para.S6.Mb + Para.S7.Mb ;


%% Generalized coriolis matrix

% Computed in RovModel.m

%% Friction matrices

% Main Body S0;
Para.S0.Kq = -Matrices.DragMatrix.cylinder ;    %Quadratic friction matrix

% First Body S1;
Para.S1.Kq = -Matrices.DragMatrix.sensor1 ;    %Quadratic friction matrix

% Second Body S2;
Para.S2.Kq = -Matrices.DragMatrix.sensor2 ;    %Quadratic friction matrix

% Third Body S3;
Para.S3.Kq = -Matrices.DragMatrix.antenna ;    %Quadratic friction matrix

% Fourth Body S4;
Para.S4.Kq = -Matrices.DragMatrix.thruster1 ;    %Quadratic friction matrix

% Fifth Body S5;
Para.S5.Kq = -Matrices.DragMatrix.thruster2 ;    %Quadratic friction matrix


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

Para.Eb_F = [0 1 1; 0 0 0; 1 0 0];
    
Para.Eb_M = [0 0 0; 0 0 0; 0 -0.17 0.17];

Para.Eb = [ Para.Eb_F ; Para.Eb_M ] ;

% Inverse Mapping of thruster
Para.Ebinv = pinv(Para.Eb) ;

end





 
           

