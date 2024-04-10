%close all

fig_pos_H = [1600,1200,1200,850];  % [1500,1500,700,600];1500
fig_pos_H1 = [1500,1200,1500,800];  % [1800,900,1400,1200];
fig_pos_H2 = [1700,1250,1500,800];  % [2300,1000,1400,1200];

build_table = 0;
skip_plots = 1;

    % get new figure position after positioning plot(optional>>>> comment out when executing!)
         %fig_pos_H = get(H,'Position');
%         fig_pos_H1 = get(H1,'Position');
%         fig_pos_H2 = get(H2,'Position');

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
        ylim_min_mode = 0.75;
        ylim_max_mode = 3.25;

        min_cap = min(test_pack_cap_mAh); max_cap = max(test_pack_cap_mAh);
        ylim_min_cap = 0 - 0.25*max_cap; ylim_max_cap = max_cap + 0.25*max_cap;

        min_shunt = min(test_shunt_mA); max_shunt = max(test_shunt_mA);
        ylim_min_shunt = min_shunt + 0.25*min_shunt; ylim_max_shunt = max_shunt + 0.25*max_shunt;

        min_dcap = min(test_dCap_mAh); max_dcap = max(test_dCap_mAh);
        ylim_min_dcap = min_dcap + 0.25*min_dcap; ylim_max_dcap = max_dcap + 0.25*max_dcap;
    
        %min_error = min(error); ylim_min_error = min_error + 0.25*min_error;
        %max_error = max(error); ylim_max_error = max_error + 0.25*max_error; 

        min_rex_ctr_ms = min(sim_rex_ctr_ms); max_rex_ctr_ms = max(sim_rex_ctr_ms);
        ylim_min_ctr_ms = -10; ylim_max_ctr_ms = max_rex_ctr_ms + 200;

        xlim_min = 0; xlim_max = length(time_index);

   % Set Chart Description strings that describe Function, Test Case, Iteration and other test case and iteration settings
        descr_str = 'P42A Cells w/ live input signals';
        tc_descr_str = 'pack cals';
        if tc_iter_current == 01
            iter_descr_str = '1p1s MOLiCel P42A';
        elseif tc_iter_current == 02
            iter_descr_str = '7p14s MOLiCel P42A';
        elseif tc_iter_current == 03
            iter_descr_str = '900s delay';
        elseif tc_iter_current == 04
            iter_descr_str = '900s delay';
        elseif tc_iter_current == 05
            iter_descr_str = '3000s delay';
        elseif tc_iter_current == 06
            iter_descr_str = '900s delay';
        end
        chart_title_str = [app_test_str space_str functional_component_str open_parenth_str descr_str closed_parenth_str fwd_slash_str...
            tc_str tc_num_str open_parenth_str tc_descr_str closed_parenth_str fwd_slash_str...
            tc_iter_str tc_iter_num_str open_parenth_str iter_descr_str closed_parenth_str];

H = figure('position',fig_pos_H);

    num_subplots = 7;

     sp(1) = subplot(num_subplots,1,1);
        hold on
        plot(test_pack_cap_mAh,'-g','LineWidth',1,'DisplayName','ref pack cap')
        ylim([ylim_min_cap ylim_max_cap])
        ylabel('mAh') 
        xlim([xlim_min xlim_max])
        grid minor
        title('Ref Reported Capacity (starts execution cycle with this value!)')
        legend('show','Location','northeast')
        box on
        
    sp(2) = subplot(num_subplots,1,2);
        hold on
        plot(test_shunt_mA,'-k','LineWidth',1,'DisplayName','ref shunt')
        ylim([ylim_min_shunt ylim_max_shunt])
        ylabel('mA')
        xlim([xlim_min xlim_max])
        grid minor
        title('Shunt Current')
        legend('show','Location','northeast')
        box on
    
    sp(3) = subplot(num_subplots,1,3);
        plot(test_dCap_mAh,'-k','LineWidth',1,'DisplayName','AFEs dcap')
        ylim([ylim_min_dcap ylim_max_dcap])
        ylabel('mAh')
        xlim([xlim_min xlim_max])
        grid minor
        title('AFE delta capacity')
        legend('show','Location','northeast')
        box on

    sp(4) = subplot(num_subplots,1,4);
        plot(SimResults.cc_pcap_mAh_fxp2flp,'-k','LineWidth',1,'DisplayName','cc pcap')
        ylim([ylim_min_cap ylim_max_cap])
        ylabel('mAh')
        xlim([xlim_min xlim_max])
        grid minor
        title('Model: CC Capacity (ends the execution cycle with this value)')
        legend('show','Location','northeast')
        box on

    sp(5) = subplot(num_subplots,1,5);
        plot(SimResults.rex_pcap_mAh_fxp2flp,'-b','LineWidth',1,'DisplayName','rex pcap')
        ylim([ylim_min_cap ylim_max_cap])
        ylabel('mAh')
        xlim([xlim_min xlim_max])
        grid minor
        title('Model: Relaxed Capacity (ends the execution cycle with this value)')
        legend('show','Location','northeast')
        box on

    sp(6) = subplot(num_subplots,1,6);
        plot(SimResults.reported_remaining_pcap_now_fxp2flp,'-b','LineWidth',1,'DisplayName','rptd pcap')
        ylim([ylim_min_cap ylim_max_cap])
        ylabel('mAh')
        xlim([xlim_min xlim_max])
        grid minor
        title('Model: Reported Capacity (ends the execution cycle with this value)')
        legend('show','Location','northeast')
        box on

