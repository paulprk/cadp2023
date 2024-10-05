{}
program anidamientos;

procedure leer;
var
    letra : char;
    function analizarLetra : boolean
    begin
        if (letra >= ‘a’) and (letra <= ‘z’) then
            analizarLetra := true;
        else if (letra >= ‘A’) and (letra <= ‘Z’) then
            analizarletra := false;
    end; 
begin
    readln(letra);
    if (analizarLetra) then
        writeln(‘Se trata de una minúscula’)
    else
        writeln(‘Se trata de una mayúscula’);
end;

var
    ok : boolean;
begin 
    leer;
    ok := analizarLetra;
    if ok then
        writeln(‘Gracias, vuelva prontosss’);
end.

a) La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto
puede traer problemas en el código del programa principal.
i) ¿qué clase de problema encuentra?

    -Que intena guardar en una variable ok el valor de la funcion, lo que no es posible ya que
    si es un submodulo del procedimiento, solo puede usado dentro del ese mismo

ii) ¿cómo se puede resolver el problema para que el programa compile y funcione correctamente?

    -Declarar la funcion arriba del todo separado del procedimiento

b) La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
i) ¿De qué valores se trata?

    -cuando sea 0, o sea un caracter especial

ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?

    -No imprime nada

iii) ¿Cómo se puede resolver este problema?

    -usando un case