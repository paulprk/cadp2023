{
program alcanceYFunciones;
var
    suma, cant : integer;

function calcularPromedio : real
var
    prom : real;
begin
    if (cant = 0) then
        prom := -1
    else
        prom := suma / cant;
end;

begin 
    readln(suma);
    readln(cant);
    if (calcularPromedio <> -1) then begin
        cant := 0;
        writeln(‘El promedio es: ’ , calcularPromedio)
    end;
    else
        writeln(‘Dividir por cero no parece ser una buena idea’);
end.

a) La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero
parece incompleta. ¿qué debería agregarle para que funcione correctamente?

    -Ubicar al final de la función calcularPromedio:=prom o calcularPromedio:=(suma/cant)

b) En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse.
¿cómo debería modificarse el programa principal para invocar a dicha función una única vez?

    -Asignando la funcion a una variable, asi tienes el valor mas a mano Ej. promedio:=calcularPromedio

c) Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), ¿qué resultado imprime el
programa? Considere las tres posibilidades:
i) El programa original

    -No imprime nada ya que no se asigna valor al nombre de la Función

ii) El programa luego de realizar la modificación del inciso a)

    -Imprime 8 --> 48/6=8

iii) El programa luego de realizar las modificaciones de los incisos a) y b)

    -Igualmente imprime 8, solo le asinas el valor a una variable adicional asi te evitas tantos
    accesos a memoria que es coste de ejecucion
