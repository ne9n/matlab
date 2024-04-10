close all

fig_pos_Dchg = [-1800,1300,1500,1100];  % [1500,1500,700,600];1500
fig_pos_Regen = [-1750,1250,1500,1100];  % [1800,900,1400,1200];
fig_pos_Xdchg = [-1700,1200,1500,1100];  % [1700,1250,1500,800] [2300,1000,1400,1200];  
fig_pos_Xregen = [-1650,1150,1500,1100];  % [1700,1250,1500,800] [2300,1000,1400,1200];  

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
    % Set axis limits   
        %ylim_min_mode = 0.75;
        %ylim_max_mode = 3.25;

        %min_cap = min(test_pack_cap_mAh); max_cap = max(test_pack_cap_mAh);
        %ylim_min_cap = 0 - 0.25*max_cap; ylim_max_cap = max_cap + 0.25*max_cap;

        %min_shunt = min(test_shunt_mA); max_shunt = max(test_shunt_mA);
        %ylim_min_shunt = min_shunt + 0.25*min_shunt; ylim_max_shunt = max_shunt + 0.25*max_shunt;

       % min_dcap = min(test_dCap_mAh); max_dcap = max(test_dCap_mAh);
        %ylim_min_dcap = min_dcap + 0.25*min_dcap; ylim_max_dcap = max_dcap + 0.25*max_dcap;
    
        %min_error = min(error); ylim_min_error = min_error + 0.25*min_error;
        %max_error = max(error); ylim_max_error = max_error + 0.25*max_error; 

        %min_rex_ctr_ms = min(sim_rex_ctr_ms); max_rex_ctr_ms = max(sim_rex_ctr_ms);
        %ylim_min_ctr_ms = -10; ylim_max_ctr_ms = max_rex_ctr_ms + 200;

        xlim_min = 1; xlim_max = test_samples;
        % Discharge Power Map start-stop xlim
            xlim_Dchg_start = 1; xlim_Dchg_stop = 25000;
        % Regen Power Map start-stop xlim
            xlim_Regen_start = 20000; xlim_Regen_stop = 45000;
        % Excessive Discharge start-stop xlim
            xlim_Xdchg_start = 41500; xlim_Xdchg_stop = 48500;
        % Excessive Regen start-stop xlim
            xlim_Xregen_start = 48500; xlim_Xregen_stop = 72001;

   % Set Chart Description strings that describe Function, Test Case, Iteration and other test case and iteration settings
%         descr_str = 'P42A Cells w/ live input signals';
%         tc_descr_str = 'pack cals';
%         if tc_iter_current == 01
%             iter_descr_str = '1p1s MOLiCel P42A';
%         elseif tc_iter_current == 02
%             iter_descr_str = '7p14s MOLiCel P42A';
%         elseif tc_iter_current == 03
%             iter_descr_str = '900s delay';
%         elseif tc_iter_current == 04
%             iter_descr_str = '900s delay';
%         elseif tc_iter_current == 05
%             iter_descr_str = '3000s delay';
%         elseif tc_iter_current == 06
%             iter_descr_str = '900s delay';
%         end
%         chart_title_str = [app_test_str space_str functional_component_str open_parenth_str descr_str closed_parenth_str fwd_slash_str...
%             tc_str tc_num_str open_parenth_str tc_descr_str closed_parenth_str fwd_slash_str...
%             tc_iter_str tc_iter_num_str open_parenth_str iter_descr_str closed_parenth_str];

%% PLOT DISCHARGE POWER MAP OUTPUTS
H_Dchg = figure('position',fig_pos_Dchg);

