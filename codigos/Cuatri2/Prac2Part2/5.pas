program cinco;

function doble(numA,numB:integer):boolean;
begin
    doble:=(numA * 2)=numB;
end;


var
    numA,numB,leidos,dobles:integer;
begin
    leidos:=0;  dobles:=0; //b
    write('Ingrese 2 numeros:'); readln(numA); readln(numB);
    while(numA <> 0)and (numB <> 0)do begin
        leidos+=1; //b
        if(doble(numA,numB))then
            //a)writeln('El numero, ',numB,' es el doble de, ',numA);
            dobles+=1; //b
        write('Ingrese 2 numeros:'); readln(numA); readln(numB); //b
    end;
    writeln('El total de pares leidos fue:',leidos);    //b
    writeln('Cantidad de pares en los que numB es el doble de numA son:',dobles); //b
end.