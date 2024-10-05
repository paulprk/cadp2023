program tres;
const
    dF=5;
type
    dia=1..31;
    rango=1..dF;

    rviaje=record
        dias:dia;
        monto:real;
        distancia:real;
    end;

    viajes=array[rango]of rviaje;
    mes=array[dia]of integer;

procedure leer(var v:rviaje);
begin
    write('Ingrese la distancia en KM(finaliza con 0): '); readln(v.distancia);
    if(v.distancia<>0)then begin
        write('Ingrese el dia del mes: '); readln(v.dias);
        write('Monto transportado: '); readln(v.monto);
    end;
    writeln('------------------------------------');
end;

//a
procedure cargarV(var v:viajes;var dL:integer);
var
    r:rviaje;
begin
    dL:=0;
    leer(r);
    while(r.distancia<>0)and (dL<dF)do begin
        dL+=1;
        v[dL]:=r;
        leer(r);
    end;
end;

procedure inicializar(var m:mes);
var
    i:dia;
begin
    for i:=1 to 31 do
        m[i]:=0;
end;

//b

function promedio(cant:real; total:integer):real;
begin
    promedio:=cant/total;
end;

procedure minimo(r:rviaje;var min:rviaje);
begin
    if(r.monto<=min.monto)then
        min:=r;
end;

procedure informarviajes(m:mes);
var
    i:dia;
begin
    for i:=1 to 31 do
        writeln('El dia ',i,' tuvo ',m[i],' viajes');
end;

procedure informar(v:viajes; dL:integer;var m:mes);
var
    i:integer;
    TotalMonto:real;
    min:rviaje;
begin
    min.monto:=9999;
    TotalMonto:=0;
    for i:=1 to dL do begin
        TotalMonto:=TotalMonto+v[i].monto;
        minimo(v[i],min);
        m[v[i].dias]:=m[v[i].dias]+1;
    end;
    writeln('El monto promedio es: ',promedio(TotalMonto,dL):2:2);
    writeln('La distancia recorrida: ',min.distancia:2:2,' y el dia del mes ',min.dias,' es el dia que menos dinero se transporto');
    informarviajes(m);
end;

//c

procedure eliminar(var v:viajes;var dL:integer;var ok:boolean;var eliminadoscant:integer);
var
    i,j:integer;
begin
    i:=1;
    ok:=false;
    eliminadoscant:=0;
    while(i<dL)do begin
        if(v[i].distancia=100)then begin
            for j:=i to dL-1 do
                v[i]:=v[i+1];
                dL-=1;
                eliminadoscant+=1;
        end
        else
            i+=1;
        ok:=true;
    end;
end;

var
    v:viajes;
    dL:integer;
    m:mes;
    ok:Boolean;
    eliminadoscant:integer;
begin
    cargarV(v,dL);
    inicializar(m);
    informar(v,dL,m);
    eliminar(v,dL,ok,eliminadoscant);
    if(ok)then
        writeln('Se eliminaron ',eliminadoscant);
end.