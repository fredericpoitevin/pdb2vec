c
	include 'param.h'
c
        integer i      
        integer nat,ires(natmax)
        real*8 crd(3*natmax),Hn(mmax)
	character lleft_s(natmax)*22,lright(natmax)*24
	character*64 fpdb
c
	call getarg(1,fpdb)
        call readpdb_simple(fpdb,nat,ires,crd,lleft_s,lright)
	call moments(crd,Hn,nat)
c
        do 100 i = 1,mmax
c          write(6,'(i3,1x,f5.2)') i,Hn(i)
          write(6,'(f7.3)') Hn(i)
100     continue
c
	stop
	end
