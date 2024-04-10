rate_ms = 10;

rate_s = rate_ms/1000;
fixedsteprate_s = rate_s;

test_dur = 12*60; % units = minutes 60 sec/min
test_samples = test_dur/rate_s;
test_signal = zeros(test_samples,1);
time = zeros(test_samples,1);
time = linspace(0,test_dur,test_samples);
time = transpose(time);

rate_ms = 10;  % units ms
%% EXERCISE DISCHARGE POWER MAP
% Pulse #1  
    Dpulse1_start = 1;
    %==================================
    Discharge_pulse1_duration_ms = 7000; % exceed continuous threshold for 7 seconds to start 10sec and 50sec surge timer
    Rest_pulse1_duration_ms = 15000; % drop below continous threshold for 15 seconds to fully recover allowed 10 sec duration
    %==================================
        Dpulse1 = Discharge_pulse1_duration_ms/rate_ms;  % uints = number of execution loops
        Drest1 = Rest_pulse1_duration_ms/rate_ms;  % uints = number of execution loops
        D1_start = Dpulse1_start;
        D1_stop = Dpulse1_start + Dpulse1;
        R1_start = D1_stop + 1;
        R1_stop = R1_start + Drest1;
        
        test_signal(D1_start:D1_stop,1) = -110;  
        test_signal(R1_start:R1_stop,1) = -20;  
    
% Pulse #2
    Dpulse2_start = R1_stop + 1;
    %==================================
    Discharge_pulse2_duration_ms = 12000; % exceed cont thresh for 15 seconds to violate 10s Surge Limit
    Rest_pulse2_duration_ms = 22000; % drop bellow continuous threshold for 25 seconds to fully recover from a 10 sec surge violation
    %==================================
        Dpulse2 = Discharge_pulse2_duration_ms/rate_ms;  % uints = number of execution loops
        Drest2 = Rest_pulse2_duration_ms/rate_ms;  % uints = number of execution loops
        D2_start = Dpulse2_start;
        D2_stop = Dpulse2_start + Dpulse2;
        R2_start = D2_stop + 1;
        R2_stop = R2_start + Drest2;
        
        test_signal(D2_start:D2_stop,1) = -110; 
        test_signal(R2_start:R2_stop,1) = -20; 

% Pulse #3: Test 50sec Surge Discharge limit and timer
    Dpulse3_start = R2_stop + 1;
    %==================================
    Discharge_pulse3_duration_ms = 60000; % exceed cont threshold for 60 seconds to force a 50sec Surge violation
    Rest_pulse3_duration_ms = 120000; % drop below continous threshold for 120 seconds to fully recover from a 50 sec surge violation
    %==================================
        Dpulse3 = Discharge_pulse3_duration_ms/rate_ms;  % uints = number of execution loops
        Drest3 = Rest_pulse3_duration_ms/rate_ms;  % uints = number of execution loops
        D3_start = Dpulse3_start;
        D3_stop = Dpulse3_start + Dpulse3;
        R3_start = D3_stop + 1;
        R3_stop = R3_start + Drest3;
        
        test_signal(D3_start:D3_stop,1) = -110; 
        test_signal(R3_start:R3_stop,1) = -20; 

