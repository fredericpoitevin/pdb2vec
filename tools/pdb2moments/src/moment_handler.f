c
        subroutine moments(x,Hn,nat)
c       
        include 'param.h'
c       
        integer im
        integer iat,iat1,iat2,nat
        integer k
        real*8 x(3*natmax),pwrrt
        real*8 diff,dist,dist2,Hn(mmax)
c
        do 50 im = 1,mmax
          Hn(im) = 0.d0
50      continue
c
        do 100 iat1 = 1,nat-1
          do 200 iat2 = iat1+1,nat
            dist = 0.d0
            do 300 k = 1,3
              diff = x(3*(iat1-1)+k)
     1             - x(3*(iat2-1)+k)
              dist = dist + diff**2
300         continue
c
            dist2 = dist
            do 400 im = 1,mmax
              Hn(im) = Hn(im) + dist2
              dist2 = dist2*dist
400         continue
c
200       continue
100     continue
c
        do 500 im = 1,mmax
          pwrrt = real(im)
          pwrrt = 1.d0/pwrrt
          pwrrt = pwrrt/2.d0
          Hn(im) = Hn(im)/(nat*nat)
          Hn(im) = Hn(im)**pwrrt
          if(im.gt.1) then
            Hn(im) = Hn(im)/Hn(1)
          endif
c          write(6,*) im,Hn(im)
500	continue
c       
        return
        end
c       
