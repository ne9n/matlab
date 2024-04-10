% called from "SoC_fnc##_TestCase_builder.m"
                     
% TEST CASE Global Steps 1 and 2
% load TestHarness model & harness-related variables that do not change during one Test Case
    TestHarness = file_tc02_harness_model;
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
        % PURPOSE: Verify Discharge Power Map
        % -----------------------------------------------------
        % STEP 1: adjust TestHarness or its parameters as needed
        % STEP 2: load base calibrations for iteration #1
            %run(file_tc01_cals)
        % STEP 3:
            %run(file_tc01_iter01_signalbuilder)
            run('PM_fnc100_tc02_iter01_signal_builder.m')
            %load('testsignal_shunt_Xload1.mat')
        % STEP 4:
            
        % -----------------------------------------------------

    case 2 % Test case iteration 2
        % PURPOSE: Verify ...
        % -----------------------------------------------------
        % STEP 1: adjust TestHarness or its parameters as needed
        % STEP 2 % re-use same cals from iter01 and adjust specific parameters as needed, else load unique file
            %rate_ms = 0.1;
        % STEP 3
            % load the signal data and time stamp directly and combine into the workspace's input signal
            run('PM_fnc100_tc02_iter02_signal_builder.m')
        % STEP 4

        % -----------------------------------------------------

    case 3 % Test case iteration 3
        % PURPOSE: Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            run('PM_fnc100_tc02_iter03_signal_builder.m')
        % STEP 4

        % -----------------------------------------------------  

    case 4 % Test case iteration 4
        % PURPOSE: Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            run('PM_fnc100_tc02_iter04_signal_builder.m')
        % STEP 4

    case 5 % Test case iteration 5: 
        % PURPOSE: Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            run('PM_fnc100_tc02_iter05_signal_builder.m')
        % STEP 4

    case 6 % Test case iteration 6
        % PURPOSE:  Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            run('PM_fnc100_tc02_iter06_signal_builder.m')
        % STEP 4

     case 7 % Test case iteration 7
        % PURPOSE:  Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            run('PM_fnc100_tc02_iter07_signal_builder.m')
        % STEP 4

    case 8 % Test case iteration 8
        % PURPOSE:  Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            %run('PM_fnc100_tc02_iter08_signal_builder.m')
        % STEP 4

    case 9 % Test case iteration 9
        % PURPOSE:  Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            %run('PM_fnc100_tc02_iter09_signal_builder.m')
        % STEP 4

    case 10 % Test case iteration 6
        % PURPOSE:  Verify ...
        % -----------------------------------------------------
        % STEP 1
        % STEP 2 % adjust specific cals loaded in iter01, else load a different init_cal file)
        % STEP 3
            load('appdata_ztr_actual_scale.mat')
        % STEP 4

end
% --->>> END current iteration of current Test Case

