%close all

fig_pos_H = [-1800,1300,1500,1100];  % [1500,1500,700,600];1500
fig_pos_H1 = [-1750,1250,1500,1100];  % [1800,900,1400,1200];
fig_pos_H2 = [-1700,1200,1500,1100];  % [1700,1250,1500,800] [2300,1000,1400,1200];  

build_table = 0;  % 1 = build the table
skip_plots = 0;   % 1 = skip plotting

    % get new figure position after positioning plot(optional>>>> comment out when executing!)
         %fig_pos_H = get(H,'Position');
%         fig_pos_H1 = get(H1,'Position');
         %fig_pos_H2 = get(H2,'Position');

%% ===================================================================================
%  BUILD SIMRESULTS OUTPUT TABLE
%     sim_time_s = SimResults.tout;
%     test_pack_cap_now_mAh = SimResults.test_pack_cap_now_mAh;
%      
%     sim_pcap_prev_nAh = SimResults.reported_pcap_prev_nAh;
%     sim_dcap_nAh = SimResults.dcap_nAh;
%     sim_pcap_now_nAh = SimResults.reported_pcap_now_nAh;
%     sim_pcap_now_mAh_fxp2flp = SimResults.reported_remaining_pcap_now_fxp2flp;
%     sim_mode = SimResults.mode;
%   
%     sim_rex_ctr_ms = SimResults.rex_ctr_ms;

   % calculate signal performance metrics
      %error = test_pack_cap_now_mAh - sim_pcap_now_mAh_fxp2flp;

   % Gerenate SimResults table of relevant variables under test
%        if build_table == 1
%            SoCfxp_SimResults_table = table(time_index,sim_time_s,test_pack_cap_mAh,test_shunt_mA,test_mode,test_dCap_mAh,test_pack_cap_now_mAh,...
%               sim_pcap_prev_nAh,sim_mode,sim_dcap_nAh,sim_pcap_now_nAh,sim_pcap_now_mAh_fxp2flp,sim_rex_ctr_ms);
%     
%            if num_testsignal_smpls > 1190000 % max xlsx rows
%                if tc_iter_current == 2
%                     filename = 'SoCfxp_func100_tc03_iter02_SimResults_table.mat';
%                     save(filename,'SoCfxp_SimResults_table')
%                elseif tc_iter_current == 3
%                     filename = 'SoCfxp_func100_tc03_iter03_SimResults_table.mat';
%                     save(filename,'SoCfxp_SimResults_table')
%                elseif tc_iter_current == 4
%                     filename = 'SoCfxp_func100_tc03_iter04_SimResults_table.mat';
%                     save(filename,'SoCfxp_SimResults_table')
%                end
%            else
%                 filename = 'SoCfxp_SimResults_table.xlsx';
%                 writetable(SoCfxp_SimResults_table,filename,'Sheet',tc_iter_current,'Range','A1')
%            end
%        end

