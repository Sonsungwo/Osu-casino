%%
clc
clear
%% warm up problem
b  = 2; %m
h = 4;  %m
area = b*h; %m^2
fprintf('The right-angled triangle has area = %.1f m^2 \n' , area);
%% application problem
h = 248; %m height
r = 77; %m rotor diameter
a = pi*((r/2)^2); %m^2 area, formula for getting area for rotor swept
p = 1.225; %kg/m^3 air density
v = 6.75; %m/s velocity
p_in = 0.5* p * a * (v^3); %kgm^2/s^3 , totla wind power the can flow through the blade
n_a = 0.397; % were percent and change it to percent, aerodynamic efficiency
n_m = 0.96; % were percent and change it to percent, mechanical efficiency
n_e = 0.94; % were percent and change it to percent, electrical efficiency 
c_p = n_a * n_m * n_e ; % total wind turvine system efficiency
c_p_threoretical = 0.25; 
p_out_observed = c_p * p_in;
p_out_threoreticalmaximum = p_in * c_p_threoretical; %the difference between p_out observed is that c_p value has given
percentDifference = ((p_out_threoreticalmaximum -p_out_observed)/p_out_observed)*100; % multiple 100 to get percent
fprintf('At a wind velocity of 12 m/s the results for the Haliade-X turbine are as follows: \n');
fprintf('The output power generated is %.2f w \n', p_out_observed);
fprintf('The theoretical maximum output power that can be generated according to Betz''s law is %.2f w\n', p_out_threoreticalmaximum);
fprintf('The percentage difference between the output power generated and the theoretical maximum output power is %.2f %% \n',percentDifference);