H_Dchg_subplots = 5;
        
    sp_Dchg(1) = subplot(H_Dchg_subplots,1,1);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout(xlim_Dchg_start:xlim_Dchg_stop),SimResults.shunt(xlim_Dchg_start:xlim_Dchg_stop),'-k','LineWidth',1,'DisplayName','shunt')
        plot(SimResults.tout(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_PL(xlim_Dchg_start:xlim_Dchg_stop),'-m','LineWidth',2,'DisplayName','Dchg PL')
        plot(SimResults.tout(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_10sPL_limit(xlim_Dchg_start:xlim_Dchg_stop),'--b','DisplayName','10sec thresh')
        plot(SimResults.tout(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_50sPL_limit(xlim_Dchg_start:xlim_Dchg_stop),'--r','DisplayName','50sec thresh')
        plot(SimResults.tout(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_contPL_limit(xlim_Dchg_start:xlim_Dchg_stop),'--g','DisplayName','cont thresh')
        ylabel('amps'); ylim([-210 10])
        %ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.cc_cap_prev_uAh_uint32,'--c','LineWidth',1,'DisplayName','Pcap now uint32')
        %plot(SimResults.cc_cap_now_mAh_simout - 100 ,'-b','LineWidth',2,'DisplayName','Pcap now simout')
        %ylabel('Capacity now (µAh)'); ylim([ylim_min_cap*scaler1 ylim_max_cap*scaler1])
        %ax = gca; ax.YColor = 'b';
        grid minor
        xlabel('seconds'); %xlim([xlim_Regen_start xlim_Regen_stop])
        title('Discharge Current Limit')
        legend('show','Location','northeast')
        box on
 
    sp_Dchg(2) = subplot(H_Dchg_subplots,1,2);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yline(511,':k','DisplayName','center')
        %yyaxis left; 
        plot(time(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_10sPL_timer(xlim_Dchg_start:xlim_Dchg_stop),'-k','LineWidth',1,'DisplayName','10s tmr')
        %yline(0,':k','DisplayName','0A ref')
        ylabel('msec'); ylim([-500 10500])
        ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.dCap_uAh_int32,'--c','LineWidth',1,'DisplayName','dCap mAh int32')
        %yline(0,':b','DisplayName','0A ref')
%         yline(cal_Relaxing_pos_thresh_mA,'--r','DisplayName','pos relax thresh')
%         yline(cal_Relaxing_neg_thresh_mA,'--b','DisplayName','neg relax thres')
        %ylabel('dCap now (µAh)'); ylim([ylim_min_dcap*scaler1 ylim_max_dcap*scaler1])
        %ax = gca; ax.YColor = 'b';
        grid minor
        xlabel('msec'); %xlim([xlim_min xlim_max])
        title('Discharge 10 second Surge timer')
        legend('show','Location','northeast')
        box on

    sp_Dchg(3) = subplot(H_Dchg_subplots,1,3); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(time(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_10sPL_state(xlim_Dchg_start:xlim_Dchg_stop),'-k','LineWidth',1,'DisplayName','10s state'); 
        %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--g','LineWidth',1,'DisplayName','Cap now mAh dfloat fxp calc'); 
        ylabel('enum'); ylim([-0.25 6.26]) %m_min_cap ylim_max_cap])
        ax = gca; ax.YColor = 'k';
        % calc the rounding error: DO NOT COMPARE "NOW" AGAINST PREVIOUS, as this result is precisely the dCap signal
        % compare a full floating-point calc of Cap now against the fixed-point calc of same (see Test Harness model)
        %yyaxis right; 
        %plot(SimResults.Cap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->uint32 error')
        %ylabel('rounding error'); ylim([-0.001 5]);%ylim([-40 40])
        %ax = gca; ax.YColor = 'r';
        grid minor
        xlabel('seconds'); %xlim([xlim_min xlim_max])
        title('Discharge 10 second Surge State')
        subtitle('(0 = max duration, 1 = enabled restoring, 2 = enabled expiring, 3 = disabled expiring, 4 = disabled, 5 disabled restoring, 6 = locked out)')
        legend('show','Location','northeast')
        box on
 
    sp_Dchg(4) = subplot(H_Dchg_subplots,1,4); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(time(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_50sPL_timer(xlim_Dchg_start:xlim_Dchg_stop),'-k','LineWidth',1,'DisplayName','50s tmr'); 
        %plot(SimResults.dCap_uAh_int32/scaler1,'--g','LineWidth',1,'DisplayName','dCap mAh int32');
        ylabel('msec'); ylim([-1000 51000])
        ax = gca; ax.YColor = 'k';
        % calc the rounding error
        %dCap_error_rounding = SimResults.dCap_mAh_dfloat - (double(SimResults.dCap_uAh_int32)/scaler1);
        %yyaxis right; 
        %plot(SimResults.dCap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->int32 error'); %plot(dCap_error_rounding(500),'or')
        %ylabel('rounding error'); ylim([-0.001 0.002]); %ylim([-30*cal_fpgain_2 30*scaler1])
        ax = gca; ax.YColor = 'r';
        xlabel('seconds'); %xlim([xlim_min xlim_max])
        grid minor
        title('Discharge 50 second Surge timer')
        legend('show','Location','northeast')
        box on

    sp_Dchg(5) = subplot(H_Dchg_subplots,1,5); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(time(xlim_Dchg_start:xlim_Dchg_stop),SimResults.Dchg_50sPL_state(xlim_Dchg_start:xlim_Dchg_stop),'-k','LineWidth',1,'DisplayName','50s state'); 
        %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--g','LineWidth',1,'DisplayName','Cap now mAh dfloat fxp calc'); 
        ylabel('enum'); ylim([-0.25 6.26]) %m_min_cap ylim_max_cap])
        ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.Cap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->uint32 error')
        %ylabel('rounding error'); ylim([-0.001 5]);%ylim([-40 40])
        %ax = gca; ax.YColor = 'r';
        grid minor
        xlabel('seconds'); %xlim([xlim_min xlim_max])
        title('Discharge 50 second Surge State')
        subtitle('(0 = max duration, 1 = enabled restoring, 2 = enabled expiring, 3 = disabled expiring, 4 = disabled, 5 disabled restoring, 6 = locked out)')
        legend('show','Location','northeast')
        box on
        
        sgtitle('RECOMMENDED DISCHARGE POWER MAP');
        linkaxes(sp_Dchg,'x')

    
%% PLOT REGEN POWER MAP OUTPUTS
H_Regen = figure('position',fig_pos_Regen);
H1_Regen_subplots = 5;
         
    sp_Regen(1) = subplot(H1_Regen_subplots,1,1);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.shunt(xlim_Regen_start:xlim_Regen_stop),'-k','LineWidth',1,'DisplayName','shunt')
        plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.Regen_PL(xlim_Regen_start:xlim_Regen_stop),'-m','LineWidth',2,'DisplayName','Regen PL')
        yline(29,'--g','DisplayName','cont thresh')
        yline(58,'--r','DisplayName','50sec thresh')
        yline(84,'--b','DisplayName','10sec thresh')
        ylabel('amps'); ylim([-10 100])
        ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.cc_cap_prev_uAh_uint32,'--c','LineWidth',1,'DisplayName','Pcap now uint32')
        %plot(SimResults.cc_cap_now_mAh_simout - 100 ,'-b','LineWidth',2,'DisplayName','Pcap now simout')
        %ylabel('Capacity now (µAh)'); ylim([ylim_min_cap*scaler1 ylim_max_cap*scaler1])
        %ax = gca; ax.YColor = 'b';
        grid minor
        xlabel('seconds'); %xlim([xlim_Regen_start xlim_Regen_stop])
        title('Regen Current Limit')
        legend('show','Location','northeast')
        box on
 
    sp_Regen(2) = subplot(H1_Regen_subplots,1,2);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yline(511,':k','DisplayName','center')
        %yyaxis left; 
        plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.Regen_10sPL_timer(xlim_Regen_start:xlim_Regen_stop),'-k','LineWidth',1,'DisplayName','10s tmr')
        %yline(0,':k','DisplayName','0A ref')
        ylabel('msec'); ylim([-500 10500])
        ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.dCap_uAh_int32,'--c','LineWidth',1,'DisplayName','dCap mAh int32')
        %yline(0,':b','DisplayName','0A ref')
