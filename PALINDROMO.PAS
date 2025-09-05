program Palindromo;
uses
  Crt;

var
  texto, textoLimpio, textoInvertido: string;
  i: integer;
  esPalindromo: boolean;
  c: char;

begin
  ClrScr;
  Write('Introduce el texto: ');
  Readln(texto);
  
  { Limpiar texto: eliminar caracteres no alfabeticos y convertir a minusculas }
  textoLimpio := '';
  for i := 1 to Length(texto) do
  begin
    c := texto[i];
    { Verificar si es letra }
    if (c in ['a'..'z']) or (c in ['A'..'Z']) then
    begin
      { Convertir a minuscula manualmente }
      if c in ['A'..'Z'] then
        c := Chr(Ord(c) + 32);  { ASCII: A=65, a=97 }
      textoLimpio := textoLimpio + c;
    end;
  end;
  
  { Invertir el texto }
  textoInvertido := '';
  for i := Length(textoLimpio) downto 1 do
  begin
    textoInvertido := textoInvertido + textoLimpio[i];
  end;
  
  { Verificar si es palindromo }
  esPalindromo := true;
  for i := 1 to Length(textoLimpio) do
  begin
    if textoLimpio[i] <> textoInvertido[i] then
    begin
      esPalindromo := false;
      break;
    end;
  end;
  
  { Mostrar resultado }
  if esPalindromo then
    Writeln('"', texto, '" es un palindromo.')
  else
    Writeln('"', texto, '" no es un palindromo.');
  
  Writeln;
  Writeln('Presiona cualquier tecla para salir...');
  ReadKey;
end.