%     sp(7) = subplot(num_subplots,1,7);
%         plot(error,'-r','LineWidth',1,'DisplayName','rptd pcap')
%         ylim([ylim_min_error ylim_max_error])
%         ylabel('mAh')
%         xlim([xlim_min xlim_max])
%         grid minor
%         title('Ref-to-Model Error)')
%         legend('show','Location','northeast')
%         box on

    sp(7) = subplot(num_subplots,1,7);
        yyaxis left
            hold on
            plot(test_pack_cap_now_mAh,'--b','LineWidth',1,'DisplayName','ref rptd pcap')
            plot(sim_pcap_now_mAh_fxp2flp,'-k','LineWidth',1,'DisplayName','sim rptd pcap')
            ylim([ylim_min_cap ylim_max_cap])
            ylabel('mAh')
            ax = gca(); ax.YColor = 'k';
            xlim([xlim_min xlim_max])
            cal_name_01 = 'cal relaxing delay ms'; cal_value_01_str = num2str(cal_relaxing_delay_ms);
                cal_str = [cal_name_01 equals_str cal_value_01_str];
                textbox_dim = [0.22 0.05 0.2 0.2];   % location_of_box_lower_left_corner_on_axis_wrt_%chartwidth location_of_lower_left _corner_on_yaxis_wrt_%chartwidth]
                annotation('textbox', textbox_dim,'String', cal_name_01, 'String', cal_str, 'FitBoxToText','on');
            title('Reference Reported Capacity')

        yyaxis right
            plot(sim_rex_ctr_ms,'-m','LineWidth',1,'DisplayName','rex dly ctr')
            ylim([ylim_min_ctr_ms ylim_max_ctr_ms])
            ylabel('time (msec)')
            ax = gca(); ax.YColor = 'm';
            xlim([xlim_min xlim_max])
            grid minor
            title('Relaxation Duration Timer')

        legend('show','Location','northeast')
        box on

%     sp(5) = subplot(num_subplots,1,5);
%         yyaxis left
%             plot(ref_cellVIN_mV_dfloat,'-k','LineWidth',1,'DisplayName','ref dcap dfloat');
%             ylim([ylim_min_cellV ylim_max_cellV])
%             ylabel('mAh'); 
%             ax = gca();
%             ax.YColor = 'k';
%         yyaxis right
%             plot(sim_rex_pack_cap_mAh_dfloat,'--m','LineWidth',1,'DisplayName','sim dcap dfloat')
%             ylim([ylim_min_cellV ylim_max_cellV])
%             ylabel('mAh');
%             ax = gca();
%             ax.YColor = 'm';
%         xlim([xlim_min xlim_max])
%         grid minor
%         title('Overlay comparison Ref INPUT to model OUTPUT')

    sgt = sgtitle({chart_title_str,testsignal_str});

    linkaxes(sp,'x')
end

    % Custom Debug Plot
