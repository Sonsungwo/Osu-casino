%Class 18 App

clc
clear

%% Warm-up Problem
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The following line defines N - the number of primes to allocate. Do not
%edit 
N=randi(5)+10;
fprintf('The number of primes to save is %d\n\n',N);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I will have the length of the firstprime number of array
FirstPrimes =(0);
% use for loop for number of random number of N
for i=1:N
    %for each i I will put the prime number
    FirstPrimes(i) = nthprime(i);
end
%print first prime 
fprintf('The number of prime number is ');
fprintf('%.0f   ', FirstPrimes);
%Allocate the first N primes below. You must use a for loop. 
%Reminder: Use the built in function nthprime(N) to calculate the prime
%% App problem 

%Load stress and strain data here:
stress = load('stress.txt');
strain = load('strain.txt');
%Plot stress-strain plot here. Use best graphing practices
plot(strain,stress)
% name each graph 
xlabel ('"strain"');
ylabel ('"stress (pa)"');
% title of grpah
title ('"Young''s Modulus"');
% legend name
legend('stress vs strain');

%Determine max stress and corresponding strain here
hight = 0;
index = 0;
% use for loop about the length of the stress array number
for i = 1:length(stress)
    % compare to each stress and go in the if when it is higher than
    % previous height
    if hight<stress(i)
        % this will get the hightest point of the stress
        hight = stress(i);
        % save the number of the number of i to know when is the point
        index = i;
    end
end
fprintf('hightest point of stress is %.2f (pa) \n',hight);
fprintf('hightest point of strain is %.6f\n',strain(index));

% use for loop to check every array
for i = 1:length(stress)    
    %when strain is the bigger of same as 0.0025 than go in to if statement
    if strain(i)>=0.0025
        % when strain is at that point tell what stress point is
        fprintf('the stress point is %.2f (pa) when estimated yield strain is 0.0025\n',stress(i))
        %Calculate Young's modulus here
        yield_strain=0.0025; %Strain is unitless
        youngs = stress(i)/yield_strain;
        % young's modlue =  76610.55 (pa) /0.0025 
        % young's modlue = 30,644,220 psi
        %the young's modlue makes sense becasue it has to be aruond
        %30,200,000 psi
        fprintf('the young''s modulus is %.0f (psi)\n',youngs)
        % I will break the code becasue I dont need it anymore of it
        break;
    end
end