%% ==================================================
%  PLOTS
if skip_plots == 0
%     % Set axis limits   
%         %ylim_min_mode = 0.75;
%         %ylim_max_mode = 3.25;
% 
%         %min_cap = min(test_pack_cap_mAh); max_cap = max(test_pack_cap_mAh);
%         %ylim_min_cap = 0 - 0.25*max_cap; ylim_max_cap = max_cap + 0.25*max_cap;
% 
%         %min_shunt = min(test_shunt_mA); max_shunt = max(test_shunt_mA);
%         %ylim_min_shunt = min_shunt + 0.25*min_shunt; ylim_max_shunt = max_shunt + 0.25*max_shunt;
% 
%        % min_dcap = min(test_dCap_mAh); max_dcap = max(test_dCap_mAh);
%         %ylim_min_dcap = min_dcap + 0.25*min_dcap; ylim_max_dcap = max_dcap + 0.25*max_dcap;
%     
%         %min_error = min(error); ylim_min_error = min_error + 0.25*min_error;
%         %max_error = max(error); ylim_max_error = max_error + 0.25*max_error; 
% 
%         %min_rex_ctr_ms = min(sim_rex_ctr_ms); max_rex_ctr_ms = max(sim_rex_ctr_ms);
%         %ylim_min_ctr_ms = -10; ylim_max_ctr_ms = max_rex_ctr_ms + 200;
% 
%         xlim_min = 1; xlim_max = test_samples;
%         % Discharge Power Map start-stop xlim
%             xlim_Dchg_start = 1; xlim_Dchg_stop = 22000;
%         % Regen Power Map start-stop xlim
%             xlim_Regen_start = 23000; xlim_Regen_stop = 46000;
%         %Xloading start-stop xlim
%             xlim_Xamps_start = 45500; xlim_Xamps_stop = 52000;
% 
%    % Set Chart Description strings that describe Function, Test Case, Iteration and other test case and iteration settings
% %         descr_str = 'P42A Cells w/ live input signals';
% %         tc_descr_str = 'pack cals';
% %         if tc_iter_current == 01
% %             iter_descr_str = '1p1s MOLiCel P42A';
% %         elseif tc_iter_current == 02
% %             iter_descr_str = '7p14s MOLiCel P42A';
% %         elseif tc_iter_current == 03
% %             iter_descr_str = '900s delay';
% %         elseif tc_iter_current == 04
% %             iter_descr_str = '900s delay';
% %         elseif tc_iter_current == 05
% %             iter_descr_str = '3000s delay';
% %         elseif tc_iter_current == 06
% %             iter_descr_str = '900s delay';
% %         end
% %         chart_title_str = [app_test_str space_str functional_component_str open_parenth_str descr_str closed_parenth_str fwd_slash_str...
% %             tc_str tc_num_str open_parenth_str tc_descr_str closed_parenth_str fwd_slash_str...
% %             tc_iter_str tc_iter_num_str open_parenth_str iter_descr_str closed_parenth_str];
% 
% %% PLOT DISCHARGE POWER MAP OUTPUTS
% H = figure('position',fig_pos_H);
% 
% H_subplots = 5;
%         
%     sp1(1) = subplot(H_subplots,1,1);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(time(xlim_Dchg_start:xlim_Dchg_stop),-1*test_signal(xlim_Dchg_start:xlim_Dchg_stop),'-k','LineWidth',1,'DisplayName','shunt')
%         plot(time(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_PL(xlim_Dchg_start:xlim_Dchg_stop),'-m','LineWidth',2,'DisplayName','Dchg PL')
%         yline(100,'--g','DisplayName','cont thresh')
%         yline(157,'--r','DisplayName','50sec thresh')
%         yline(200,'--b','DisplayName','10sec thresh')
%         ylabel('amps'); ylim([-10 210])
%         ax = gca; ax.YColor = 'k';
%         %yyaxis right; 
%         %plot(SimResults.cc_cap_prev_uAh_uint32,'--c','LineWidth',1,'DisplayName','Pcap now uint32')
%         %plot(SimResults.cc_cap_now_mAh_simout - 100 ,'-b','LineWidth',2,'DisplayName','Pcap now simout')
%         %ylabel('Capacity now (µAh)'); ylim([ylim_min_cap*scaler1 ylim_max_cap*scaler1])
%         %ax = gca; ax.YColor = 'b';
%         grid minor
%         xlabel('seconds'); %xlim([xlim_Regen_start xlim_Regen_stop])
%         title('Discharge Current Limit')
%         legend('show','Location','northeast')
%         box on
%  
%     sp1(2) = subplot(H_subplots,1,2);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yline(511,':k','DisplayName','center')
%         %yyaxis left; 
%         plot(time(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_10sPL_timer(xlim_Dchg_start:xlim_Dchg_stop),'-k','LineWidth',1,'DisplayName','10s tmr')
%         %yline(0,':k','DisplayName','0A ref')
%         ylabel('msec'); ylim([-500 10500])
%         ax = gca; ax.YColor = 'k';
%         %yyaxis right; 
%         %plot(SimResults.dCap_uAh_int32,'--c','LineWidth',1,'DisplayName','dCap mAh int32')
%         %yline(0,':b','DisplayName','0A ref')
% %         yline(cal_Relaxing_pos_thresh_mA,'--r','DisplayName','pos relax thresh')
% %         yline(cal_Relaxing_neg_thresh_mA,'--b','DisplayName','neg relax thres')
%         %ylabel('dCap now (µAh)'); ylim([ylim_min_dcap*scaler1 ylim_max_dcap*scaler1])
%         %ax = gca; ax.YColor = 'b';
%         grid minor
%         xlabel('msec'); %xlim([xlim_min xlim_max])
%         title('Discharge 10 second Surge timer')
%         legend('show','Location','northeast')
%         box on
% 
%     sp1(3) = subplot(H_subplots,1,3); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(time(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_10sPL_state(xlim_Dchg_start:xlim_Dchg_stop),'-k','LineWidth',1,'DisplayName','10s state'); 
%         %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--g','LineWidth',1,'DisplayName','Cap now mAh dfloat fxp calc'); 
%         ylabel('enum'); ylim([-0.25 6.26]) %m_min_cap ylim_max_cap])
%         ax = gca; ax.YColor = 'k';
%         % calc the rounding error: DO NOT COMPARE "NOW" AGAINST PREVIOUS, as this result is precisely the dCap signal
%         % compare a full floating-point calc of Cap now against the fixed-point calc of same (see Test Harness model)
%         %yyaxis right; 
%         %plot(SimResults.Cap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->uint32 error')
%         %ylabel('rounding error'); ylim([-0.001 5]);%ylim([-40 40])
%         %ax = gca; ax.YColor = 'r';
%         grid minor
%         xlabel('seconds'); %xlim([xlim_min xlim_max])
%         title('Discharge 10 second Surge State')
%         subtitle('(0 = max duration, 1 = enabled restoring, 2 = enabled expiring, 3 = disabled expiring, 4 = disabled, 5 disabled restoring, 6 = locked out)')
%         legend('show','Location','northeast')
%         box on
%  
%     sp1(4) = subplot(H_subplots,1,4); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(time(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_50sPL_timer(xlim_Dchg_start:xlim_Dchg_stop),'-k','LineWidth',1,'DisplayName','50s tmr'); 
%         %plot(SimResults.dCap_uAh_int32/scaler1,'--g','LineWidth',1,'DisplayName','dCap mAh int32');
%         ylabel('msec'); ylim([-1000 51000])
%         ax = gca; ax.YColor = 'k';
%         % calc the rounding error
%         %dCap_error_rounding = SimResults.dCap_mAh_dfloat - (double(SimResults.dCap_uAh_int32)/scaler1);
%         %yyaxis right; 
%         %plot(SimResults.dCap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->int32 error'); %plot(dCap_error_rounding(500),'or')
%         %ylabel('rounding error'); ylim([-0.001 0.002]); %ylim([-30*cal_fpgain_2 30*scaler1])
%         ax = gca; ax.YColor = 'r';
%         xlabel('seconds'); %xlim([xlim_min xlim_max])
%         grid minor
%         title('Discharge 50 second Surge timer')
%         legend('show','Location','northeast')
%         box on
% 
%     sp1(5) = subplot(H_subplots,1,5); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(time(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_50sPL_state(xlim_Dchg_start:xlim_Dchg_stop),'-k','LineWidth',1,'DisplayName','50s state'); 
%         %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--g','LineWidth',1,'DisplayName','Cap now mAh dfloat fxp calc'); 
%         ylabel('enum'); ylim([-0.25 6.26]) %m_min_cap ylim_max_cap])
%         ax = gca; ax.YColor = 'k';
%         %yyaxis right; 
%         %plot(SimResults.Cap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->uint32 error')
%         %ylabel('rounding error'); ylim([-0.001 5]);%ylim([-40 40])
%         %ax = gca; ax.YColor = 'r';
%         grid minor
%         xlabel('seconds'); %xlim([xlim_min xlim_max])
%         title('Discharge 50 second Surge State')
%         subtitle('(0 = max duration, 1 = enabled restoring, 2 = enabled expiring, 3 = disabled expiring, 4 = disabled, 5 disabled restoring, 6 = locked out)')
%         legend('show','Location','northeast')
%         box on
%         
%         sgtitle('DISCHARGE POWER MAP');
%         linkaxes(sp1,'x')
% 
%     
% %% PLOT REGEN POWER MAP OUTPUTS
% H1 = figure('position',fig_pos_H1);
% H1_subplots = 5;
%          
%     sp1(1) = subplot(H1_subplots,1,1);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(time(xlim_Regen_start:xlim_Regen_stop),test_signal(xlim_Regen_start:xlim_Regen_stop),'-k','LineWidth',1,'DisplayName','shunt')
%         plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.Regen_PL(xlim_Regen_start:xlim_Regen_stop),'-m','LineWidth',2,'DisplayName','Regen PL')
%         yline(29,'--g','DisplayName','cont thresh')
%         yline(58,'--r','DisplayName','50sec thresh')
%         yline(84,'--b','DisplayName','10sec thresh')
%         ylabel('amps'); ylim([-10 100])
%         ax = gca; ax.YColor = 'k';
%         %yyaxis right; 
%         %plot(SimResults.cc_cap_prev_uAh_uint32,'--c','LineWidth',1,'DisplayName','Pcap now uint32')
%         %plot(SimResults.cc_cap_now_mAh_simout - 100 ,'-b','LineWidth',2,'DisplayName','Pcap now simout')
%         %ylabel('Capacity now (µAh)'); ylim([ylim_min_cap*scaler1 ylim_max_cap*scaler1])
%         %ax = gca; ax.YColor = 'b';
%         grid minor
%         xlabel('seconds'); %xlim([xlim_Regen_start xlim_Regen_stop])
%         title('Regen Current Limit')
%         legend('show','Location','northeast')
%         box on
%  
%     sp1(2) = subplot(H1_subplots,1,2);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yline(511,':k','DisplayName','center')
%         %yyaxis left; 
%         plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.Regen_10sPL_timer(xlim_Regen_start:xlim_Regen_stop),'-k','LineWidth',1,'DisplayName','10s tmr')
%         %yline(0,':k','DisplayName','0A ref')
%         ylabel('msec'); ylim([-500 10500])
%         ax = gca; ax.YColor = 'k';
%         %yyaxis right; 
%         %plot(SimResults.dCap_uAh_int32,'--c','LineWidth',1,'DisplayName','dCap mAh int32')
%         %yline(0,':b','DisplayName','0A ref')
% %         yline(cal_Relaxing_pos_thresh_mA,'--r','DisplayName','pos relax thresh')
% %         yline(cal_Relaxing_neg_thresh_mA,'--b','DisplayName','neg relax thres')
%         %ylabel('dCap now (µAh)'); ylim([ylim_min_dcap*scaler1 ylim_max_dcap*scaler1])
%         %ax = gca; ax.YColor = 'b';
%         grid minor
%         xlabel('msec'); %xlim([xlim_min xlim_max])
%         title('Regen 10 second Surge timer')
%         legend('show','Location','northeast')
%         box on
% 
%     sp1(3) = subplot(H1_subplots,1,3); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.Regen_10sPL_state(xlim_Regen_start:xlim_Regen_stop),'-k','LineWidth',1,'DisplayName','10s state'); 
%         %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--g','LineWidth',1,'DisplayName','Cap now mAh dfloat fxp calc'); 
%         ylabel('enum'); ylim([-0.25 6.26]) %m_min_cap ylim_max_cap])
%         ax = gca; ax.YColor = 'k';
%         % calc the rounding error: DO NOT COMPARE "NOW" AGAINST PREVIOUS, as this result is precisely the dCap signal
%         % compare a full floating-point calc of Cap now against the fixed-point calc of same (see Test Harness model)
%         %yyaxis right; 
%         %plot(SimResults.Cap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->uint32 error')
%         %ylabel('rounding error'); ylim([-0.001 5]);%ylim([-40 40])
%         %ax = gca; ax.YColor = 'r';
%         grid minor
%         xlabel('seconds'); %xlim([xlim_min xlim_max])
%         title('Regen 10 second Surge State')
%         subtitle('(0 = max duration, 1 = enabled restoring, 2 = enabled expiring, 3 = disabled expiring, 4 = disabled, 5 disabled restoring, 6 = locked out)')
%         legend('show','Location','northeast')
%         box on
%  
%     sp1(4) = subplot(H1_subplots,1,4); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.Regen_50sPL_timer(xlim_Regen_start:xlim_Regen_stop),'-k','LineWidth',1,'DisplayName','50s tmr'); 
%         %plot(SimResults.dCap_uAh_int32/scaler1,'--g','LineWidth',1,'DisplayName','dCap mAh int32');
%         ylabel('msec'); ylim([-1000 51000])
%         ax = gca; ax.YColor = 'k';
%         % calc the rounding error
%         %dCap_error_rounding = SimResults.dCap_mAh_dfloat - (double(SimResults.dCap_uAh_int32)/scaler1);
%         %yyaxis right; 
%         %plot(SimResults.dCap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->int32 error'); %plot(dCap_error_rounding(500),'or')
%         %ylabel('rounding error'); ylim([-0.001 0.002]); %ylim([-30*cal_fpgain_2 30*scaler1])
%         ax = gca; ax.YColor = 'r';
%         xlabel('seconds'); %xlim([xlim_min xlim_max])
%         grid minor
%         title('Regen 50 second Surge timer')
%         legend('show','Location','northeast')
%         box on
% 
%     sp1(5) = subplot(H1_subplots,1,5); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.Regen_50sPL_state(xlim_Regen_start:xlim_Regen_stop),'-k','LineWidth',1,'DisplayName','50s state'); 
%         %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--g','LineWidth',1,'DisplayName','Cap now mAh dfloat fxp calc'); 
%         ylabel('enum'); ylim([-0.25 6.26]) %m_min_cap ylim_max_cap])
%         ax = gca; ax.YColor = 'k';
%         %yyaxis right; 
%         %plot(SimResults.Cap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->uint32 error')
%         %ylabel('rounding error'); ylim([-0.001 5]);%ylim([-40 40])
%         %ax = gca; ax.YColor = 'r';
%         grid minor
%         xlabel('seconds'); %xlim([xlim_min xlim_max])
%         title('Regen 50 second Surge State')
%         subtitle('(0 = max duration, 1 = enabled restoring, 2 = enabled expiring, 3 = disabled expiring, 4 = disabled, 5 disabled restoring, 6 = locked out)')
%         legend('show','Location','northeast')
%         box on
%         
%         sgtitle('REGEN POWER MAP');
%         linkaxes(sp1,'x')
%     
% % ============================================================================================
%% PLOT EXCESSIVE AMPS OUTPUTS
H2 = figure('position',fig_pos_H2);
H2_subplots = 7;
        
    sp2(1) = subplot(H2_subplots,1,1);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
%        yyaxis left; 
            plot(SimResults.tout,SimResults.shunt,'-k','LineWidth',1,'DisplayName','shunt')
            plot(SimResults.tout,SimResults.Xamps_limit,'--r','LineWidth',1,'DisplayName','regen limit')
            %yline(105,'--r','DisplayName','abs max A')
            %ax = gca; ax.YColor = 'k';
            ylabel('amps'); 
            ylim([-10 750])
            %annotation('textbox', [0.45, 0.78, 0.1, 0.1], 'String', "1 = discharging, 2 = relaxing, 3 = charging")
%         yyaxis right; 
%         plot(SimResults.Capacity_prev_mAh_uint32,'--c','LineWidth',1,'DisplayName','Pcap now uint32')
%         %plot(SimResults.Capacity_now_mAh_simout - 100 ,'-b','LineWidth',2,'DisplayName','Pcap now simout')
%         yline(0,':b','DisplayName','0A ref')
% %         yline(cal_Relaxing_pos_thresh_mA,'--r','DisplayName','pos relax thresh')
% %         yline(cal_Relaxing_neg_thresh_mA,'--b','DisplayName','neg relax thres')
%         ylabel('Capacity OUT (µAh)'); ylim([-1000*cal_gain1 3000*cal_gain1])
%         ax = gca;
%         ax.YColor = 'b';
        %xlim([xlim_Xload_start xlim_Xload_start])
        grid minor
        xlabel('seconds'); 
        title('Live Test Current & Limit Value')
        legend('show','Location','northeast')
        box on

    sp2(2) = subplot(H2_subplots,1,2);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        yyaxis left; 
            plot(SimResults.tout,SimResults.Xamps_enum,'-k','LineWidth',1,'DisplayName','Xamps level'); 
            %annotation('textbox', [0.4, 0.66, 0.1, 0.1], 'BackgroundColor',[0.7 0.7 0.7],'Color','blue',...
            %    'String',"0 = no violations, 1 = 0 sec violation, 2 = 1 sec violation, 3 = full duration violation")
            %yline(0,':b','DisplayName','0A Ref')
            %yline(cal_Relaxing_pos_thresh_mA,':b','LineWidth',1,'DisplayName','pos thresh')
            %yline(cal_Relaxing_neg_thresh_mA,':b','LineWidth',1,'DisplayName','neg thresh')
            ylim([-1 4])
            ylabel('Xamps enum'); ylim([-0.25 3.25]) 
            ax = gca; ax.YColor = 'k';
        yyaxis right; 
            plot(SimResults.tout,SimResults.Xamps_diag_level,'-.r','LineWidth',1,'DisplayName','diag level');
            ylim([-1 10])
            ylabel('diag enum'); %ylim([-0.25 10])
            ax = gca; ax.YColor = 'r'; 
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Excessive Amps State Machine & Diagnostic enumerations')
        subtitle('(0-0 no violations // 1-4 ALARM (0 sec) violation // 2-5 FAULT (1 sec) violation // 3-7 PROTECT (full dur) violation)')
        legend('show','Location','west')
        box on

    sp2(3) = subplot(H2_subplots,1,3);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout,SimResults.Xamps_alarm_events,'-k','LineWidth',1,'DisplayName','alarm ev cnt'); 
        ylabel('count'); ylim([-1 10])
        %ax = gca; ax.YColor = 'k';
        %ylabel('count'); ylim([-0.25 6.25]) 
        %yyaxis right; 
        %plot(SimResults.rex_cap_mAh_dfloat,'--m','LineWidth',1,'DisplayName','cap mAh dfloat'); 
        %ylabel('mAh'); %ylim([-10 10])
        %ax = gca; ax.YColor = 'm';
        %plot(SimResults.PackCap_previous_mAh,'-r','DisplayName','Cap prev mAh');
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Number of ALARM Violation events')
        legend('show','Location','southeast')
        box on
             
    sp2(4) = subplot(H2_subplots,1,4); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout,SimResults.Xamps_fault_events,'-k','LineWidth',1,'DisplayName','fault ev cnt'); 
        %ylabel('% soc'); ylim([-10 110])
        %ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--m','LineWidth',1,'DisplayName','cc cap dfloat'); 
        ylabel('count'); ylim([-1 10]) %ylim([-0.25 6.25]); %ylim([ylim_min_cap ylim_max_cap]); 
        %ax = gca; ax.YColor = 'm'; 
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Number of FAULT Violation events')
        legend('show','Location','northeast')
        box on