%         yline(cal_Relaxing_pos_thresh_mA,'--r','DisplayName','pos relax thresh')
%         yline(cal_Relaxing_neg_thresh_mA,'--b','DisplayName','neg relax thres')
        %ylabel('dCap now (µAh)'); ylim([ylim_min_dcap*scaler1 ylim_max_dcap*scaler1])
        %ax = gca; ax.YColor = 'b';
        grid minor
        xlabel('msec'); %xlim([xlim_min xlim_max])
        title('Regen 10 second Surge timer')
        legend('show','Location','northeast')
        box on

    sp_Regen(3) = subplot(H1_Regen_subplots,1,3); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.Regen_10sPL_state(xlim_Regen_start:xlim_Regen_stop),'-k','LineWidth',1,'DisplayName','10s state'); 
        %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--g','LineWidth',1,'DisplayName','Cap now mAh dfloat fxp calc'); 
        ylabel('enum'); ylim([-0.25 6.26]) %m_min_cap ylim_max_cap])
        ax = gca; ax.YColor = 'k';
        % calc the rounding error: DO NOT COMPARE "NOW" AGAINST PREVIOUS, as this result is precisely the dCap signal
        % compare a full floating-point calc of Cap now against the fixed-point calc of same (see Test Harness model)
        %yyaxis right; 
        %plot(SimResults.Cap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->uint32 error')
        %ylabel('rounding error'); ylim([-0.001 5]);%ylim([-40 40])
        %ax = gca; ax.YColor = 'r';
        grid minor
        xlabel('seconds'); %xlim([xlim_min xlim_max])
        title('Regen 10 second Surge State')
        subtitle('(0 = max duration, 1 = enabled restoring, 2 = enabled expiring, 3 = disabled expiring, 4 = disabled, 5 disabled restoring, 6 = locked out)')
        legend('show','Location','northeast')
        box on
 
    sp_Regen(4) = subplot(H1_Regen_subplots,1,4); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.Regen_50sPL_timer(xlim_Regen_start:xlim_Regen_stop),'-k','LineWidth',1,'DisplayName','50s tmr'); 
        %plot(SimResults.dCap_uAh_int32/scaler1,'--g','LineWidth',1,'DisplayName','dCap mAh int32');
        ylabel('msec'); ylim([-1000 51000])
        ax = gca; ax.YColor = 'k';
        % calc the rounding error
        %dCap_error_rounding = SimResults.dCap_mAh_dfloat - (double(SimResults.dCap_uAh_int32)/scaler1);
        %yyaxis right; 
        %plot(SimResults.dCap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->int32 error'); %plot(dCap_error_rounding(500),'or')
        %ylabel('rounding error'); ylim([-0.001 0.002]); %ylim([-30*cal_fpgain_2 30*scaler1])
        ax = gca; ax.YColor = 'r';
        xlabel('seconds'); %xlim([xlim_min xlim_max])
        grid minor
        title('Regen 50 second Surge timer')
        legend('show','Location','northeast')
        box on

    sp_Regen(5) = subplot(H1_Regen_subplots,1,5); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(time(xlim_Regen_start:xlim_Regen_stop),SimResults.Regen_50sPL_state(xlim_Regen_start:xlim_Regen_stop),'-k','LineWidth',1,'DisplayName','50s state'); 
        %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--g','LineWidth',1,'DisplayName','Cap now mAh dfloat fxp calc'); 
        ylabel('enum'); ylim([-0.25 6.26]) %m_min_cap ylim_max_cap])
        ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.Cap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->uint32 error')
        %ylabel('rounding error'); ylim([-0.001 5]);%ylim([-40 40])
        %ax = gca; ax.YColor = 'r';
        grid minor
        xlabel('seconds'); %xlim([xlim_min xlim_max])
        title('Regen 50 second Surge State')
        subtitle('(0 = max duration, 1 = enabled restoring, 2 = enabled expiring, 3 = disabled expiring, 4 = disabled, 5 disabled restoring, 6 = locked out)')
        legend('show','Location','northeast')
        box on
        
        sgtitle('RECOMMENDED REGEN POWER MAP');
        linkaxes(sp_Regen,'x')
