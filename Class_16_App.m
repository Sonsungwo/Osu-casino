%%
clc
clear
%% Warmup Problem
% Use an fprintf statement to display the warning message “Cleanroom conditions are abnormal” if:
% 1. The temperature is above 78F OR below 65F, OR
% 2. The door is open AND the door open timer reads 5 minutes or greater, OR
% 3. The 0.5 micron particle detector reads greater than 1000 particles per cubic foot of air
 
% I will get the input number each of the question
room_temperature = input('what is the temperature f?\n');
room_opendoor = input('how many time did you open the door?\n');
room_particle = input('what did the 0.5 micron particle detector read?\n');
% I made each if statement to tell the user what problem is matter
if room_temperature>78 || room_temperature<65
    fprintf('Cleanroom conditions are abnormal because of temperature \n');
end
if room_opendoor>5
    fprintf('Cleanroom conditions are abnormal because of time of door open\n');
end
if room_particle >1000
    fprintf('Cleanroom conditions are abnormal because of the number of particles\n');
end
   
       
%% Application Problem
%load the worker working hour
work_hour = load('hours.txt');
%in the load file I will sum all of the work hour to see how much time the
%worker did in one week
sumtime = sum(work_hour);
fprintf('%.0f',sumtime);
%get input pay amount to user
pay_hour = input('what is your pay per hour');
% use if statement to determin what is the sum of work time level is
if sumtime <= 40
    % I will only multiple number of pay amount and the sumtime because it
    % is not more than 40 hour.
    payment = sumtime*pay_hour;
    fprintf('your weekly pay will be %.0f dollar', payment);
elseif sumtime >40 && sumtime<=50
    % when the worker work more than 40 hour and less than 50 hour will be
    % calculate with 40 hour mutiple with pay amount and the hour that
    % worked more than 40 hour will be calculate 1.5 more. After you could
    % sum two number of payment
    payment = ((pay_hour*40) + (pay_hour*(sumtime-40)*1.5));
    fprintf('your weekly pay will be %.0f dollar', payment);
elseif sumtime > 50
    % if the work more than 50 hour it means that he will pay all of 40
    % hour payment and 10 hour with 1.5 more pay rate. and the hour the
    % worker worked more than 50 hour will be calculated by minus sumtime
    % 50 and multiple to 2 for payment. We could gather all of the number
    payment = (pay_hour*40)+(pay_hour*10*1.5)+(pay_hour*(sumtime-50)*2);
    fprintf('your weekly pay will be %.0f dollar', payment);
end