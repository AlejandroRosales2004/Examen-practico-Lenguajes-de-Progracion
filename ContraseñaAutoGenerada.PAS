program ContrasenaAutoGenerada;
uses
  Crt;

var
  longitud, i, idx: integer;
  respuesta: char;
  incluirMayusculas, incluirNumeros, incluirSimbolos: boolean;
  conjuntoCaracteres: string;
  contrasena: string;
  minusculas, mayusculas, numeros, simbolos: string;

begin
  ClrScr;
  
  { Inicializar conjuntos de caracteres }
  minusculas := 'abcdefghijklmnopqrstuvwxyz';
  mayusculas := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  numeros := '0123456789';
  simbolos := '!@#$%^&*()-_=+[]{}|;:,.<>?';

  { Solicitar longitud (solo 8 o 16) }
  repeat
    Writeln('Elige la longitud de la contrasenia (solo 8 o 16):');
    Readln(longitud);
    if (longitud <> 8) and (longitud <> 16) then
      Writeln('Longitud invalida. Solo puedes elegir 8 o 16.');
  until (longitud = 8) or (longitud = 16);

  { Preguntar por mayusculas }
  repeat
    Writeln('Incluir letras mayusculas? (s/n):');
    Readln(respuesta);
    respuesta := UpCase(respuesta);
    if (respuesta = 'S') then
      incluirMayusculas := true
    else if (respuesta = 'N') then
      incluirMayusculas := false
    else
      Writeln('Entrada invalida. Por favor ingrese s para si o n para no.');
  until (respuesta = 'S') or (respuesta = 'N');

  { Preguntar por numeros }
  repeat
    Writeln('Incluir numeros? (s/n):');
    Readln(respuesta);
    respuesta := UpCase(respuesta);
    if (respuesta = 'S') then
      incluirNumeros := true
    else if (respuesta = 'N') then
      incluirNumeros := false
    else
      Writeln('Entrada invalida. Por favor ingrese s para si o n para no.');
  until (respuesta = 'S') or (respuesta = 'N');

  { Preguntar por simbolos }
  repeat
    Writeln('Incluir simbolos? (s/n):');
    Readln(respuesta);
    respuesta := UpCase(respuesta);
    if (respuesta = 'S') then
      incluirSimbolos := true
    else if (respuesta = 'N') then
      incluirSimbolos := false
    else
      Writeln('Entrada invalida. Por favor ingrese s para si o n para no.');
  until (respuesta = 'S') or (respuesta = 'N');

  { Construir conjunto de caracteres }
  conjuntoCaracteres := minusculas;
  if incluirMayusculas then
    conjuntoCaracteres := conjuntoCaracteres + mayusculas;
  if incluirNumeros then
    conjuntoCaracteres := conjuntoCaracteres + numeros;
  if incluirSimbolos then
    conjuntoCaracteres := conjuntoCaracteres + simbolos;

  { Verificar si hay caracteres disponibles }
  if conjuntoCaracteres = '' then
  begin
    Writeln('Error: Debe seleccionar al menos un tipo de caracter.');
    Readln;
    Halt;
  end;

  { Inicializar generador de numeros aleatorios }
  Randomize;

  { Generar contrasenia }
  contrasena := '';
  for i := 1 to longitud do
  begin
    idx := Random(Length(conjuntoCaracteres)) + 1;
    contrasena := contrasena + conjuntoCaracteres[idx];
  end;

  Writeln;
  Writeln('Contrasenia generada: ', contrasena);
  Writeln;
  Writeln('Presiona Enter para salir...');
  Readln;
end.