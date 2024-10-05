{
program Ejercicio3;

procedure suma(num1: integer; var num2:integer);
begin
    num2 := num1 + num2;
    num1 := 0;
end;

var
    i, x : integer;
begin
    read(x); 
    for i:= 1 to 5 do i=1,i=2,i=3,i=4,i=5
        suma(i,x);  i=1 + x=10= 11 + i=2= 13 + i=3= 16 + i=4= 20 + i=5= 25
    write(x); 
end.

a. ¿Qué imprime si se lee el valor 10 en la variable x ?

    -25

b. ¿Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
procedure suma(num1: integer; num2:integer);

    -Imprime 10 ya que nada de lo que este dentro del modulo afecta afuera, ya que se pasa por valor

c. ¿Qué sucede si se cambia el encabezado del procedure por:
procedure suma(var num1: integer; var num2:integer);

    -No compila porque i no se puede sumar ya que pertenece a un for