%     
% % ============================================================================================
%% PLOT EXCESSIVE DISCHARGE SIMULATION OUTPUTS
H_Xdchg = figure('position',fig_pos_Xdchg);
H_Xdchg_subplots = 7;
        
    sp_Xdchg(1) = subplot(H_Xdchg_subplots,1,1);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        yyaxis left
            plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.shunt(xlim_Xdchg_start:xlim_Xdchg_stop),'-k','LineWidth',1,'DisplayName','shunt')
            plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.Xdchg_limit(xlim_Xdchg_start:xlim_Xdchg_stop),'--r','LineWidth',1,'DisplayName','regen limit')
            %yline(-180,'--r','DisplayName','abs max A')
            ax = gca; ax.YColor = 'k';
            ylabel('amps'); 
            ylim([-750 10])
        yyaxis right
            plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.cell_temp(xlim_Xdchg_start:xlim_Xdchg_stop),'-.g','LineWidth',1,'DisplayName','cellT')
            ax = gca; ax.YColor = 'g';
            ylabel('degC')
        grid minor
        xlabel('seconds'); 
        title('Excessive Loading Test Current')
        legend('show','Location','northeast')
        box on

    sp_Xdchg(2) = subplot(H_Xdchg_subplots,1,2);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        yyaxis left; 
            plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.Xdchg_enum(xlim_Xdchg_start:xlim_Xdchg_stop),'-k','LineWidth',1,'DisplayName','Xdcgh level'); 
            ylim([-1 4])
            ylabel('Xamps enum');
            ax = gca; ax.YColor = 'k';
        yyaxis right; 
            plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.Xdchg_diag_level(xlim_Xdchg_start:xlim_Xdchg_stop),'-.r','LineWidth',1,'DisplayName','diag level');
            ylim([-1 10])
            ylabel('diag enum'); ylim([-0.25 10])
            ax = gca; ax.YColor = 'r'; 
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Excessive Amps State & Diagnostic enumerations')
        subtitle('(0-0 no violations // 1-4 ALARM (0 sec) violation // 2-5 FAULT (1 sec) violation // 3-7 PROTECT (full dur) violation)')
        legend('show','Location','west')
        box on

    sp_Xdchg(3) = subplot(H_Xdchg_subplots,1,3);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.Xdchg_alarm_events(xlim_Xdchg_start:xlim_Xdchg_stop),'-k','LineWidth',1,'DisplayName','alarm ev cnt'); 
        ylabel('% soc'); ylim([0.25 15])
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Number of Excessive Discharge ALARM events')
        legend('show','Location','northeast')
        box on
             
    sp_Xdchg(4) = subplot(H_Xdchg_subplots,1,4); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.Xdchg_fault_events(xlim_Xdchg_start:xlim_Xdchg_stop),'-k','LineWidth',1,'DisplayName','fault ev cnt'); 
        ylabel('% soc'); ylim([-10 110])
        ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--m','LineWidth',1,'DisplayName','cc cap dfloat'); 
        ylabel('count'); ylim([-0.25 10]); %ylim([ylim_min_cap ylim_max_cap]); 
        %ax = gca; ax.YColor = 'm'; 
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Number of 1 second Excessive Loading Violation events')
        legend('show','Location','northeast')
        box on
