%%
clc
clear
%% Warmup Problem - Replace the for loop by a while loop
for N = 1:500 

    if sum (1:N) > 1000
        break
    end

end
 
fprintf('The sum of integers from 1 through %i exceeds 1000\n', N)
% frist you should have result and n variable
result = 0;
n = 0;
% in while loop you would like to say if the result is less than 1000 it is
% okay to get in to the loop or if it is more than 1000 get out of the loop
while result < 1000
    % I would add one because the number will always increase all the time
    n = n+1;
    % add new n to the result number and will discuss in while loop condition
    % to check if it is okay to stop or continue the loop
    result = result + n;
end
% now print the n value to see what value I am getting 
fprintf('The sum of integers from 1 through %i exceeds 1000\n', n)

%% Application Problem
% load data - weights of cargo items in pounds

cargo_weights=load('cargo_data.txt');

%Set maximum capacity of the cargo plane
plane_capacity = 5000; 

%  Define the function load_plane in a separate file
%  Call your load_plane function here; pass the cargo weights and plane capacity as inputs
%  store the result in a variable of your choosing
%

final_cargo=load_plane(cargo_weights,plane_capacity);%COMPLETE THIS LINE
sum_cargo= sum(final_cargo);
unuse_cargo = plane_capacity-sum_cargo;
% Print results to the command window as specified in the instructions
fprintf('The following weights were loaded onto the plane : \n');
fprintf('[ ');
% I will print end to the -1 becasue ',' this should be not in last
% position
if length(final_cargo)~=1
    fprintf('%i , ',final_cargo(1:end-1));
    fprintf('%i ',final_cargo(end));
    % if length of the cargo has one option than print only that number
elseif length(final_cargo)==1
    fprintf('%i', final_cargo);
end
fprintf(']\n');
fprintf('The total weight loaded is %i pounds, and the unused capacity is %i pounds', sum_cargo,unuse_cargo);

% evaluate step
% I have made the code that adding from smallest number in the weight array
% if we look at the result biggest number of the in array is 829 pounds. in
% my cargo_data the next bigger number is 864 pound which makes there is no
% left pounds in plane cargo. When I add my number in calculater it still
% show me that sum of the array is 4197 unused is 803 pound. to sum up the
% answer is making sense

