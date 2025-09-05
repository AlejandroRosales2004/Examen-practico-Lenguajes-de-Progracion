      program CronometroLimitado
      implicit none
      integer horas, minutos, segundos, limiteSegundos, i
      real*8 startTime, currentTime

      horas = 0
      minutos = 0
      segundos = 0
      limiteSegundos = 100

      do i = 1, limiteSegundos
          write(*, 10) horas, minutos, segundos
10        format(I2.2, ':', I2.2, ':', I2.2)

          call cpu_time(startTime)
          do while (.true.)
              call cpu_time(currentTime)
              if (currentTime - startTime .ge. 1.0) exit
          end do

          segundos = segundos + 1
          if (segundos .eq. 60) then
              segundos = 0
              minutos = minutos + 1
          endif
          if (minutos .eq. 60) then
              minutos = 0
              horas = horas + 1
          endif
      end do

      print *, 'Tiempo completado!'
      end program