%       
    sp_Xdchg(5) = subplot(H_Xdchg_subplots,1,5); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.Xdchg_protect_events(xlim_Xdchg_start:xlim_Xdchg_stop),'-k','LineWidth',1,'DisplayName','protect ev cnt');  
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
        legend('show','Location','west')
        box on

    sp_Xdchg(6) = subplot(H_Xdchg_subplots,1,6); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.Xdchg_timer(xlim_Xdchg_start:xlim_Xdchg_stop),'-k','LineWidth',1,'DisplayName','viol dur tmr'); 
        plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.Xdchg_duration_limit(xlim_Xdchg_start:xlim_Xdchg_stop),':r','LineWidth',1,'DisplayName','dur limit');
        %yline(3000,'--r','LineWidth',2,'DisplayName','dur max')
        %xline(trans(1,1),':r','LineWidth',1,'DisplayName','Dchg2Relax');
        ylabel('msec');  ylim([-500 3200])
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

     sp_Xdchg(7) = subplot(H_Xdchg_subplots,1,7);
        hold on
        yyaxis left; 
            plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.Xdchg_peakamps_at_fault(xlim_Xdchg_start:xlim_Xdchg_stop),'-k','LineWidth',1,'DisplayName','peak fault A'); 
            ylabel('Amperage (A)'); ylim([-10 500])
            ax = gca; ax.YColor = 'k';

        yyaxis right; 
            plot(SimResults.tout(xlim_Xdchg_start:xlim_Xdchg_stop),SimResults.Xdchg_peakamps_at_protect(xlim_Xdchg_start:xlim_Xdchg_stop),'-.r','LineWidth',2,'DisplayName','peak protect A');
            ax = gca; ax.YColor = 'r'; ylabel('Amperage (A)'); ylim([-100 1700])
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Peak Current at Excessive Amps Fault and Protect Events')
        legend('show','Location','west')
        box on
        %xlim([xlim_Xstart xlim_Xstop])                 
        sgtitle('EXCESSIVE DISCHARGE CURRENT MONITORING, DIAGNOSTICS & METRICS');
        linkaxes(sp_Xdchg,'x')

