program tres;
const   
    dimF=200;
type
    rango=1..31;

    viaje=record
        dia:rango;
        monto:real;
        distancia:real;
    end;

    vviajes=array[1..dimF]of viaje;

procedure CargarVector(var vector:vviajes;var dimL:integer);
    procedure leerViajes(var v:viaje);
    begin
        write('Ingrese la distancia recorrida:'); readln(v.distancia);
        if(v.distancia <> 0)then begin
            write('Ingrese el dia:'); readln(v.dia);
            write('Ingrese monto transportado:'); readln(v.monto);
        end;
    end;
var
    v:viaje;
begin
    dimL:=0;
    leerViajes(v);
    while(v.distancia <> 0)and (dimL < dimF)do begin
        dimL:=dimL+1;
        vector[dimL]:=v;
        leerViajes(v);
    end;
end;

procedure Informar(v:vviajes;dimL:integer);
type
    vcontador=array[rango]of integer;

    procedure inicializarVector(var vc:vcontador);
    var
        i:integer;
    begin
        for i:=1 to 31 do
            vc[i]:=0;
    end;

    procedure MenosDinero(v:viaje;var distanciaMin,minDinero:real;var diaMin:rango);
    begin
        if(v.monto < minDinero)then begin
            minDinero:=v.monto;
            distanciaMin:=v.distancia;
            diaMin:=v.dia;
        end;
    end;

    procedure ImprimirVectorContador(vc:vcontador);
    var
        i:integer;
    begin
        for i:=1 to 31 do 
            writeln('dia ',i,':',vc[i]);
    end;

var
    sumaTotal,distanciaMin,minDinero:real;
    i,viajesTotal:integer;
    diaMin:rango;
    vc:vcontador;
begin
    viajesTotal:=0; sumaTotal:=0; minDinero:=9999;
    inicializarVector(vc);
    for i:=1 to dimL do begin
        viajesTotal:=viajesTotal+1;
        sumaTotal:=sumaTotal+v[i].monto;
        MenosDinero(v[i],distanciaMin,minDinero,diaMin);
        vc[v[i].dia]:=vc[v[i].dia]+1
    end;
    writeln('--------------------------------------');
    writeln('El monto promedio fue de:',(sumaTotal/viajesTotal):0:2);
    writeln('Distancia recorrida: ',distanciaMin:0:2,' y el dia que menos dinero se transporto: ',diaMin);
    ImprimirVectorContador(vc);
end;

procedure Eliminar(var v:vviajes;var dimL:integer);
var
    pos,i,eliminado:integer;
begin
    pos:=1; eliminado:=0;
    while(pos <= dimL)do begin
        while(pos <= dimL)and (v[pos].distancia <> 100)do 
            pos:=pos+1;
        if(pos <= dimL)and (v[pos].distancia = 100)then begin
            for i:=pos+1 to dimL do
                v[i-1]:=v[i];
            dimL:=dimL-1;
            eliminado:=eliminado+1
        end;
    end;
    writeln('Se eliminaron ',eliminado);
end;

var
    v:vviajes;
    dimL:integer;
begin
    CargarVector(v,dimL);
    Informar(v,dimL);
    Eliminar(v,dimL);
end.