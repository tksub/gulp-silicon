clear all;clf
np=50;
nbr=6;
count=0;
tmp=load('si_tersoff.disp');
for en=1:3
for ii=1:np
for jj=1:nbr
count=count+1;
Si_Tersoff((en-1)*np+ii,jj)=tmp(count,2)*0.03;
end
end
end
count=0;
tmp=load('si_sw.disp');
for en=1:3
for ii=1:np
for jj=1:nbr
count=count+1;
Si_SW((en-1)*np+ii,jj)=tmp(count,2)*0.03;
end
end
end

for ii=1:np
	 qvec(ii,1)=8.886*(ii-1)/np;
end
for ii=1:np
	 qvec(ii+np,1)=8.886+6.2830*ii/np;
end
for ii=1:np
	 qvec(ii+2*np,1)=15.169+5.4410*ii/np;
end
Si_dfpt=load('Si.freq');
exp1=load('experiment_circ.txt');
exp2=load('experiment_plus.txt');



plot(qvec,Si_Tersoff(:,1),'b')
hold on
plot(qvec,Si_Tersoff(:,2),'b')
plot(qvec,Si_Tersoff(:,3),'b')
plot(qvec,Si_Tersoff(:,4),'b')
plot(qvec,Si_Tersoff(:,5),'b')
plot(qvec,Si_Tersoff(:,6),'b')

plot(qvec,Si_SW(:,1),'r')
plot(qvec,Si_SW(:,2),'r')
plot(qvec,Si_SW(:,3),'r')
plot(qvec,Si_SW(:,4),'r')
plot(qvec,Si_SW(:,5),'r')
plot(qvec,Si_SW(:,6),'r')

plot(Si_dfpt(:,2),Si_dfpt(:,6))
plot(Si_dfpt(:,2),Si_dfpt(:,7))
plot(Si_dfpt(:,2),Si_dfpt(:,8))
plot(Si_dfpt(:,2),Si_dfpt(:,9))
plot(Si_dfpt(:,2),Si_dfpt(:,10))
plot(Si_dfpt(:,2),Si_dfpt(:,11))
plot(exp1(:,1)*20.610,exp1(:,2)*0.03,'o')
plot(exp2(:,1)*20.610,exp2(:,2)*0.03,'+')


xlim([0 20.610])
ylim([0 20])
hold off

out(:,1)=qvec;
out(:,2:7)=Si_Tersoff(:,1:6);
save('res_Si_Tersoff.dat','-ascii','out')
clear out
out(:,1)=qvec;
out(:,2:7)=Si_SW(:,1:6);
save('res_Si_SW.dat','-ascii','out')
clear out
out(:,1)=Si_dfpt(:,2);
out(:,2:7)=Si_dfpt(:,6:11);
save('res_Si_dfpt.dat','-ascii','out')
clear out
out(:,1)=exp1(:,1)*20.610;
out(:,2)=exp1(:,2)*0.03;
save('res_Si_experiment_circ.dat','-ascii','out')
clear out
out(:,1)=exp2(:,1)*20.610;
out(:,2)=exp2(:,2)*0.03;
save('res_Si_experiment_plus.dat','-ascii','out')
