% Performs find n-th fibonacci number and binary search.
% It was created on October 17, 2021.

% Written by Orhan Ozan Yildiz.

% Clear memory and screen.
clear, clc, close all;

%% Press 3 to exit.
repeat_main = true;
while repeat_main
    % User menu screen.
    disp('Please choose one:')
    disp('Press 1 Fibonacci,')
    disp('Press 2 Binary search, or')
    disp('Press 3 Exit.')
    chosen_input = check_option_input();
    
    % If user choose 0,the button becomes 0 so algorithm stops.
    if chosen_input == '3'
        disp("Program terminated ")
        repeat_main = false;
        
        % If user choose 1,the fibonacci algorithm is working.
    elseif chosen_input == '1'
        try
            % The user enters the number they want to be found and this value is disped on the screen.
            
            nth = check_float('What order of fibonacci number do you want: ');
            fprintf('%dth fibonacci number is %d.', nth, Fibonacci(nth + 1))
            disp(' ')
            disp('*********')
            
            % If you enter invalid character,it gives alert.
        catch
            disp("You entered the undefined character.")
            disp('Please, enter a valid number.')
        end
        % If user choose 2,the binary search algorithm is working.
    elseif chosen_input == '2'
        try
            % Showing options for the user to choose.
            disp('Please choose which action you want to perform: ')
            disp('press 1, enter random, ')
            disp('press 2, enter manually, or ')
            disp('press 3, the program will terminated. ')
            
            option = check_option_input();
            
            % If user choose 1,the binary search algorithm work with random array.
            if option == '1'
                
                size_array = input('How many numbers should the array consist of: ');
                imax = input('What is the largest value: ');
                
                % Generating a random array based on user inputs.
                numberList = randi(imax,1,size_array);
                numberList = sort(numberList);
                % Print sorted list.
                fprintf('Sorted List: ')
                disp(numberList)
                
                % Determine key for binary search.
                key = check_float("Enter the key : "); 
                
                binary_search(numberList, key)
                
                % If user choose 2,the binary search algorithm work with by the numbers we choose.
            elseif option == '2'
                % Create empty list.
                user_array = input('Please enter numbers using commas i.e [3,4,22,1,3]: ');
                user_array = sort(user_array);
                % Print sorted list.
                fprintf('Sorted List: ')
                disp(user_array)
                
                % Determine key for binary search.
                key_number = check_float("Enter the key: ");
                
                % Call BinarySearch() function.
                binary_search(user_array, key_number)
                
            end
            % If you enter invalid character,it gives alert.
        catch
            disp('You entered the undefined character.')
            disp('Please, enter a valid number.')
            disp(' ')
        end
        % If user choose except of 0,1 or 2,the algorithm is NOT working and it gives alert.
    else
        disp("Please select 1(Fibonacci), 2(BinarySearch) or 3(Exit). ")
    end
end

%% Finds the Fibonacci number in the specified order. 
function result = Fibonacci(order)
result = 0;
% The fibonacci sequence begins from the first term so it can't be 0.
if (order <= 0)
    disp("Please enter a valid number.")
    % The first fibonacci term is 0.
elseif order == 1
    result = 0;
    % The second fibonacci term is 1.
elseif order == 2
    result = 1;
else
    % The Fibonacci sequence is a series of numbers where a number is the addition of
    % the last two numbers.
    result = Fibonacci(order - 1) + Fibonacci(order - 2);
end
end


%% Binary_Search(A, n) is
% L := 0
% mid := (L + H) / 2
% T := A[mid]
% R := n − 1
% while L ≤ R do
%     m := floor((L + R) / 2)
%     if A[m] < T then
%         L := m + 1
%     else if A[m] > T then
%         R := m − 1
%     else:
%         return m
% return unsuccessful
function binary_search(numberList, key)
% Length of array.
array_length = length(numberList);
% Found or not control.
is_found = false;
low = 1;
high = array_length;
iteration_count = 0;
index = 0;

% Mid value equal to half of length of array.
% Round toward to negative infinity with using floor.
mid = floor(length(numberList)/2);

% Repeat until the number is found.
while ~is_found
    iteration_count = iteration_count + 1;
    % If mid value equal to key, found becomes true,so it prints 'Found'.
    if numberList(mid) == key
        is_found = true;
        index = mid;
        % If high value minus low value equal to 1, code breaks.
    elseif high-low == 1
        break
    elseif numberList(mid) < key
        low = mid;
        mid = ceil((high+low)/2);
    elseif numberList(mid) > key
        high = mid;
        mid = floor((high+low)/2);
    end
end
% If found equal to true, print 'Found'.
if is_found == true
    fprintf('Found on the %dth search. \n', iteration_count);
    fprintf('Index Number: %d. \n', index);
    
    % Otherwise we print 'Not Found'.
else
    fprintf("Not Found.\n");
end
end

%% Makes sure that the value entered by the user is 1 2 or 3. 
function reader = check_option_input()
while true
    reader = input('', 's');
    if (reader == '1' || reader == '2' || reader == '3')
        break
    else
        disp("The entered value is not valid. Please select 1, 2 or 3 values.")
    end
end
end

%% It is checked whether the value entered by the user is a number.
% If it is not a number, it is asked to enter a numeric value again.
function doubleInput = check_float(text)
disp(text)
while true
    reader = input('', 's');
    try
        doubleInput = str2double(reader);
        if (isnan(doubleInput))
            throw(MException('Matlab:InvalidDoubleNumber','Error invalid input.'))
        end
        break
    catch
        disp('Please enter a number.')
    end
end
end