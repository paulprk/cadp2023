program diez;
const
    dF=3;
    fin=0;
    aume=1.15;
type
    vbussi=array[1..dF]of real;

procedure leer(var v:vbussi;var dL:integer;var salario:real);
begin
    dL:=0;
    write('Ingrese el salario(finaliza 0): '); readln(salario);
    while(salario<>fin)and (dL<dF)do begin
        dL:=dL+1;
        v[dL]:=salario;
        write('Ingrese otro salario(finaliza 0): '); readln(salario);
    end;
end;

procedure Aumento(var x:real;var v:vbussi;dL:integer);
var
    i:integer;
begin
    for i:=1 to dL do begin
        v[i]:=v[i]*aume;
        writeln('-------------------------');
        writeln('El empleado ',i,' le corresponde nuevo salario: ',v[i]:2:1);
    end;
    writeln('-------------------------');
end;

procedure promediTotal(v:vbussi;dL:integer);
var
    i:integer;
    promTotal:real;
begin
    promTotal:=0;
    for i:=1 to dL do
        promTotal:=promTotal+v[i];
    writeln('El promedio del total de sueldos es: ',(promTotal)/dL:2:1);
end;

var
    v:vbussi;
    dL:integer;
    salario:real;
begin
    dL:=0;
    leer(v,dL,salario);
    Aumento(salario,v,dL);
    promediTotal(v,dL);
end.