%         
sp2(5) = subplot(H2_subplots,1,5); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout,SimResults.Xamps_protect_events,'-k','LineWidth',1,'DisplayName','protect ev cnt');  
        %yline(3000,'--r','LineWidth',2,'DisplayName','dur max')
        %xline(trans(1,1),':r','LineWidth',1,'DisplayName','Dchg2Relax');
        ylabel('count');  ylim([-1 10])
        %ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.rpt_cap_now_mAh_dfloat,'--m','LineWidth',1,'DisplayName','rpt cap mAh dfloat');
        %ylabel('mAh'); ylim([ylim_min_cap ylim_max_cap])
        %ax = gca; ax.YColor = 'm';
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Number of PROTECT Violation events')
        legend('show','Location','northeast')
        box on    

sp2(6) = subplot(H2_subplots,1,6); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout,SimResults.Xamps_timer,'-k','LineWidth',1,'DisplayName','viol dur tmr'); 
        plot(SimResults.tout,SimResults.Xamps_duration_limit,':r','LineWidth',1,'DisplayName','dur limit');
        %yline(3000,'--r','LineWidth',2,'DisplayName','dur max')
        %xline(trans(1,1),':r','LineWidth',1,'DisplayName','Dchg2Relax');
        ylabel('msec');  ylim([-500 10000])
        %ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.rpt_cap_now_mAh_dfloat,'--m','LineWidth',1,'DisplayName','rpt cap mAh dfloat');
        %ylabel('mAh'); ylim([ylim_min_cap ylim_max_cap])
        %ax = gca; ax.YColor = 'm';
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Excessive Amps Violation Durations')
        legend('show','Location','west')
        box on

 sp(7) = subplot(H2_subplots,1,7);
        hold on
        yyaxis left; 
            plot(SimResults.tout,SimResults.X_peakamps_at_fault,'-k','LineWidth',1,'DisplayName','peak fault A'); 
            ylabel('Amperage (A)'); ylim([-100 1700])
            ax = gca; ax.YColor = 'k';
        yyaxis right; 
            plot(SimResults.tout,SimResults.X_peakamps_at_protect,'-.r','LineWidth',1,'DisplayName','peak protect A'); 
            ylabel('Amperage (A)'); ylim([-100 1700])
            ax = gca; ax.YColor = 'r';
            %plot(SimResults.PackCapacity_prev_mAh_shifted_1e6_int32,'--m','LineWidth',0.5,'DisplayName','Pcao mAh 1e6 int32'); ylabel(''); ax = gca; ax.YColor = 'm'; %ylim([-10 10])
            %plot(SimResults.PackCap_previous_mAh,'-r','DisplayName','Cap prev mAh');
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Peak Current at Excessive Amps Fault and Protect Events')
        legend('show','Location','west')
        box on
        %xlim([xlim_Xstart xlim_Xstop])                 
        sgtitle('EXCESSIVE CURRENT MONITORING');
        linkaxes(sp2,'x')
