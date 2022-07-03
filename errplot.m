
Err = [2082.682441 380.582232 83.434528 18.445270]';
del_x = [1/160 1/80 1/40 1/20]';
logerr = log10(Err);
logdel = log10(del_x);

figure(5)
plot(logerr , logdel ,'-b*', 'linewidth' , 2)
xlabel('LOG (\Deltax)')
ylabel('LOG (||error||/||u_{exact}||)')
set(gca,'FontName','Times New Roman','FontSize',10,'fontWeight','bold');
grid on