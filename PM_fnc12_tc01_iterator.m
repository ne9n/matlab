% called from "SoC_function##_TestCase_builder.m"
                     
% TEST CASE Global Steps 1 and 2
% load TestHarness model & harness-related variables that do not change during one Test Case
    TestHarness = file_harness_model;
        % Test Harness parameters
            fxpscaler1 = 1000000;  % shift Pack Capacity variable by 1e3 to convert units from mAh to µAh for delta µAh subtraction operationscaler2 = 1000;  % shift Pack Capacity variable by 1e4 to convert units from mAh to 100nAh for delta nAh subtraction operation

% load full calibration set then adjust cal value in specific iteration
   

% Use the steps below in each iteration to adjust a Test Harness parameter, a calibration parameter, a signal or load a whole new Test Harness, calset or set of input signals
    % STEP 1) load new TestHarness & harness-related variables 
    % STEP 2) adjust calibration values associated with the test case iteration
    % STEP 3) load/configure test case's input signals and test-case-iteration-related artifacts
    % STEP 4) set up any additional chart strings for visualizer

%% REFERENCE Calibration Settings Notes.xlsx for impact of pack settings, input signal settings and calibration settings
%%

switch tc_iter_current
     case 1 % Test case iteration 1
        % PURPOSE: Verify ...
        % -----------------------------------------------------
        % STEP 1: adjust TestHarness or its parameters as needed
        % STEP 2: load base calibrations for iteration #1
            run(file_tc01_cals)
        % STEP 3:
            run(file_tc01_iter01_signalbuilder)
        % STEP 4:
            
        % -----------------------------------------------------

    case 2 % Test case iteration 2
        % PURPOSE: Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % re-use same cals from iter01 and adjust specific parameters as needed
        % STEP 3
            run(file_tc01_iter02_signalbuilder)
        % STEP 4

        % -----------------------------------------------------

    case 3 % Test case iteration 3
        % PURPOSE: Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            run(file_tc01_iter03_signalbuilder)
        % STEP 4

        % -----------------------------------------------------  

    case 4 % Test case iteration 4
        % PURPOSE: Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            run(file_tc01_iter04_signalbuilder)
        % STEP 4

    case 5 % Test case iteration 5: 
        % PURPOSE: Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            run(file_tc01_iter05_signalbuilder)
        % STEP 4

    case 6 % Test case iteration 6
        % PURPOSE:  Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            run(file_tc01_iter06_signalbuilder)
        % STEP 4

end
% --->>> END current iteration of current Test Case