%% EXERCISE REGEN POWER MAP        
    % Pulse #4: Test 10sec Surge Regen limit and timer and exercise 50sec Surge timer
        Cpulse4_start = R3_stop + 1;
        %==================================
        Charge_pulse4_duration_ms = 7000; % exceed continuous threshold for 7 seconds to start 10sec and 50sec surge timer
        Rest_pulse4_duration_ms = 15000; % drop below continous threshold for 15 seconds to fully recover allowed 10 sec duration
        %==================================
            Cpulse4 = Charge_pulse4_duration_ms/rate_ms;  % uints = number of execution loops
            Crest4 = Rest_pulse4_duration_ms/rate_ms;  % uints = number of execution loops
            C4_start = Cpulse4_start;
            C4_stop = Cpulse4_start + Cpulse4;
            R4_start = C4_stop + 1;
            R4_stop = R4_start + Crest4;
            
            test_signal(C4_start:C4_stop,1) = 30; 
            test_signal(R4_start:R4_stop,1) = 5;
    
    % Pulse #5
        Cpulse5_start = R4_stop + 1;
        %==================================
        Charge_pulse5_duration_ms = 12000; % exceed cont thresh for 15 seconds to violate 10s Surge Limit
        Rest_pulse5_duration_ms = 22000; % drop bellow continuous threshold for 25 seconds to fully recover from a 10 sec surge violation
        %==================================
            Cpulse5 = Charge_pulse5_duration_ms/rate_ms;  % uints = number of execution loops
            Crest5 = Rest_pulse5_duration_ms/rate_ms;  % uints = number of execution loops
            C5_start = Cpulse5_start;
            C5_stop = Cpulse5_start + Cpulse5;
            R5_start = C5_stop + 1;
            R5_stop = R5_start + Crest5;
            
            test_signal(C5_start:C5_stop,1) = 30; 
            test_signal(R5_start:R5_stop,1) = 5; 
    
    % Pulse #6: Test 10sec Surge Regen limit and timer and exercise 50sec Surge timer
        Cpulse6_start = R5_stop + 1;
        %==================================
        Charge_pulse6_duration_ms = 60000; % exceed cont threshold for 60 seconds to force a 50sec Surge violation
        Rest_pulse6_duration_ms = 120000; % drop below continous threshold for 120 seconds to fully recover from a 50 sec surge violation
        %==================================
            Cpulse6 = Charge_pulse6_duration_ms/rate_ms;  % uints = number of execution loops
            Crest6 = Rest_pulse6_duration_ms/rate_ms;  % uints = number of execution loops
            C6_start = Cpulse6_start;
            C6_stop = Cpulse6_start + Cpulse6;
            R6_start = C6_stop + 1;
            R6_stop = R6_start + Crest6;
            
            test_signal(C6_start:C6_stop,1) = 30; 
            test_signal(R6_start:R6_stop,1) = 5;

