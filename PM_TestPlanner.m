%% 
% *PURPOSE*: (1st script called by "app_Master_r##.m) Selects the application's 
% model block that is to be MiL developed and tested. 
% 
% *DESCRIPTION:* 
% 
% *OUTPUT:* 
% 
% *APPLICATION:*    app_func## = the application abrev (e.g. SoC for State-of-Capacity or EFI for fuel injection)
% 
% 00 = run full application model (i.e. all the subsystems that comprise the 
% application, else use the numbers below to select individual subsystems)
%% TEST PLAN:
% functional component map
        % 00 = validate signal builder script (call rates, pack dimensions, C rates, RDRC cycle variation, charge levels at 1st-of-all-time power-up)
        % 01 = validate ?
        % 02 = process ?
        % 03 = process ?
        % 04 = process ?
        % 05 = 
        % 06 = 
        % 07 = 
        % 08 = 
        % 09 = 
        % 10 = Dev - Xloading Detection & Protection
        % 11 = Generic State Tracker (library block)
        % 12 = Discharge State Tracker subsystem
        % 13 = State_transitioner
        % 17 = fixed-point rate limiter
        % 18 = Prod - Xamps 1Dlookup
        % 20 = Prod - Xdchg amps limit 1Dlookup
        % 21 = Prod - Excessive Discharge Detection, Diagnostics & Metrics
        % 22 = Prod - Excessive Regen Monitoring, Diagnostics & Metrics
        % 23 = Prod = Recommended Amps limit 2Dlookup
        % 100 = run full application model regression testing (i.e. all the subsystems that comprise the full model integration testing (includes stress testing))
        % 1000 = CodeGen version
%% ==========================================================================

% Specify related script names and their controls
        file_TestExecuter = 'PM_TestExecuter.m';

        switch functional_component
            case 10
                % Set TEST CASE builder controls
                % List the test cases that exercise the function
                    file_TestCase_builder = 'PM_fnc10_tc_builder.m';
                        tc01 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc02 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc03 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc04 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc05 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc06 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc07 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc08 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc09 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc10 = uint8(0); % set = 1 to enable this test case, else = 0
                        test_case_array = [tc01 tc02 tc03]; % tc02 tc03 tc04]; % tc05 tc06 tc07]; % add test cases by typing new designator 
                        num_tc = width(test_case_array);
                        test_case_iteration_array = [1 7 2]; % 4];% 0 0 0 0];  % specify number of iterations in each set of test cases

                        % if you want to run a specific test case or iteration, then set:
                            num_tc_start = 1; % default is 1 starts at tc 1, else set to the specific test case number to run specific test case (e.g. 1)
                            num_tc_end = num_tc; % default is 1 starts at iteration #1, else set to specific iteration number to run specific iteration (e.g. 3)

                % Set TEST CASE iterator controls
                    for i = num_tc_start:num_tc_end
                        if i == 1 % Associated Scripts for Test Case 1
                            num_iter = test_case_iteration_array(1,i);
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc01_iterator = 'PM_fnc10_tc01_iterator.m';
                            file_harness_model = 'PowerLevel_Determination'; %'PM_func10_TestHarness';
                            file_tc01_cals = 'PM_fnc10_tc01_iter01_init_cals.m';
                            file_tc01_iter01_signalbuilder = 'PM_fnc10_tc01_iter01_signal_builder.m';
                            file_tc01_iter02_signalbuilder = 'PM_fnc10_tc01_iter01_signal_builder.m';
                            file_tc01_visualizer = 'PM_fnc10_tc01_visualizer.m';
                        end
                        if i == 2 % Associated Scripts for Test Case 2
                            num_iter_start = 1;
                            num_iter_end = num_tc_iter;
                            file_tc02_iterator = 'PM_fnc10_tc02_iterator.m';
                            file_harness_model = 'PM_fnc10_TestHarness';
                            file_tc02_cals = 'PM_fnc10_tc02_init_cals.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc10_tc02_iter01.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc10_tc02_iter01.m';
                            file_tc02_visualizer = 'PM_func10_tc01_visualizer.m';
                        end
                        if i == 3 % Associated Scripts for Test Case 3
                        end
                        if i == 4 % Associated Scripts for Test Case 4
                        end
                        if i == 5 % Associated Scripts for Test Case 5
                        end
                    end
        
            case 11  % Generic State Tracker (library block)
                % Set TEST CASE builder controls
                % List the test cases that exercise the function
                    file_TestCase_builder = 'PM_fnc11_tc_builder.m';
                        tc01 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc02 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc03 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc04 = uint8(0); % set = 1 to enable this test case, else = 0
                        test_case_array = [tc01]; % tc02 tc03 tc04]; % tc05 tc06 tc07]; % add test cases by typing new designator 
                        num_tc = width(test_case_array);
                        test_case_iteration_array = [1 2 3 4];% 0 0 0 0];  % specify number of iterations in each set of test cases

                        % if you want to run a specific test case or iteration, then set:
                            num_tc_start = 1; % default is 1 starts at tc 1, else set to the specific test case number to run specific test case (e.g. 1)
                            num_tc_end = num_tc; % default is 1 starts at iteration #1, else set to specific iteration number to run specific iteration (e.g. 3)

                % Set TEST CASE iterator controls
                    for i = num_tc_start:num_tc_end
                        if i == 1 % Associated Scripts for Test Case 1
                            num_iter = test_case_iteration_array(1,i);
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc01_iterator = 'PM_fnc11_tc01_iterator.m';
                            file_harness_model = 'PM_fnc11_TestHarness'; %'State_Tracker_r02'; %
                            file_tc01_cals = 'PM_init_cals.m';
                            file_tc01_iter01_signalbuilder = 'PM_fnc11_tc01_iter01_signal_builder.m';
                            file_tc01_iter02_signalbuilder = 'PM_fnc11_tc01_iter02_signal_builder.m';
                            file_tc01_visualizer = 'PM_fnc11_tc01_visualizer.m';
                        end
                        if i == 2 % Associated Scripts for Test Case 2
                            num_iter_start = 1;
                            num_iter_end = num_tc_iter;
                            file_tc02_iterator = 'PM_fnc11_tc02_iterator.m';
                            file_harness_model = 'PM_fnc11_TestHarness';
                            file_tc02_cals = 'PM_init_cals.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc11_tc02_iter01.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc11_tc02_iter01.m';
                            file_tc02_visualizer = 'PM_fnc11_tc01_visualizer.m';
                        end
                        if i == 3 % Associated Scripts for Test Case 3
                        end
                        if i == 4 % Associated Scripts for Test Case 4
                        end
                        if i == 5 % Associated Scripts for Test Case 5
                        end
                    end
                    run(file_TestCase_builder)

        case 12 % Discharge State Tracker subsystem
            % Set TEST CASE builder controls
                % List the test cases that exercise the function
                    file_TestCase_builder = 'PM_fnc12_tc_builder.m';
                        tc01 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc02 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc03 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc04 = uint8(0); % set = 1 to enable this test case, else = 0
                        test_case_array = [tc01]; % tc02 tc03 tc04]; % tc05 tc06 tc07]; % add test cases by typing new designator 
                        num_tc = width(test_case_array);
                        test_case_iteration_array = [1 2 3 4];% 0 0 0 0];  % specify number of iterations in each set of test cases

                        % if you want to run a specific test case or iteration, then set:
                            num_tc_start = 1; % default is 1 starts at tc 1, else set to the specific test case number to run specific test case (e.g. 1)
                            num_tc_end = num_tc; % default is 1 starts at iteration #1, else set to specific iteration number to run specific iteration (e.g. 3)

                % Set TEST CASE iterator controls
                    for i = num_tc_start:num_tc_end
                        if i == 1 % Associated Scripts for Test Case 1
                            num_iter = test_case_iteration_array(1,i);
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc01_iterator = 'PM_fnc12_tc01_iterator.m';
                            file_harness_model = 'PM_fnc12_TestHarness';
                            file_tc01_cals = 'PM_init_cals.m';
                            file_tc01_iter01_signalbuilder = 'PM_fnc12_tc01_iter01_signal_builder.m';
                            file_tc01_iter02_signalbuilder = 'PM_fnc12_tc01_iter02_signal_builder.m';
                            file_tc01_visualizer = 'PM_fnc12_tc01_visualizer.m';
                        end
                        if i == 2 % Associated Scripts for Test Case 2
                            num_iter_start = 1;
                            num_iter_end = num_tc_iter;
                            file_tc02_iterator = 'PM_fnc12_tc02_iterator.m';
                            file_harness_model = 'PM_fnc12_TestHarness';
                            file_tc02_cals = 'PM_init_cals.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc12_tc02_iter01.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc12_tc02_iter01.m';
                            file_tc02_visualizer = 'PM_fnc12_tc01_visualizer.m';
                        end
                        if i == 3 % Associated Scripts for Test Case 3
                        end
                        if i == 4 % Associated Scripts for Test Case 4
                        end
                        if i == 5 % Associated Scripts for Test Case 5
                        end
                    end

                    run(file_TestCase_builder)

        case 13 % State Transitioner
            % Set TEST CASE builder controls
                % List the test cases that exercise the function
                    file_TestCase_builder = 'PM_fnc12_tc_builder.m';
                        tc01 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc02 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc03 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc04 = uint8(0); % set = 1 to enable this test case, else = 0
                        test_case_array = [tc01]; % tc02 tc03 tc04]; % tc05 tc06 tc07]; % add test cases by typing new designator 
                        num_tc = width(test_case_array);
                        test_case_iteration_array = [1 2 3 4];% 0 0 0 0];  % specify number of iterations in each set of test cases

                        % if you want to run a specific test case or iteration, then set:
                            num_tc_start = 1; % default is 1 starts at tc 1, else set to the specific test case number to run specific test case (e.g. 1)
                            num_tc_end = num_tc; % default is 1 starts at iteration #1, else set to specific iteration number to run specific iteration (e.g. 3)

                % Set TEST CASE iterator controls
                    for i = num_tc_start:num_tc_end
                        if i == 1 % Associated Scripts for Test Case 1
                            num_iter = test_case_iteration_array(1,i);
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc01_iterator = 'PM_fnc12_tc01_iterator.m';
                            file_harness_model = 'PM_fnc12_TestHarness';
                            file_tc01_cals = 'PM_init_cals.m';
                            file_tc01_iter01_signalbuilder = 'PM_fnc12_tc01_iter01_signal_builder.m';
                            file_tc01_iter02_signalbuilder = 'PM_fnc12_tc01_iter02_signal_builder.m';
                            file_tc01_visualizer = 'PM_fnc12_tc01_visualizer.m';
                        end
                        if i == 2 % Associated Scripts for Test Case 2
                            num_iter_start = 1;
                            num_iter_end = num_tc_iter;
                            file_tc02_iterator = 'PM_fnc12_tc02_iterator.m';
                            file_harness_model = 'PM_fnc12_TestHarness';
                            file_tc02_cals = 'PM_init_cals.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc12_tc02_iter01.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc12_tc02_iter01.m';
                            file_tc02_visualizer = 'PM_fnc12_tc01_visualizer.m';
                        end
                        if i == 3 % Associated Scripts for Test Case 3
                        end
                        if i == 4 % Associated Scripts for Test Case 4
                        end
                        if i == 5 % Associated Scripts for Test Case 5
                        end
                    end

                    run(file_TestCase_builder)
   
        case 14 % reserved for another subsystem test
            % Set TEST CASE builder controls
                % List the test cases that exercise the function
                    file_TestCase_builder = 'PM_fnc14_tc_builder.m';
                        tc01 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc02 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc03 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc04 = uint8(0); % set = 1 to enable this test case, else = 0
                        test_case_array = [tc01]; % tc02 tc03 tc04]; % tc05 tc06 tc07]; % add test cases by typing new designator 
                        num_tc = width(test_case_array);
                        test_case_iteration_array = [1 2 3 4];% 0 0 0 0];  % specify number of iterations in each set of test cases

                        % if you want to run a specific test case or iteration, then set:
                            num_tc_start = 1; % default is 1 starts at tc 1, else set to the specific test case number to run specific test case (e.g. 1)
                            num_tc_end = num_tc; % default is 1 starts at iteration #1, else set to specific iteration number to run specific iteration (e.g. 3)

                % Set TEST CASE iterator controls
                    for i = num_tc_start:num_tc_end
                        if i == 1 % Associated Scripts for Test Case 1
                            num_iter = test_case_iteration_array(1,i);
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc01_iterator = 'PM_fnc14_tc01_iterator.m';
                            file_harness_model = 'PM_fnc14a_DevHarness'; %'PM_fnc100_TestHarness';
                            file_tc01_cals = 'PM_init_cals.m';
                            file_tc01_iter01_signalbuilder = 'PM_fnc14_tc01_iter01_signal_builder.m';
                            file_tc01_iter02_signalbuilder = 'PM_fnc14_tc01_iter02_signal_builder.m';
                            file_tc01_visualizer = 'PM_fnc14_tc01_visualizer.m';
                        end
                        if i == 2 % Associated Scripts for Test Case 2
                            num_iter_start = 1;
                            num_iter_end = num_tc_iter;
                            file_tc02_iterator = 'PM_fnc14_tc02_iterator.m';
                            file_harness_model = 'PM_fnc14_TestHarness';
                            file_tc02_cals = 'PM_init_cals.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc14_tc02_iter01.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc14_tc02_iter01.m';
                            file_tc02_visualizer = 'PM_fnc14_tc02_visualizer.m';
                        end
                        if i == 3 % Associated Scripts for Test Case 3
                        end
                        if i == 4 % Associated Scripts for Test Case 4
                        end
                        if i == 5 % Associated Scripts for Test Case 5
                        end
                    end

                    run(file_TestCase_builder)                   

        case 17 % Rate Limiter
            % Set TEST CASE builder controls
                % Create list the test cases that exercise the function
                    file_TestCase_builder = 'PM_fnc17_tc_builder.m';
                        tc01 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc02 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc03 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc04 = uint8(0); % set = 1 to enable this test case, else = 0
                        test_case_array = [tc01]; % tc02 tc03 tc04]; % tc05 tc06 tc07]; % add test cases by typing new designator 
                        num_tc = width(test_case_array);
                        test_case_iteration_array = [1 2 3 4];% 0 0 0 0];  % specify number of iterations in each set of test cases

                        % if you want to run a specific test case or iteration, then set:
                            num_tc_start = 1; % default is 1 starts at tc 1, else set to the specific test case number to run specific test case (e.g. 1)
                            num_tc_end = num_tc; % default is 1 starts at iteration #1, else set to specific iteration number to run specific iteration (e.g. 3)

                % Set TEST CASE iterator controls
                    for i = num_tc_start:num_tc_end
                        if i == 1 % Associated Scripts for Test Case 1
                            num_iter = test_case_iteration_array(1,i);
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc01_iterator = 'PM_fnc17_tc01_iterator.m';
                            file_tc01_harness_model = 'PM_fnc17_ratelimiter_TestHarness';
                            file_tc01_cals = 'PM_fnc17_tc01_iter01_init_cals.m';
                            file_tc01_iter01_signalbuilder = 'PM_fnc17_tc01_iter01_signal_builder.m';
                            file_tc01_visualizer = 'PM_fnc17_tc01_visualizer.m';
                        end
                        if i == 2 % Associated Scripts for Test Case 2
                            num_iter_start = 1;
                            num_iter_end = num_tc_iter;
                            file_tc02_iterator = 'PM_fnc17_tc02_iterator.m';
                            file_harness_model = 'PM_fnc17_TestHarness';
                            file_tc02_cals = 'PM_fnc17_tc01_iter01_init_cals.m';
                            file_tc02_iter01_signalbuilder = 'PM_dev_fnc17_tc02_iter01_signal_builder.m';
                            file_tc02_visualizer = 'PM_fnc17_tc02_visualizer.m';
                        end
                        if i == 3 % Associated Scripts for Test Case 3
                        end
                        if i == 4 % Associated Scripts for Test Case 4
                        end
                        if i == 5 % Associated Scripts for Test Case 5
                        end
                    end

                    run(file_TestCase_builder)

        case 21 % reserved for Excessive DISCHARGE Amps functional testing
            % Set TEST CASE builder controls
                % List the test cases that exercise the function
                    file_TestCase_builder = 'PM_fnc21_tc_builder.m';
                        tc01 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc02 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc03 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc04 = uint8(0); % set = 1 to enable this test case, else = 0
                        test_case_array = [tc01];% tc02 tc03]; % tc03 tc04]; % tc05 tc06 tc07]; % add test cases by typing new designator 
                        num_tc = width(test_case_array);
                        test_case_iteration_array = [1 0 0]; % 4]; % 0 0 0 0];  % specify number of iterations in each set of test cases

                        % if you want to run a specific test case or iteration, then set:
                            num_tc_start = 1; % default is 1 starts at tc 1, else set to the specific test case number to run specific test case (e.g. 1)
                            num_tc_end = num_tc; % default is 1 starts at iteration #1, else set to specific iteration number to run specific iteration (e.g. 3)

                % Set TEST CASE iterator controls
                    % FOR loop to set the "dashboard controls" for all the test cases with their respective number of iterations
                    for i = num_tc_start:num_tc_end
                        if i == 1 % Associated Scripts for Test Case 1
                            num_iter = test_case_iteration_array(1,i); % row 1 (test case 1); column 1 (first element)
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc01_iterator = 'PM_fnc21_tc01_iterator.m';
                            file_tc01_harness_model = 'PM_fnc21_Xdchg_Detection_TestHarness'; % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            file_tc01_cals = 'PM_fnc21_tc01_iter01_init_cals.m';  %'PM_init_cals.m';
                            file_tc01_iter01_signalbuilder = 'PM_fnc21_tc01_iter01_testsignal_builder.m';
                            %file_tc01_iter02_signalbuilder = 'PM_fnc100_tc01_iter02_signal_builder.m';
                            file_tc01_visualizer = 'PM_fnc21_tc01_iter01_visualizer.m';
                        end
                        if i == 2 % Associated Scripts for Test Case 2
                            num_iter = test_case_iteration_array(1,i); % row 1 (test case 1); column 2 (second element)
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc02_iterator = 'PM_fnc100_tc02_iterator.m';
                            file_tc02_harness_model = 'PM_02g_100ms_TestHarness';   % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            file_tc02_cals = 'PM_fnc100_tc01_iter01_init_cals.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc100_tc02_iter01_signal_builder.m';
                            file_tc02_visualizer = 'PM_fnc100_tc02_iter01_visualizer.m';
                        end
                        if i == 3 % Associated Scripts for Test Case 3
                            num_iter = test_case_iteration_array(1,i); % row 1 (test case 1); column 2 (second element)
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc03_iterator = 'PM_fnc100_tc03_iterator.m';
                            file_tc03_harness_model = 'PM_02g_20ms_TestHarness';   % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            file_tc03_cals = 'PM_fnc100_tc01_iter01_init_cals.m';
                            file_tc03_iter01_signalbuilder = 'PM_fnc100_tc03_iter01_signal_builder.m';
                            file_tc03_visualizer = 'PM_fnc100_tc03_iter01_visualizer.m';
                        end
                        if i == 4 % Associated Scripts for Test Case 4
                        end
                        if i == 5 % Associated Scripts for Test Case 5
                        end
                    end
                    run(file_TestCase_builder)

        case 22 % reserved for Excessive REGEN Amps functional testing
            % Set TEST CASE builder controls
                % List the test cases that exercise the function
                    file_TestCase_builder = 'PM_fnc22_tc_builder.m';
                        tc01 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc02 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc03 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc04 = uint8(0); % set = 1 to enable this test case, else = 0
                        test_case_array = [tc01];% tc02 tc03]; % tc03 tc04]; % tc05 tc06 tc07]; % add test cases by typing new designator 
                        num_tc = width(test_case_array);
                        test_case_iteration_array = [1 0 0]; % 4]; % 0 0 0 0];  % specify number of iterations in each set of test cases

                        % if you want to run a specific test case or iteration, then set:
                            num_tc_start = 1; % default is 1 starts at tc 1, else set to the specific test case number to run specific test case (e.g. 1)
                            num_tc_end = num_tc; % default is 1 starts at iteration #1, else set to specific iteration number to run specific iteration (e.g. 3)

                % Set TEST CASE iterator controls
                    % FOR loop to set the "dashboard controls" for all the test cases with their respective number of iterations
                    for i = num_tc_start:num_tc_end
                        if i == 1 % Associated Scripts for Test Case 1
                            num_iter = test_case_iteration_array(1,i); % row 1 (test case 1); column 1 (first element)
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc01_iterator = 'PM_fnc22_tc01_iterator.m';
                            file_tc01_harness_model = 'PM_fnc22_Xregen_Detection_TestHarness1'; % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            file_tc01_cals = 'PM_fnc22_tc01_iter01_init_cals.m';  %'PM_init_cals.m';
                            file_tc01_iter01_signalbuilder = 'PM_fnc22_tc01_iter02_testsignal_builder.m';
                            %file_tc01_iter02_signalbuilder = 'PM_fnc100_tc01_iter02_signal_builder.m';
                            file_tc01_visualizer = 'PM_fnc22_tc01_iter01_visualizer.m';
                        end
                        if i == 2 % Associated Scripts for Test Case 2
                            num_iter = test_case_iteration_array(1,i); % row 1 (test case 1); column 2 (second element)
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc02_iterator = 'PM_fnc100_tc02_iterator.m';
                            file_tc02_harness_model = 'PM_02g_100ms_TestHarness';   % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            file_tc02_cals = 'PM_fnc100_tc01_iter01_init_cals.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc100_tc02_iter01_signal_builder.m';
                            file_tc02_visualizer = 'PM_fnc100_tc02_iter01_visualizer.m';
                        end
                        if i == 3 % Associated Scripts for Test Case 3
                            num_iter = test_case_iteration_array(1,i); % row 1 (test case 1); column 2 (second element)
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc03_iterator = 'PM_fnc100_tc03_iterator.m';
                            file_tc03_harness_model = 'PM_02g_20ms_TestHarness';   % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            file_tc03_cals = 'PM_fnc100_tc01_iter01_init_cals.m';
                            file_tc03_iter01_signalbuilder = 'PM_fnc100_tc03_iter01_signal_builder.m';
                            file_tc03_visualizer = 'PM_fnc100_tc03_iter01_visualizer.m';
                        end
                        if i == 4 % Associated Scripts for Test Case 4
                        end
                        if i == 5 % Associated Scripts for Test Case 5
                        end
                    end
                    run(file_TestCase_builder)

        case 100 % reserved for full integration test cases
            % Set TEST CASE builder controls
                % List the test cases that exercise the function

                    % ======================
                    str_at = "(at ";
                    str_soc1 = "53";
                    str_soc2 = "% soc and ";
                    str_cellT1 = "50";
                    str_cellT2 = " degC)";
                    str_TestConditions = str_at + str_soc1 + str_soc2 + str_cellT1 + str_cellT2;
                    % ======================

                    file_TestCase_builder = 'PM_fnc100_tc_builder.m';
                        tc01 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc02 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc03 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc04 = uint8(0); % set = 1 to enable this test case, else = 0
                        test_case_array = [tc01]; % tc02 tc03]; % tc03 tc04]; % tc05 tc06 tc07]; % add test cases by typing new designator 
                        num_tc = width(test_case_array);
                        test_case_iteration_array = [1]; %7 2]; % 4]; % 0 0 0 0];  % specify number of iterations in each set of test cases

                        % if you want to run a specific test case or iteration, then set:
                            num_tc_start = 1; % default is 1 starts at tc 1, else set to the specific test case number to run specific test case (e.g. 1)
                            num_tc_end = num_tc; % default is 1 starts at iteration #1, else set to specPM_Testific iteration number to run specific iteration (e.g. 3)

                % Set TEST CASE iterator controls
                    % FOR loop to set the "dashboard controls" for all the test cases with their respective number of iterations
                    for i = num_tc_start:num_tc_end
                        if i == 1 % Associated Scripts for Test Case 1
                            num_iter = test_case_iteration_array(1,i); % row 1 (test case 1); column 1 (first element)
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc01_iterator = 'PM_fnc100_tc01_iterator.m';
                            file_tc01_harness_model = 'PM_02h4_TestHarness'; % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            file_tc01_cals = 'PM_fnc100_tc01_iter01_init_cals.m';  %'PM_init_cals.m';
                            file_tc01_iter01_signalbuilder = 'PM_fnc100_tc01_iter01b_testsignal_builder.m';
                            %file_tc01_iter02_signalbuilder = 'PM_fnc100_tc01_iter02_signal_builder.m';
                            file_tc01_visualizer = 'PM_fnc100_tc01_visualizer.m';
                        end
                        if i == 2 % Associated Scripts for Test Case 2
                            num_iter = test_case_iteration_array(1,i); % row 1 (test case 1); column 2 (second element)
                            num_iter_start = 7;
                            num_iter_end = 7;%num_iter;
                            file_tc02_iterator = 'PM_fnc100_tc02_iterator.m';
                            file_tc02_harness_model = 'PM_02h4_TestHarness';   % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            file_tc02_cals = 'PM_fnc100_tc01_iter01_init_cals.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc100_tc02_iter01_signal_builder.m';
                            file_tc02_visualizer = 'PM_fnc100_tc02_visualizer.m';
                        end
                        if i == 3 % Associated Scripts for Test Case 3
                            num_iter = test_case_iteration_array(1,i); % row 1 (test case 1); column 2 (second element)
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc03_iterator = 'PM_fnc100_tc03_iterator.m';
                            file_tc03_harness_model = 'PM_02h4_TestHarness';   % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            file_tc03_cals = 'PM_fnc100_tc01_iter01_init_cals.m';
                            file_tc03_iter01_signalbuilder = 'PM_fnc100_tc03_iter01_signal_builder.m';
                            file_tc03_visualizer = 'PM_fnc100_tc03_visualizer.m';
                        end
                        if i == 4 % Associated Scripts for Test Case 4
                        end
                        if i == 5 % Associated Scripts for Test Case 5
                        end
                    end
                    run(file_TestCase_builder)
                    

     case 1000
             % Set TEST CASE builder controls
                % List the test cases that exercise the function
                    file_TestCase_builder = 'PM_fnc100_tc_builder.m';
                        tc01 = uint8(1); % set = 1 to enable this test case, else = 0
                        tc02 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc03 = uint8(0); % set = 1 to enable this test case, else = 0
                        tc04 = uint8(0); % set = 1 to enable this test case, else = 0
                        test_case_array = [tc01]; % tc02 tc03 tc04]; % tc05 tc06 tc07]; % add test cases by typing new designator 
                        num_tc = width(test_case_array);
                        test_case_iteration_array = [1]; % 2 3 4];% 0 0 0 0];  % specify number of iterations in each set of test cases

                        % if you want to run a specific test case or iteration, then set:
                            num_tc_start = 1; % default is 1 starts at tc 1, else set to the specific test case number to run specific test case (e.g. 1)
                            num_tc_end = num_tc; % default is 1 starts at iteration #1, else set to specific iteration number to run specific iteration (e.g. 3)

                % Set TEST CASE iterator controls
                    for i = num_tc_start:num_tc_end
                        if i == 1 % Associated Scripts for Test Case 1
                            num_iter = test_case_iteration_array(1,i);
                            num_iter_start = 1;
                            num_iter_end = num_iter;
                            file_tc01_iterator = 'PM_fnc100_tc01_iterator.m';
                            file_tc01_harness_model = 'PM_fnc1000_TestHarness'; % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            %file_harness_model = 'PM_TestHarness';
                            file_tc01_cals = 'PM_fnc1000_tc01_iter01_init_cals.m'; 
                            file_tc01_iter01_signalbuilder = 'PM_fnc100_tc01_iter02_signal_builder.m';
                            %file_tc01_iter02_signalbuilder = 'PM_fnc100_tc01_iter02_signal_builder.m';
                            file_tc01_visualizer = 'PM_fnc100_tc01_visualizer.m';
                        end
                        if i == 2 % Associated Scripts for Test Case 2
                            num_iter_start = 1;
                            num_iter_end = num_tc_iter;
                            file_tc02_iterator = 'PM_fnc100_tc02_iterator.m';
                            file_harness_model = 'PM_fnc1000_TestHarness';   % <<<<<<<<<<<<<<<<<<<<<<================== da model in a test harness
                            file_tc02_cals = 'PM_init_cals.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc100_tc02_iter01.m';
                            file_tc02_iter01_signalbuilder = 'PM_fnc100_tc02_iter01.m';
                            file_tc02_visualizer = 'PM_fnc100_tc01_visualizer.m';
                        end
                        if i == 3 % Associated Scripts for Test Case 3
                        end
                        if i == 4 % Associated Scripts for Test Case 4
                        end
                        if i == 5 % Associated Scripts for Test Case 5
                        end
                    end

                    run(file_TestCase_builder)

        end

%%