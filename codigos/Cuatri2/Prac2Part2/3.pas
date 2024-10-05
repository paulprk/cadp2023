{program ejercicio5;
procedure sumar(a,b,c:integer)
var
    suma:integer;
begin
    for i:=a to b do
        suma:=suma+i;
    c:=c+suma;
end;
var
    result:integer;
begin
    result:=0;
    readln(a); readln(b);
    sumar(a,b,0);
    write('La suma total es:',result);
    ok:=(result >= 10)or (result <=30);
    if(not ok)then
        write('La suma no quedo entre 10 y 30');
end.

Errores
-linea 2, falta el ";" luego de los parametros
-Linea 14, intenta leer a y b, pero no estan declaradas ni como var globales, ni locales
-Linea 16, intenta informar el resultado, pero no se paso como parametro para saber el valor,
    solo se le asigno valor 0










}
