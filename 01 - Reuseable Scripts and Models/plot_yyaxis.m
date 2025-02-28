V = test.V;
I = test.I;

figure()
hold on
yyaxis left
    plot(I,'-r')
     ax = gca; ax.YColor = 'r';
     ylabel('Amps')

yyaxis right
    plot(V,'-b')
    ax = gca; ax.YColor = 'b';
    ylabel('Volts')
     
grid minor
title('automotive discharge profile')