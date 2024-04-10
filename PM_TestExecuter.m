%% 
% PURPOSE: launches the simulation using the pre-loaded test case data, the test calibrations and the test signals, if any

%%
% called at beginning of Test_Planner.  Single use script for all test cases and their iterations

%% LAUNCH & CONTROL SIMULATION
    % 
        % -->>> Launch Simulink and open the model to be tested <<<--
        % uncomment this if-end statement for fnc100 and fnc1000)
            if tc_current == 1
                file_harness_model = file_tc01_harness_model;
                open_system(file_harness_model); 
            elseif tc_current == 2
                file_harness_model = file_tc02_harness_model;
                open_system(file_harness_model)
            elseif tc_current == 3
                file_harness_model = file_tc03_harness_model;
                open_system(file_harness_model)
            end

        % -->>> Programmatically configure this model's simulation parameters 
            % see full list of potential parameter names at "http://www.mathworks.com/help/simulink/slref/model-parameters.html"
            % all the values must be strings (e.g. 'string')
            set_param(file_harness_model,'StartTime',num2str(sim_StartTime),'StopTime',num2str(sim_StopTime)); % 'inf'); sets the duration of the simulation to run for sim_time seconds
            set_param(file_harness_model,'SolverType','Fixed-step','FixedStep',num2str(fixedsteprate_s));  %'SolverType','Variable-step');  
            set_param(file_harness_model,'Solver','FixedStepDiscrete') %'Solver','ode23t'
            %set_param(TestHarness_model,'MaxStep','1e-3','RelTol','1','AbsTol','1');
            set_param(file_harness_model,'ZeroCrossAlgorithm','Adaptive');
            % set_param(bdroot,'SignalLogging','on')

        % -->>> Execute and Save simulation results to a separate object
            SimResults = sim(file_harness_model); %,'FastRestart','on');
            % tout_mainloop = SimResults.tout(sim_StartTime:sim_StopTime-1);

%===================================================================================
% SECTION 4 - PLOT SIMRESULTS
switch functional_component
    case 00
    case 01
    case 07
        if tc_current == 1
            run(file_tc01_visualizer)
        elseif tc_current == 2
            run(file_tc01_visualizer)
        end
        
    case 08
        if tc_current == 1
            run(file_tc01_visualizer)
        elseif tc_current == 2
            run(file_tc01_visualizer)
        elseif tc_current == 3
            run(file_tc01_visualizer)
        end
       
    case 09
        if tc_current == 1
            run(file_tc01_visualizer)
        elseif tc_current == 2
            run(file_tc01_visualizer)
        end

    case 10
        if tc_current == 1
            run(file_tc01_visualizer)
        elseif tc_current == 2
            run(file_tc02_visualizer)
        end

    case 11
        

    case 12
        if tc_current == 1
            run(file_tc01_visualizer)
        elseif tc_current == 2
            run(file_tc01_visualizer)
        end

    case 17
        if tc_current == 1
            run(file_tc01_visualizer)
        elseif tc_current == 2
            run(rile_tc02_visualizer)
        end

    case 21
        if tc_current == 1
            run(file_tc01_visualizer)
        elseif tc_current == 2
            run(rile_tc02_visualizer)
        end

    case 22
        if tc_current == 1
            run(file_tc01_visualizer)
        elseif tc_current == 2
            run(rile_tc02_visualizer)
        end
    
    case 100
        if tc_current == 1
            if tc_iter_current == 1
                run(file_tc01_visualizer)
            elseif tc_iter_current == 2
                %run('PM_fnc100_tc01_iter02_visualizer.m')
            end

        elseif tc_current == 2
            run(file_tc02_visualizer)
        elseif tc_current == 3
            run(file_tc03_visualizer)
        elseif tc_current == 4
            %run(file_tc01_visualizer)
        end

    case 1000
        if tc_current == 1
            run(file_tc01_visualizer)
        end
end
        

% ==============================================================================
% SECTION 5 - SAVE DATA
%        filename = 'SoC_simResult_figure_all';
%        saveas(H,filename) 
        %filename = 'TestResults_TPS_FILTER_r01.xlsx'; % 3 sheets
        %writetable(simout_results_table,filename,'Sheet',2,'Range','C2')

% ==============================================================================
% SECTION 6 - CLEAR OUT WORKSPACE for next Test Case iteration
% clearvars cell_mV dCap_mAh shunt_mA...
%     sim_StartTime sim_StopTime...
%     simin_testdata_shunt_mA simin_testdata_cell_mV simin_testdata_dCap_mAh  simin_testdata_sysclock_ticks_msec...
%     test_dur_s time_s