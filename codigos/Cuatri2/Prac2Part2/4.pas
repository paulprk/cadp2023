{
program programadores;
procedure leerDatos(var legajo:integer;salario:real);
begin
    writeln('Ingrese el nro de legajo y el salario');
    read(legajo);
    read(salario);
end;
procedure actualizarMaximo(nuevoLegajo:integer;nuevoSalario:real;var maxLegajo:integer);
var
    maxSalario:real;
begin
    if(nuevoLegajo > maxLegajo)then begin
        maxLegajo:=nuevoLegajo;
        maxSalario:=nuevoSalario;
    end;
end;
var
    legajo,maxLegajo,i:integer;
    salario,maxSalario:real;
begin
    sumaSalarios:=0;
    for i:=1 to 130 do begin
        leerDatos(salario,legajo);
        actualizarMaximo(legajo,salario,maxLegajo);
        sumaSalario:=sumaSalarios+salario;
    end;
    writeln('En todo el mes se gastan',sumaSalarios,'pesos');
    writeln('El salario del empleado mas nuevo es',maxSalario);
end.

Errores
1.Linea 22, no se declaro la variable sumaSalarios
2.Linea 24, se estan enviando los parametros mal
3.Linea 15, maxSalario no se esta devolviendo como parametro entonces el PP no sabe del
    valor para poder informarlo
4.Linea 26, no se puede sumar una variable que no esta declarada
5.Linea 28, no se puede imprimir sumaSalarios
6.Linea 29, no se puede imprimir maxSalario

















}