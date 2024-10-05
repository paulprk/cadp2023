program memoria;
type
    datos = array [1..20] of integer; //2*20=40
    punt = ^datos; //4

procedure procesarDatos(v : datos; var v2 : datos); //40+40=80
var
    i, j : integer; //2+2=4
begin
    for i := 1 to 20 do //1*20=20 
        v2[21 - i] := v[i];  //40
end;

var
    vect : datos;
    pvect : punt;
    i : integer;
begin
    for i:= 1 to 20 do
        vect[i] := i;
        new(pvect);
    for i:= 20 downto 1 do
        pvect^[i] := 0;
    procesarDatos(pvect^, vect);
    writeln(‘fin’);
end.

{Responda: ¿cuánta memoria en total ocupa el programa al ejecutarse? Considere tanto variables estáticas
como dinámicas, parámetros y variables locales de los módulos.
a) Hasta la sentencia de la línea 18

b) Hasta la sentencia de la línea 20
c) Hasta la sentencia de la línea 23
d) Hasta la sentencia de la línea 11
e) Hasta la sentencia de la línea 25}