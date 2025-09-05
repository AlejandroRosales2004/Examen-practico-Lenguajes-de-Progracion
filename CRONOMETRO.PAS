program CronometroSimple;
uses Crt;

var
  h, m, s, i: integer;

begin
  ClrScr;
  h := 0; m := 0; s := 0;
  
  for i := 1 to 100 do
  begin
    Writeln('Tiempo: ', h:2, ':', m:2, ':', s:2);
    Delay(1000);
    s := s + 1;
    if s = 60 then
    begin
      s := 0;
      m := m + 1;
    end;
    if m = 60 then
    begin
      m := 0;
      h := h + 1;
    end;
  end;
  
  Write('Fin del cronometro');
  ReadKey;
end.