% 
%         Ha = figure('position',fig_pos_H);
%             hold on
%             yyaxis left;
%             plot(SimResults.cc_cap_now_mAh_dfloat_flp_calc,'-k','LineWidth',1,'DisplayName','cc cap now mAh dfloat flp calc'); 
%             plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--c','LineWidth',1,'DisplayName','cc cap now mAh dfloat fxp calc'); 
%             ylabel('Capacity (mAh)'); ylim([-100 cal_max_cellcapacity_mAh+100])
%             ax = gca;
%             ax.YColor = 'k';
%             yyaxis right; 
%             Cap_min = min(SimResults.Cap_error_rounding); Cap_max = max(SimResults.Cap_error_rounding);
%             plot(SimResults.Cap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->int32 error'); %plot(Cap_error_rounding,'or')
%             grid minor
%             title('Coulomb Counting Capacity: Zoom IN on fixed-point rounding errors')
%             legend('show','Location','northeast')
%             box on
% 
%         Hb = figure('position',fig_pos_H);
%             hold on
%             yyaxis left; 
%             plot(SimResults.dCap_mAh_dfloat,'-k','LineWidth',1,'DisplayName','cc cap now mAh dfloat flp calc'); 
%             plot(SimResults.dCap_uAh_int32/scaler1,'--c','LineWidth',1,'DisplayName','cc cap now mAh dfloat fxp calc'); 
%             ylabel('Capacity (mAh)'); ylim([ylim_min_dcap ylim_max_dcap])
%             ax = gca;
%             ax.YColor = 'k';
%             yyaxis right; 
%             dCap_min = min(SimResults.dCap_error_rounding); dCap_max = max(SimResults.dCap_error_rounding);
%             plot(SimResults.dCap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->int32 error'); %plot(dCap_error_rounding,'or')
%             ylabel('rounding error'); ylim([dCap_min-0.003 dCap_max+0.003]);
%             xlabel('loop count (count x30 seconds)'); 
%             ax = gca;
%             ax.YColor = 'r';
%             grid minor
%             title('delta Capacity since last read: Zoom IN on fixed-point rounding errors')
%             legend('show','Location','northeast')
%             box on
% 
%         Hc= figure('position',fig_pos_H);
%             hold on
%             yyaxis left; 
%             plot(SimResults.cc_soc_now_mper_dfloat_flp_calc,'-k','LineWidth',1,'DisplayName','cc soc now mper dfloat flp calc'); 
%             plot(SimResults.cc_soc_now_mper_dfloat,'--c','LineWidth',1,'DisplayName','cc soc now mper dfloat fxp calc'); 
%             ylabel('Capacity (mAh)'); ylim([-2 102])
%             ax = gca;
%             ax.YColor = 'k';
%             yyaxis right; 
%             soc_err_min = min(SimResults.cc_soc_error_rounding); soc_err_max = max(SimResults.cc_soc_error_rounding);
%             plot(SimResults.cc_soc_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->int32 error'); %plot(dCap_error_rounding,'or')
%             ylabel('rounding error'); ylim([-1.5 1.5]); %soc_err_min soc_err_max]);
%             xlabel('loop count (count x30 seconds)'); 
%             ax = gca;
%             ax.YColor = 'r';
%             grid minor
%             title('Coulomb Counting-derived SoC: Zoom IN on fixed-point rounding errors')
%             legend('show','Location','northeast')
%             box on
end