{a) Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño
de memoria que requiere la estructura}
type
    str50=string[50];
    arrcitys=array[1.2500]of str50; //51*2500 requerido

{b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente
estructura}
    puntero=^nombre; //4 bits
    arrpunteros=array[1.2500]of puntero; //4*2500
var
//1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa
    punteros:=arrpunteros;  //4*2500=10000

{ 2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica?}
procedure almacenar(arrP:arrpunteros);
var
    i:integer;
begin
    for i:=1 to 2500
        new(arrP[i]); //estatica por el vector, 4*2500
end;
//b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros
procedure leernombre(arrP:arrpunteros);
var
    i:integer;
begin
    for i:=1 to 2500
        readln(arrP[i]^);
end;