%% EXERCISE EXCESSIVE LOADING DETECTION, REPORTING & PROTECTION
    % Pulse #7: Test 0 sec Xload threshold event, count, timer
        Xpulse7_start = R6_stop + 1;
        %==================================
        Xload_pulse7_duration_ms = 950; % exceed Xload threshold for < 1 seconds to start 0 sec event counter and timer
        Rest_pulse7_duration_ms = 5000; % drop below Xload threshold
        %==================================
            Xpulse7 = uint16(Xload_pulse7_duration_ms/rate_ms);  % uints = number of execution loops
            Xrest7 = uint16(Rest_pulse7_duration_ms/rate_ms);  % uints = number of execution loops
            X7_start = Xpulse7_start;
            X7_stop = Xpulse7_start + Xpulse7;
            R7_start = X7_stop + 1;
            R7_stop = X7_start + Xrest7;
            
            test_signal(X7_start:X7_stop,1) = -181; 
            test_signal(R7_start:R7_stop,1) = -20;

    % Pulse #8: Test > 1sec Xload threshold event, count, timer
        Xpulse8_start = R7_stop + 1;
        %==================================
        Xload_pulse8_duration_ms = 2900; % exceed Xload threshold for 1 sec < dur < 3 sec start 0 sec and 1 sec event counters and timer
        Rest_pulse8_duration_ms = 5000; % drop below Xload threshold
        %==================================
            Xpulse8 = uint16(Xload_pulse8_duration_ms/rate_ms);  % uints = number of execution loops
            Xrest8 = uint16(Rest_pulse8_duration_ms/rate_ms);  % uints = number of execution loops
            X8_start = Xpulse8_start;
            X8_stop = Xpulse8_start + Xpulse8;
            R8_start = X8_stop + 1;
            R8_stop = R8_start + Xrest8;
            
            test_signal(X8_start:X8_stop,1) = -181; 
            test_signal(R8_start:R8_stop,1) = -20;

    % Pulse #9: Test > 1sec Xload threshold event, count, timer
        Xpulse9_start = R8_stop + 1;
        %==================================
        Xload_pulse9_duration_ms = 490; % exceed Xload threshold for 1 sec < dur < 3 sec start 0 sec and 1 sec event counters and timer
        Rest_pulse9_duration_ms = 5000; % drop below Xload threshold
        %==================================
            Xpulse9 = uint16(Xload_pulse9_duration_ms/rate_ms);  % uints = number of execution loops
            Xrest9 = uint16(Rest_pulse9_duration_ms/rate_ms);  % uints = number of execution loops
            X9_start = Xpulse9_start;
            X9_stop = Xpulse9_start + Xpulse9;
            R9_start = X9_stop + 1;
            R9_stop = R9_start + Xrest9;
            
            test_signal(X9_start:X9_stop,1) = -500; 
            test_signal(R9_start:R9_stop,1) = -20;

    % Pulse #10: Test > 1sec Xload threshold event, count, timer
        Xpulse10_start = R9_stop + 1;
        %==================================
        Xload_pulse10_duration_ms = 70; % exceed Xload threshold for 1 sec < dur < 3 sec start 0 sec and 1 sec event counters and timer
        Rest_pulse10_duration_ms = 5000; % drop below Xload threshold
        %==================================
            Xpulse10 = uint16(Xload_pulse10_duration_ms/rate_ms);  % uints = number of execution loops
            Xrest10 = uint16(Rest_pulse10_duration_ms/rate_ms);  % uints = number of execution loops
            X10_start = Xpulse10_start;
            X10_stop = Xpulse10_start + Xpulse10;
            R10_start = X10_stop + 1;
            R10_stop = R10_start + Xrest10;
            
            test_signal(X10_start:X10_stop,1) = -1100; 
            test_signal(R10_start:R10_stop,1) = -20;

    % Pulse #11: Test > 1sec Xload threshold event, count, timer
        Xpulse11_start = R10_stop + 1;
        %==================================
        Xload_pulse11_duration_ms = 20; % exceed Xload threshold for 1 sec < dur < 3 sec start 0 sec and 1 sec event counters and timer
        Rest_pulse11_duration_ms = 5000; % drop below Xload threshold
        %==================================
            Xpulse11 = uint16(Xload_pulse11_duration_ms/rate_ms);  % uints = number of execution loops
            Xrest11 = uint16(Rest_pulse11_duration_ms/rate_ms);  % uints = number of execution loops
            X11_start = Xpulse11_start;
            X11_stop = Xpulse11_start + Xpulse11;
            R11_start = X11_stop + 1;
            R11_stop = R11_start + Xrest11;
            
            test_signal(X11_start:X11_stop,1) = -1500; 
            test_signal(R11_start:R11_stop,1) = -20;

    % Pulse #12: Test > 3sec Xload threshold event, count, timer
        Xpulse12_start = R11_stop + 1;
        %==================================
        Xload_pulse12_duration_ms = 5000; % exceed Xload threshold for 1 sec < dur < 3 sec start 0 sec and 1 sec event counters and timer
        Rest_pulse12_duration_ms = 5000; % drop below Xload threshold
        %==================================
            Xpulse12 = uint16(Xload_pulse12_duration_ms/rate_ms);  % uints = number of execution loops
            Xrest12 = uint16(Rest_pulse12_duration_ms/rate_ms);  % uints = number of execution loops
            X12_start = Xpulse12_start;
            X12_stop = Xpulse12_start + Xpulse12;
            R12_start = X12_stop + 1;
            R12_stop = R12_start + Xrest12;
            
            test_signal(X12_start:X12_stop,1) = -181; 
            test_signal(R12_start:R12_stop,1) = -20;

testsignal_shunt = [time,test_signal];


sim_StartTime = time(1);
sim_StopTime = time(test_samples);

% optional write testsignal with time to a spreadsheet for use by the HiL test system
    writematrix(testsignal_shunt,'PM_Xloading_testsignal.xlsx')