% % ============================================================================================
%% PLOT EXCESSIVE REGEN SIMULATION OUTPUTS
H_Xregen = figure('position',fig_pos_Xregen);
H_Xregen_subplots = 7;
        
    sp_Xregen(1) = subplot(H_Xregen_subplots,1,1);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        yyaxis left;
            plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.shunt(xlim_Xregen_start:xlim_Xregen_stop),'-k','LineWidth',1,'DisplayName','shunt')
            plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.Xregen_limit(xlim_Xregen_start:xlim_Xregen_stop),'--r','LineWidth',1,'DisplayName','Xregen limit')
            %yline(-180,'--r','DisplayName','abs max A')
            ax = gca; ax.YColor = 'k';
            ylabel('amps'); 
            ylim([-10 120])
        yyaxis right
            plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.cell_temp(xlim_Xregen_start:xlim_Xregen_stop),'-.g','LineWidth',1,'DisplayName','cellT')
            ax = gca; ax.YColor = 'g';
            ylabel('degC')
        grid minor
        xlabel('seconds'); 
        title('Excessive Regen Current')
        legend('show','Location','northeast')
        box on

    sp_Xregen(2) = subplot(H_Xregen_subplots,1,2);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        yyaxis left; 
            plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.Xregen_enum(xlim_Xregen_start:xlim_Xregen_stop),'-k','LineWidth',1,'DisplayName','Xregen state'); 
            ax = gca; ax.YColor = 'k';
            ylabel('Xregen enum');ylim([-1 4])
        yyaxis right; 
            plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.Xregen_diag_level(xlim_Xregen_start:xlim_Xregen_stop),'-.r','LineWidth',1,'DisplayName','diag level');
            ax = gca; ax.YColor = 'r'; 
            ylabel('diag enum'); ylim([-0.25 10])
        grid minor
        xlabel('seconds'); %xlim([xlim_Xregen_start xlim_Xregen_stop])
        title('Excessive Regen State & Diagnostic enumerations')
        subtitle('(0-0 no violations // 1-4 ALARM (0 sec) violation // 2-5 FAULT (1 sec) violation // 3-7 PROTECT (full dur) violation)')
        legend('show','Location','west')
        box on

    sp_Xregen(3) = subplot(H_Xregen_subplots,1,3);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.Xregen_alarm_events(xlim_Xregen_start:xlim_Xregen_stop),'-k','LineWidth',1,'DisplayName','alarm ev cnt'); 
        ylabel('count'); ylim([-0.25 10])
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Number of Excessive Regen Current ALARM events')
        legend('show','Location','southeast')
        box on
             
    sp_Xregen(4) = subplot(H_Xregen_subplots,1,4); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.Xregen_fault_events(xlim_Xregen_start:xlim_Xregen_stop),'-k','LineWidth',1,'DisplayName','fault ev cnt'); 
        ax = gca; ax.YColor = 'k';
        ylabel('count'); ylim([-0.25 10])
        %yyaxis right; 
        %plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--m','LineWidth',1,'DisplayName','cc cap dfloat'); 
        %ylabel('count'); ylim([-0.25 6.25]); %ylim([ylim_min_cap ylim_max_cap]); 
        %ax = gca; ax.YColor = 'm'; 
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Number of Excessive Regen Current FAULT events')
        legend('show','Location','southeast')
        box on
