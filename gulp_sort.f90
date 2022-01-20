program gulp_sort
implicit none
integer,parameter :: np=50,nbr=6,ufreq=10
integer :: ii,jj
real(8),allocatable :: qq(:),freq(:,:)

allocate(qq(3*np),freq(3*nq,nbr))

open(ufreq,file='si_sw.disp',status='old')





for ii=1:np
         qvec(ii,1)=8.886*(ii-1)/np
end
for ii=1:np
         qvec(ii+np,1)=8.886+6.2830*ii/np
end
for ii=1:np
         qvec(ii+2*np,1)=15.169+5.4410*ii/np
end
