c             
        subroutine readpdb_simple(fpdb,nat,ires,crd,lleft_s,lright)
c       this subroutine is simpler than readpdb
        include 'param.h'
c
        integer nat,i_read_ok,ires(natmax)
        real*8 crd(3*natmax)
        character fpdb*64,line*80
        character lleft_s(natmax)*22,lright(natmax)*24
c
1       format(a)
2       format(a22,i4,4x,3f8.3,a24)
3       format("READPDB> number of atoms  ",i6)
        nat=0
        open(unit=1,file=fpdb,status='unknown')
100       read(1,1,end=200) line
          i_read_ok=0
          if(line(1:4).eq."ATOM") i_read_ok = 1
          if(i_read_ok.eq.0) goto 100
          if(line(17:17).eq." ".or.line(17:17).eq."A") i_read_ok = 1
          if(i_read_ok.eq.0) goto 100
c          write(6,*) line
          nat = nat + 1
          read(line,2) lleft_s(nat),ires(nat),
     1      crd(3*(nat-1)+1),crd(3*(nat-1)+2),crd(3*(nat-1)+3),
     2      lright(nat)
          goto 100
200       continue
        close(unit=1)
c        write(6,3) nat
        write(6,'(i6)') nat
        return
        end 
