function [weights_loaded] = load_plane(weights, capacity)
% I will have the function so that I am able to call in class 20
% application

% I would change weights array in to A to make it easy
A = weights;
% make result in array variable and sum in variable
result = [];
sum = 0;

i = 1;
% I made the boolean that if the condition change to false make it out of
% the loop
yes = true;
while yes
    % I will get the lowest number of the weight in the array
    M = min(A);
    % place in the sum variable
    sum = sum+M;
    % z will show us in what array index has the number of the min value
    % for weight. 
    z = find(A==M);
    % I will get the length of the z value to check if there is more than
    % one value which is same
    lenth=length(z);
    % if the lenth is bigger than 1 it means there is same number in the
    % array 
    if lenth >1
        % I will get the frist number of array to earse the numver in array
        % if I dont do this It will erase the all the corresponding numver
        % in array
        numone=z(1);
        A(numone)=[];
        
    else
        % if it only has one number make it blank in the array
        A(A == M) = [];
    end
    % I will put the min number in to result array i will decide where to
    % put
    result(i) = M;
    % get the capacity minus sum and see how much weight is left in cargo
    left = capacity-sum;
    % now see get the new min weight
    M_weight = min(A);
        % if the min number is bigger than left than stop the while loop or
        % if is smaller than left than keep the loop
        if left<M_weight
            yes=false;
        end
    % make i plus 1 every time loop
    i=i+1;
end
% the final result would be the weights_loaded
weights_loaded = result;