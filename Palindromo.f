      program Palindromo
      implicit none
      character*100 texto, texto_limpio, texto_invertido
      integer i, j, longitud
      logical es_palindromo
      logical es_letra
      character a_minuscula

      write(*,*) 'Introduce el texto: '
      read(*,'(A)') texto

      texto_limpio = ''
      j = 1
      do 10 i = 1, len_trim(texto)
          if (es_letra(texto(i:i))) then
              texto_limpio(j:j) = a_minuscula(texto(i:i))
              j = j + 1
          endif
10    continue

      longitud = len_trim(texto_limpio)
      texto_invertido = ''
      do 20 i = 1, longitud
          texto_invertido(i:i) = texto_limpio(longitud-i+1:longitud-i+1)
20    continue

      es_palindromo = .true.
      do 30 i = 1, longitud
          if (texto_limpio(i:i) .ne. texto_invertido(i:i)) then
              es_palindromo = .false.
              goto 40
          endif
30    continue
40    continue

      if (es_palindromo) then
          write(*,*) '"', trim(texto), '" es un palindromo.'
      else
          write(*,*) '"', trim(texto), '" no es un palindromo.'
      endif

      print *, ' '
      print *, 'Presiona Enter para salir...'
      read(*,*)

      end


      logical function es_letra(c)
      character c
      es_letra = (c .ge. 'a' .and. c .le. 'z') .or.
     *           (c .ge. 'A' .and. c .le. 'Z')
      end


      character function a_minuscula(c)
      character c
      if (c .ge. 'A' .and. c .le. 'Z') then
          a_minuscula = char(ichar(c) + 32)
      else
          a_minuscula = c
      endif
      end
