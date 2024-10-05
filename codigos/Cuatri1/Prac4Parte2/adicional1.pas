program uno;
const
    dF=2000;
type
    rango=1..dF;
    templeado=record
        codE:integer;
        codP:integer;
        anios:integer;
        sueldo:real;
    end;

    vemple=array[rango]of integer;

procedure leerR(var t:templeado);
begin
    write('Ingrese el codigo de empleado: '); readln(t.codE);
    if(t.codE<>0)then begin
        write('Ingrese el codigo de Pais: '); readln(t.codP);
        write('Ingrese la cantidad de anios: '); readln(t.anios);
        write('Ingrese el sueldo: '); readln(t.sueldo);
        writeln('------------------------');
    end;
end;

procedure maximo(emple1,actual1:integer;var max,maxP:integer);
begin
    if(emple1>max)then begin
        max:=emple1;
        maxP:=actual1;
    end;
end;

procedure mejoresempleados(var v:vemple;cod:integer;var dL:integer);
begin
    if(dL<dF)then begin
        dL+=1;
        v[dL]:=cod;
    end;
end;

procedure imprimirVector(v:vemple;dL:integer);
var
    i:integer;
begin
    writeln('Los empleados con mejor sueldo son: ');
    for i:=1 to dL do
        writeln(v[i]);
end;

procedure procesarR();
var
    t:templeado;
    actual,emple,max,maxP,cant,dL:integer;
    v:vemple;
    sueldoAct:real;
begin
    leerR(t);
    max:=-1;
    cant:=0;
    dL:=0;
    while(t.codE<>0)do begin
        actual:=t.codP;
        sueldoAct:=t.sueldo;
        emple:=0;
        while(t.codE<>0)and (t.codP=actual)do begin
            emple+=1;
            if(t.sueldo>2000)then begin
                mejoresempleados(v,t.codE,dL);
            end;
            if(t.anios>10)and (t.sueldo<1.500)then
                cant+=1;
            leerR(t);
        end;
        maximo(emple,actual,max,maxP);
    end;
    writeln('El pais con mayor cantidad de empleados es: ',maxP);
    writeln('La cantidad de empleados con mas de 10 anios de antiguedad y con un salario menor a 1.500 son: ',cant);
    imprimirVector(v,dL);
end;

begin
    procesarR();
end.

