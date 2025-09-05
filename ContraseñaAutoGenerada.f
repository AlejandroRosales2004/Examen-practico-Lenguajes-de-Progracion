      program ContrasenaAutoGenerada
      implicit none
      integer longitud, i, idx, seed_size
      character*32 respuesta
      logical incluirMayusculas, incluirNumeros, incluirSimbolos
      character*100 conjuntoCaracteres
      character*16 contrasena
      character*26 minusculas, mayusculas
      character*10 numeros
      character*20 simbolos
      integer, allocatable :: seed(:)
      real rnd

c     Inicializar conjuntos de caracteres
      minusculas = 'abcdefghijklmnopqrstuvwxyz'
      mayusculas = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      numeros = '0123456789'
      simbolos = '!@#$%^&*()-_=+[]{}|;:,.<>?'

c     Solicitar longitud (solo 8 o 16)
   10 continue
      print *, 'Elige la longitud de la contrasenia (solo 8 o 16):'
      read(*,*) longitud
      if (longitud .ne. 8 .and. longitud .ne. 16) then
          print *, 'Longitud invalida. Solo puedes elegir 8 o 16.'
          goto 10
      endif

c     Preguntar por mayúsculas
   20 continue
      print *, 'Incluir letras mayusculas? (s/n):'
      read(*,*) respuesta
      respuesta = adjustl(respuesta)
      if (respuesta(1:1) .eq. 's' .or.
     *    respuesta(1:1) .eq. 'S') then
          incluirMayusculas = .true.
      else if (respuesta(1:1) .eq. 'n' .or.
     *         respuesta(1:1) .eq. 'N') then
          incluirMayusculas = .false.
      else
          print *, 'Entrada invalida. Por favor ingrese s para si o n par
     *a no.'
          goto 20
      endif

c     Preguntar por numeros
   30 continue
      print *, 'Incluir numeros? (s/n):'
      read(*,*) respuesta
      respuesta = adjustl(respuesta)
      if (respuesta(1:1) .eq. 's' .or.
     *    respuesta(1:1) .eq. 'S') then
          incluirNumeros = .true.
      else if (respuesta(1:1) .eq. 'n' .or.
     *         respuesta(1:1) .eq. 'N') then
          incluirNumeros = .false.
      else
          print *, 'Entrada invalida. Por favor ingrese s para si o n par
     *a no.'
          goto 30
      endif

c     Preguntar por símbolos
   40 continue
      print *, 'Incluir simbolos? (s/n):'
      read(*,*) respuesta
      respuesta = adjustl(respuesta)
      if (respuesta(1:1) .eq. 's' .or.
     *    respuesta(1:1) .eq. 'S') then
          incluirSimbolos = .true.
      else if (respuesta(1:1) .eq. 'n' .or.
     *         respuesta(1:1) .eq. 'N') then
          incluirSimbolos = .false.
      else
          print *, 'Entrada invalida. Por favor ingrese s para si o n par
     *a no.'
          goto 40
      endif

c     Construir conjunto de caracteres
      conjuntoCaracteres = minusculas
      if (incluirMayusculas) then
          conjuntoCaracteres = trim(conjuntoCaracteres) // mayusculas
      endif
      if (incluirNumeros) then
          conjuntoCaracteres = trim(conjuntoCaracteres) // numeros
      endif
      if (incluirSimbolos) then
          conjuntoCaracteres = trim(conjuntoCaracteres) // simbolos
      endif

      if (len_trim(conjuntoCaracteres) .eq. 0) then
          print *, 'Error: Debe seleccionar al menos un tipo de caracter.
     *'
          stop
      endif

c     Inicializar generador de números aleatorios
      call random_seed(size=seed_size)
      allocate(seed(seed_size))
      call random_seed(put=seed)

c     Generar contraseña
      contrasena = ' '
      do 50 i = 1, longitud
          call random_number(rnd)
          idx = int(rnd * len_trim(conjuntoCaracteres)) + 1
          contrasena(i:i) = conjuntoCaracteres(idx:idx)
   50 continue
      print *, 'Contrasenia generada: ', trim(contrasena)

c     Pausa para ver el resultado
      print *, ' '
      print *, 'Presiona Enter para salir...'
      read(*,*)

      end program
