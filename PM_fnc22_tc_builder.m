%% *PURPOSE:* 
% Enables MiL Test *Engineer to build and develop from nothing-to-something 
% a list of* test cases for a _single_ application function.

%% *DESCRIPTION:*  
% This script ties together all the elements needed to run all, a combination 
% or a single test cases to verify or validate one application function.

%% 
% *CREATE LIST OF TEST CASES*
% 
% _Each test case is assigned a variable name "tc##", where ## is a two-digit 
% number (e.g. 01, 02, ...21, 22, ...).  Add new test cases using the next-in-line 
% variable name "tc##" (increment the number, then go to the EXECUTE SELECTED 
% TEST CASES section and add-in whatever is needed to set up and run the set of 
% test cases._
% 
% _The MiL test engineer has to set the tc## values to 1 (in lines 1 thru ##) 
% to run a test case or to 0 (zero) to skip the test case.  (These must be scalars 
% for the switch case statements below.  Used uint8 datatype.)_

%% 
% *EVALUATE TESTING REQUEST*
% 
% _The test_case_array is used by the TestMaster script to select precise test 
% cases to run.  The code below builds this array from the section above.  Add 
% every test case to the array to tally the correct number of test cases.  Then, 
% edit the number of iterations per test case (test_case_iterations) must align 
% with the exact test case in test .  For example, if tc01 has 3 iteration, tc02 
% has 4 iteration, tc03 has 1 iteration, tc04 has 8 iterations and tc05 has 11 
% iterations, then the f_

% moved up to Test_Planner.m
% test_case_array = [tc01 tc02 tc03 tc04]; % tc02 tc03 tc04];
% num_tc = width(test_case_array);
% 
% test_case_iteration_array = [2 5 6 1]; % 0 0 0 0];

%% 
% *CONSTRUCT SELECTED TEST CASES:*
% 
% _The code below uses nested switch cases to auto-organize all the test cases 
% and their iterations associated with a single function and execute them.  The 
% "SoC_select_func_r01.mlx" script calls this script._  
% 
% _This script runs an outer for-loop to execute all test cases to verify and 
% validate the function-under-test and runs an inner for-loop to execute all the 
% iterations of each test case._
% 
% _The inner for-loop uses a switch case to keep all the and each of the test 
% case iterations organized and efficiently executed.  The switch case calls an 
% explicit script that sets up the TC##  iteration to be run:_
%% 
% * _the input signal fed into the simulation (with the sim Start and Stop times)_
% * _the calibration values for current iteration_
% * _the Test_Harness model.slx_
%% 
% _and then at the end of the inner for-loop, this script calls "app_TestExecuter_r##.mlx" 
% which launches the test simulation._
% 
% _This structure enables the MiL Test Engineer to easily add new test cases 
% and new iterations to a Verification and Validation Test Suite of an EFI function.  
% The test engineer has the option to reuse input signals, calibration settings 
% and the test harness fir each test case itration or to load completely unique 
% signals, calibrations and even test harnesses._ 

for tc_current = num_tc_start:num_tc_end  % edit the start and stop values to run one or any combination of test cases sequentially 
    % declare test case strings for plotting
        tc_num_str =  num2str(tc_current);

    % check if the current test case is to be run
        enable_tc = test_case_array(tc_current); % run test case if tc_run = 1

    % load the number of iterations for the current test case up to be executed
        num_tc_iter = test_case_iteration_array(tc_current);

    % run test case if tc_run = 1, else skip
        if tc_current == 1  && enable_tc == 1
            for tc_iter_current = num_iter_start:num_iter_end
                % declare iteration strings for plotting
                    tc_iter_num_str = num2str(tc_iter_current);
                    tc_str = 'Test Case: ';
                run(file_tc01_iterator)
                run(file_TestExecuter)  % defined in Test Planner (beginning) but called to be executed here             
            end  

        elseif tc_current == 2 && enable_tc == 1
            for tc_iter_current = num_iter_start:num_tc_iter
                % declare iteration strings for plotting
                    tc_iter_num_str = num2str(tc_iter_current);
                    tc_str = 'Test Case: ';
                run(file_tc02_iterator)
                run(file_TestExecuter)               
            end

        elseif tc_current == 3 && enable_tc == 1
            for tc_iter_current = num_iter_start:num_tc_iter
                % declare iteration strings for plotting
                    tc_iter_num_str = num2str(tc_iter_current);
                    tc_str = 'Test Case: ';
                run(file_tc03_iterator)
                run(file_TestExecuter)               
            end
            
        elseif tc_current == 4 && enable_tc == 1
            for tc_iter_current = tc_specific:num_tc_iter
                % declare iteration strings for plotting
                    tc_iter_num_str = num2str(tc_iter_current);
                    tc_str = 'Test Case: ';
                run(file_tc04_iterator)
                run(file_TestExecuter)               
            end
    
        end % END current Test Case FOR
end % >>>>>> END current Test Case FOR LOOP