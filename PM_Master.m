%% *MASTER TEST SCRIPT of "SoC_App.slx"* 
% *PURPOSE:* Standardizes, centralizes, coordinates and controls all elements 
% needed to rapidly, efficiently and iteratively develop and execute MiL testing.
% 
% *DESCRIPTION:* _This master script runs everything needed for Model-in-the-Loop 
% testing for an application.  It enables the Modeling Engineer and the MiL test engineer  
% to develop the test suite from nothing to something for the entire application model.  
% To do its job, it calls the following supporting scripts:
%% 
% # _select_APP_function_r##.mlx   (a master list of all the modeled functions 
% in the application, arranged in a switch case)_ 
% # _Validation_TestCase_builder_(enter application's model block name here)_r##.mlx_ 
%% 
% _The #2 supporting script above coordinates all the elements to build and 
% execute as many test cases as needed to fully test one function or all the functions 
% in an application.  It even allows in a single test case multiple iterations, 
% for example if a test procedure calls for testing the boundary conditions of 
% a single calibration parameter or 2D table.
% 
% Assumptions:  The MiL Test Engineer...
%% 
% * _approaches testing using the progression: unit test > mid-level integration 
% test > full app integration test
% develops each test from scratch or reuses and revises previously written 
% test procedures, whether written by him/her or another engineer
% may want to run a spectrum of tests from one to a subsystem to all tests_
%% 
% *SUPPORTED WORKFLOWS:* 
%% 
% # authoring and revising individual test procedures and the full suite of 
% test cases
% # running selective Verification and Validation tests of unit functions, mid-level 
% integration, full applications and regression testing
%% 
% *FRAMEWORK:*
% 
% _All scripts and models used here support the MathWorks "Test Harness" approach
% 
% 
% 
% 

% =========================================================================
% REV BLOCK
    % original template: SimMaster_Script_rev211223.m (path: \\tbd\)
% 
    % DDMMMYY - author initials - brief description (original source) 23DEC21 
    % 15JAN22 - AM - MiL Validation environment of EFI algorithms to be used in V400 ECU
    % 26MAY22 - AM - MiL Validation environment for VCM algorithms on eHOZ
    % 23Jun22 - AM - MiL Application development environment for Swappable SoC algorithm
    % 11Aug22 - AM - MiL Application and Testing development environment for Swappable SoC algorithm
    % 01Nov22 - AM - Dev Power Mapping model
    % 18Dec23 - AM - Added comments to improve readability

% =========================================================================
% ASSOCIATED SCRIPTS
    % The structure and naming of the scripts and files has been designed to be able to mentally keep track of and navigate the many files needed to dev & test a Simulink model.  
    % To that end, the following elements are used to self-ordering of scripts and file in the working folder to easily find them:

        % "app"     is an abbreviation of the model's name (e.g. socg2 is state-of-charge generation 2, PM is for Power Map, POp is for Paralleling Operation, etc.)
        % "fnc##'    is an abbreviation for "function's component number" (a human readable name describing the function component may be inserted after the number; f
                        % or example: "app_fnc10_2Dlkup_..." or "app_fnc35_modes_..."
        % "tc##"     is an abbreviation for "test case number"
        % "iter##"   is an abbreviation for "iteration number" within a test case.  Any  test case may employ many iterations to test boundary conditions, calibration min/max values, etc.
        % "r"       is for revision (note: version tracking eliminates the need for naming revisions of files, but since many files comprise this MBD dev & test environment, 

    % "app_Master_r##.m launches "app_TestPlanner.m" which is the test planning dashboard that sets up and controls the execution of test

    % "app_TestPlanner.m" launches "app_fnc#_tc_builder.m" where new test cases can be added to the overall suite of tests to verify and validate one application model block

    % "app_fnc#_tc_builder.m" launches "app_fnc#_tc#_iterator.m and "app_TestExecuter.m" loops thru and launches each individual script for each application's MiL test case:
    
    % "app_fnc#_tc#_iterator.m" launches "app_fnc#_tc#_iter#_cals.m" and "app_fnc#_tc#_iter#_signalbuilder.m" which loads the calset values being tested and builds the input signals        .
    %               
    % "app_TestExecutor.m" runs the simulation then launches "app_fnc#_tc#_iter#_visualizer.m" to plot the sim results and optionally saves outputs to xlsx file format
% =========================================================================
    %close all
    clearvars -except fig_pos_H fig_pos_H1 fig_pos_H2 % do not kill the previously used figure position

%% =========================================================================
% SIM & TEST ENVIRONMENT DASHBAORD
    % Specify function-under-test
        %---------------------------
        functional_component = 100;  % Look in header of TestPlanner.m for list of functional components in overall model and their assigned number
            % 10 = 2D lookup table
            % 11 = generic state tracker library block
            % 12 = Discharge Power Level tracker
            % 13 = State Transitioner
            % 14a = Full Discharge Power Map (revised ctr from down-down to down-up)
            % 15 = Full Charge Power Map (for evaluation purposes use
            % 16 = Absolute Power Map Diagnostic
            % 17 = Rate Limiter
            % 18 = XLoad_duration_1Dlookup
            % 19 = Xload_conditions
            % 21 = Excessive DISCHARGE amps Monitoring, Fault Indication & Metrics
            % 22 = Excessive REGEN amps Monitoring, Fault Indication & Metrics
            %100 = full integration test of whole model function
            %1000 = full regressinon test of CodeGen variant of model function
        functional_component_str = num2str(functional_component);
        % --------------------------
        file_TestPlanner = 'PM_TestPlanner.m'; 
        run(file_TestPlanner) % partitions the application into unit functions (assign "fnc" values) and integration functions); ref PM_TestPlanner.m
    
%% =========================================================================
% SCRIPT OUTLINE & ORGANIZATION
     % set the application's model or subsystem being simulated or validated
        




%
% ==============================================================================
% END of SCRIPT
% ==============================================================================