%       
    sp_Xregen(5) = subplot(H_Xregen_subplots,1,5); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.Xregen_protect_events(xlim_Xregen_start:xlim_Xregen_stop),'-k','LineWidth',1,'DisplayName','protect ev cnt');  
        %yline(3000,'--r','LineWidth',2,'DisplayName','dur max')
        %xline(trans(1,1),':r','LineWidth',1,'DisplayName','Dchg2Relax');
        ylabel('count');  ylim([-0.25 10])
        %ax = gca; ax.YColor = 'k';
        %yyaxis right; 
        %plot(SimResults.rpt_cap_now_mAh_dfloat,'--m','LineWidth',1,'DisplayName','rpt cap mAh dfloat');
        %ylabel('mAh'); ylim([ylim_min_cap ylim_max_cap])
        %ax = gca; ax.YColor = 'm';
        grid minor
        xlabel('seconds'); %xlim([xlim_Xload_start xlim_Xload_stop])
        title('Number of Excessive Regen PROTECT events')
        legend('show','Location','west')
        box on

    sp_Xregen(6) = subplot(H_Xregen_subplots,1,6); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        %yyaxis left; 
        plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.Xregen_timer(xlim_Xregen_start:xlim_Xregen_stop),'-k','LineWidth',1,'DisplayName','viol dur tmr'); 
        plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.Xregen_duration_limit(xlim_Xregen_start:xlim_Xregen_stop),':r','LineWidth',1,'DisplayName','dur limit');
        %yline(3000,'--r','LineWidth',2,'DisplayName','dur max')
        %xline(trans(1,1),':r','LineWidth',1,'DisplayName','Dchg2Relax');
        ylabel('msec');  ylim([-3000 65000])
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

     sp_Xregen(7) = subplot(H_Xregen_subplots,1,7);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        hold on
        yyaxis left; 
            plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.Xregen_peakamps_at_fault(xlim_Xregen_start:xlim_Xregen_stop),'-k','LineWidth',1,'DisplayName','peak fault A'); 
            ax = gca; ax.YColor = 'k';
            ylabel('Amperage (A)'); ylim([-10 120])

        yyaxis right; 
            plot(SimResults.tout(xlim_Xregen_start:xlim_Xregen_stop),SimResults.Xregen_peakamps_at_protect(xlim_Xregen_start:xlim_Xregen_stop),'-.r','LineWidth',2,'DisplayName','peak protect A');
            ax = gca; ax.YColor = 'r'; 
            ylabel('Amperage (A)'); ylim([-10 120])
        grid minor
        xlabel('seconds'); %xlim([xlim_Xregen_start xlim_Xregen_stop])
        str1 = "duration limit to trip fault = 200 ms";
        str2 = "green arrows and text boxes mean PASS criteria";
        str3 = "red arrows and text boxes mean FAIL criteria";
        str = str1 + newline + str2 + newline + str3;
        annotation('textbox','String',str,'BackgroundColor','w','Position',[0.01 0.8 0.2 0.2],'FitBoxToText','on')
        title('Peak Current at Excessive Regen Amps Fault and Protect Events')
        legend('show','Location','west')
        box on
              
        str_a = "state enum - diag level enum LEGEND";
        str_b = "0 - 0 means no violation";
        str_c = "1 - 1 means > amps thresh; trip ALARM";
        str_d = "2 - 4 means condition > fault duration thresh; trip FAULT";
        str_e = "3 - 7 means condition > protect duration thresh; trip PROTECT";
        str_A = str_a + newline + str_b + newline + str_c + newline + str_d + newline + str_e;
        annotation('textbox','String',str_A,'BackgroundColor','w','FontSize',8,'Position',[0.75 0.8 0.2 0.2],'FitBoxToText','on')
        sgtitle('EXCESSIVE REGEN CURRENT MONITORING, DIAGNOSTICS & METRICS');
        linkaxes(sp_Xregen,'x')
end