%         figure('position',fig_pos_H)
%         subplot(3,1,1)
%         hold on
%         plot(test_pack_cap_mAh,'--g')
%         plot(sim_dcapOUT_mAh_dfloat,'-k')
%         grid minor
%         ylabel('mAh')
%         title('Reference Capacity (actual) vs. Model prev Capacity Estimate')
%         subplot(3,1,2)
%         plot(error2ref_mAh,'r')
%         an_pos = [0.7 0.3 0.3 0.3];
%         pos_str = 'positive difference: estimated lags actual';
%         neg_str = 'negative difference: estimated leads actual';
%         descr1_str = [pos_str newline neg_str];
%         annotation('textbox',an_pos,'String',descr1_str,'FitBoxToText','on')
%         ylabel('mAh')
%         grid minor
%         title('Difference between Ref (actual) and Model estimate (prev)')
%         subplot(3,1,3)
%         plot(error_fxp_uAh,'r')
%         ylabel('µAh')
%         grid minor
%         title('Fixed point error ')
    
% H1 = figure('position',fig_pos_H1);
%         
%     sp1(1) = subplot(4,1,1);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yline(511,':k','DisplayName','center')
%         yyaxis left; 
%         plot(SimResults.cc_cap_prev_mAh_dfloat,'-k','LineWidth',1,'DisplayName','Pcap prev dfloat')
%         %plot(SimResults.cc_cap_now_mAh_dfloat,'--c','LineWidth',0.5,'DisplayName','Pcap now dfloat')
%         yline(0,':k','DisplayName','0A ref')
%         ylabel('Capacity prev (mAh)'); ylim([ylim_min_cap ylim_max_cap])
%         ax = gca;
%         ax.YColor = 'k';
%         yyaxis right; 
%         plot(SimResults.cc_cap_prev_uAh_uint32,'--c','LineWidth',1,'DisplayName','Pcap now uint32')
%         %plot(SimResults.cc_cap_now_mAh_simout - 100 ,'-b','LineWidth',2,'DisplayName','Pcap now simout')
%         yline(0,':b','DisplayName','0A ref')
% %         yline(cal_Relaxing_pos_thresh_mA,'--r','DisplayName','pos relax thresh')
% %         yline(cal_Relaxing_neg_thresh_mA,'--b','DisplayName','neg relax thres')
%         ylabel('Capacity now (µAh)'); ylim([ylim_min_cap*scaler1 ylim_max_cap*scaler1])
%         ax = gca;
%         ax.YColor = 'b';
%         grid minor
%         xlabel('seconds'); xlim([xlim_min xlim_max])
%         title('Pack Capacity mAh')
%         legend('show','Location','northeast')
%         box on
% 
%     sp1(2) = subplot(4,1,2);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yline(511,':k','DisplayName','center')
%         yyaxis left; 
%         plot(SimResults.dCap_mAh_dfloat,'-k','LineWidth',1,'DisplayName','dCap mAh dfloat')
%         yline(0,':k','DisplayName','0A ref')
%         ylabel('dCap prev (mAh)'); ylim([ylim_min_dcap ylim_max_dcap])
%         ax = gca;
%         ax.YColor = 'k';
%         yyaxis right; 
%         plot(SimResults.dCap_uAh_int32,'--c','LineWidth',1,'DisplayName','dCap mAh int32')
%         yline(0,':b','DisplayName','0A ref')
% %         yline(cal_Relaxing_pos_thresh_mA,'--r','DisplayName','pos relax thresh')
% %         yline(cal_Relaxing_neg_thresh_mA,'--b','DisplayName','neg relax thres')
%         ylabel('dCap now (µAh)'); ylim([ylim_min_dcap*scaler1 ylim_max_dcap*scaler1])
%         ax = gca;
%         ax.YColor = 'b';
%         grid minor
%         xlabel('seconds'); xlim([xlim_min xlim_max])
%         title('AFE coulomb counter signal')
%         legend('show','Location','northeast')
%         box on
% 
%     sp1(3) = subplot(4,1,3); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         yyaxis left; 
%         plot(SimResults.cc_cap_now_mAh_dfloat_flp_calc,'-k','LineWidth',1,'DisplayName','Cap now mAh dfloat flp calc'); 
%         plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--g','LineWidth',1,'DisplayName','Cap now mAh dfloat fxp calc'); 
%         ylabel('Capacity (mAh)'); ylim([ylim_min_cap ylim_max_cap])
%         ax = gca;
%         ax.YColor = 'k';
%         % calc the rounding error: DO NOT COMPARE "NOW" AGAINST PREVIOUS, as this result is precisely the dCap signal
%         % compare a full floating-point calc of Cap now against the fixed-point calc of same (see Test Harness model)
%         yyaxis right; plot(SimResults.Cap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->uint32 error')
%         ylabel('rounding error'); ylim([-0.001 5]);%ylim([-40 40])
%         xlabel('seconds'); xlim([xlim_min xlim_max])
%         ax = gca;
%         ax.YColor = 'r';
%         grid minor
%         title('Pack Capacity mAh and est roudning error')
%         legend('show','Location','northeast')
%         box on
% 
%     sp1(4) = subplot(4,1,4); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         yyaxis left; 
%         plot(SimResults.dCap_mAh_dfloat,'-k','LineWidth',1,'DisplayName','dCap mAh dfloat'); %plot(SimResults.dCap_mAh_dfloat(500),'or')
%         plot(SimResults.dCap_uAh_int32/scaler1,'--g','LineWidth',1,'DisplayName','dCap mAh int32'); %plot(SimResults.dCap_uAh_int32(500)/scaler1,'om')
%         ylabel('delta Capacity (mAh)'); ylim([ylim_min_dcap ylim_max_dcap])
%         ax = gca;
%         ax.YColor = 'k';
%         % calc the rounding error
%         %dCap_error_rounding = SimResults.dCap_mAh_dfloat - (double(SimResults.dCap_uAh_int32)/scaler1);
%         yyaxis right; 
%         plot(SimResults.dCap_error_rounding,'-r','LineWidth',0.5,'DisplayName','float->int32 error'); %plot(dCap_error_rounding(500),'or')
%         ylabel('rounding error'); ylim([-0.001 0.002]); %ylim([-30*cal_fpgain_2 30*scaler1])
%         xlabel('seconds'); xlim([xlim_min xlim_max])
%         ax = gca;
%         ax.YColor = 'r';
%         grid minor
%         title('delta Capacity mAh with estimated rounding error')
%         legend('show','Location','northeast')
%         box on
% 
%         linkaxes(sp1,'x')
%     
% % ============================================================================================
% % ============================================================================================
% 
% H2 = figure('position',fig_pos_H2);
%         
%     sp2(1) = subplot(5,1,1);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(SimResults.mode,'-k','LineWidth',1,'DisplayName','mode')
%         yline(2,':b','DisplayName','Relax Ref')
%         ylabel('Mode'); ylim([-1 4])
%         ax = gca;
%         ax.YColor = 'k';
%         annotation('textbox', [0.45, 0.78, 0.1, 0.1], 'String', "1 = discharging, 2 = relaxing, 3 = charging")
% %         yyaxis right; 
% %         plot(SimResults.Capacity_prev_mAh_uint32,'--c','LineWidth',1,'DisplayName','Pcap now uint32')
% %         %plot(SimResults.Capacity_now_mAh_simout - 100 ,'-b','LineWidth',2,'DisplayName','Pcap now simout')
% %         yline(0,':b','DisplayName','0A ref')
% % %         yline(cal_Relaxing_pos_thresh_mA,'--r','DisplayName','pos relax thresh')
% % %         yline(cal_Relaxing_neg_thresh_mA,'--b','DisplayName','neg relax thres')
% %         ylabel('Capacity OUT (µAh)'); ylim([-1000*cal_gain1 3000*cal_gain1])
% %         ax = gca;
% %         ax.YColor = 'b';
%         grid minor
%         xlabel('seconds'); xlim([xlim_min xlim_max])
%         title('Mode')
%         legend('show','Location','northeast')
%         box on
% 
%     sp2(2) = subplot(5,1,2);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(SimResults.shunt_mA_dfloat,'-k','LineWidth',1,'DisplayName','shunt mA dfloat'); 
%         yline(0,':b','DisplayName','0A Ref')
%         yline(cal_Relaxing_pos_thresh_mA,':b','LineWidth',1,'DisplayName','pos thresh')
%         yline(cal_Relaxing_neg_thresh_mA,':b','LineWidth',1,'DisplayName','neg thresh')
%         ylabel('Amperes (mA)'); ylim([ylim_min_shunt ylim_max_shunt])
%         ax = gca;
%         ax.YColor = 'k';
%         yyaxis right; plot(SimResults.cell_V_dfloat,'-r','LineWidth',0.5,'DisplayName','cellV dfloat'); 
%         ylabel('Voltage (mV)'); %ylim([-10 10])
%         ax = gca; 
%         ax.YColor = 'r'; 
%         grid minor
%         xlabel('seconds'); xlim([xlim_min xlim_max])
%         title('Current IN/OUT')
%         legend('show','Location','northeast')
%         box on
% 
%     sp2(3) = subplot(5,1,3);  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         %yyaxis left; 
%         plot(SimResults.rex_soc_dfloat,'-k','LineWidth',1,'DisplayName','rex soc dfloat'); 
%         ylabel('% soc'); ylim([-10 110])
%         ax = gca;
%         ax.YColor = 'k';
%         yyaxis right; 
%         plot(SimResults.rex_cap_mAh_dfloat,'--m','LineWidth',1,'DisplayName','cap mAh dfloat'); 
%         ylabel('mAh'); %ylim([-10 10])
%         ax = gca; ax.YColor = 'm';
%         plot(SimResults.PackCap_previous_mAh,'-r','DisplayName','Cap prev mAh');
%         grid minor
%         xlabel('seconds'); xlim([xlim_min xlim_max])
%         title('Relaxing SoC & Capacity')
%         legend('show','Location','northeast')
%         box on
%              
%     sp2(4) = subplot(5,1,4); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         yyaxis left; 
%         plot(SimResults.cc_soc_now_mper_dfloat,'-k','LineWidth',1,'DisplayName','cc soc dfloat'); 
%         ylabel('% soc'); ylim([-10 110])
%         ax = gca;
%         ax.YColor = 'k';
%         yyaxis right; 
%         plot(SimResults.cc_cap_now_mAh_dfloat_fxp_calc,'--m','LineWidth',1,'DisplayName','cc cap dfloat'); 
%         ylabel('mAh'); ylim([ylim_min_cap ylim_max_cap]); 
%         ax = gca; 
%         ax.YColor = 'm'; 
%         grid minor
%         xlabel('seconds'); xlim([xlim_min xlim_max])
%         title('Coulomb Counting SoC & Capacity')
%         legend('show','Location','northeast')
%         box on
% %         
%     sp2(5) = subplot(5,1,5); % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%         hold on
%         yyaxis left; 
%         plot(SimResults.rpt_soc_now_percent_dfloat,'-k','LineWidth',1,'DisplayName','rpt soc % dfloat');  
%         %xline(trans(1,1),':r','LineWidth',1,'DisplayName','Dchg2Relax');
%         ylabel('% soc');  ylim([-10 110])
%         ax = gca;
%         ax.YColor = 'k';
%         yyaxis right; 
%         plot(SimResults.rpt_cap_now_mAh_dfloat,'--m','LineWidth',1,'DisplayName','rpt cap mAh dfloat');
%         ylabel('mAh'); ylim([ylim_min_cap ylim_max_cap])
%         ax = gca; 
%         ax.YColor = 'm';
%         grid minor
%         xlabel('seconds'); xlim([xlim_min xlim_max])
%         title('Reported State-of-Charge & Pack Capacity')
%         legend('show','Location','northeast')
%         box on
% % 
% %         sp(6) = subplot(6,1,6);
% %         hold on
% %         yyaxis left; 
% %         plot(SimResults.PackCapacity_prev_mAh_dfloat,'-k','LineWidth',2,'DisplayName','Pcap mAh dfloat'); 
% %         ylabel('Capacity (mAh)'); ylim([-1500 0])
% %         ax = gca;
% %         ax.YColor = 'k';
% %         yyaxis right; 
% %         plot(SimResults.PackCapacity_prev_mAh_shifted_1e6_int32,'--m','LineWidth',0.5,'DisplayName','Pcao mAh 1e6 int32'); ylabel(''); ax = gca; ax.YColor = 'm'; %ylim([-10 10])
% %         %plot(SimResults.PackCap_previous_mAh,'-r','DisplayName','Cap prev mAh');
% %         grid minor
% %         xlabel('loop count (count x30 seconds)'); xlim([0 1800])
% %         title('Pack Capacity')
% %         legend('show','Location','northeast')
% %         box on
%                          
%         sgtitle('1st CodeGen SoC calc');
%         linkaxes(sp2,'x')
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