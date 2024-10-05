program diez;
const
    dF=100;
type
    str20=string[20];
    rango=1..dF;
    camion=record
        patente:str20;
        fabricacion:integer;
        capacidad:real;
    end;
    camiones=array[rango]of camion;

    viajes=record
        codviaje:integer;
        codCamion:rango;
        distancia:integer;
        destino:str20;
        anio:integer;
        dnichofer:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:viajes;
        sig:lista;
    end;

procedure cargarCamiones(var c:camiones); //se dispone
procedure cargarLista(var l:lista);
    procedure leerViaje(var v:viajes);
    begin
        write('Ingrese el codigo de viaje:'); readln(v.codviaje);
        if(v.codviaje <> -1)then begin
            write('Ingrese el codigo de camion(1..100):'); readln(v.codCamion);
            write('Ingrese la distancia recorrida en km:'); readln(v.distancia);
            write('Ingrese la ciudad de Destino:'); readln(v.destino);
            write('Ingrese el año del viaje:'); readln(v.anio);
            write('Ingrese el dni del chofer:'); readln(v.dnichofer);
        end;
    end;
    procedure AgregarAtras(var l:lista;v:viajes);
    var
        nue,act:lista;
    begin
        new(nue);
        nue^.dato:=v;
        nue^.sig:=nil;
        if(l = nil)then
            l:=nue
        else begin
            act:=l;
            while(act^.sig <> nil)do
                act:=act^.sig;
            act^.sig:=nue;
        end;
    end;
var
    v:viajes;
begin
    l:=nil;
    leerViaje(v);
    while(v.codviaje <> -1)do begin
        AgregarAtras(l,v);
        leerViaje(v);
    end;
end;

procedure recorrerLista(l:lista;c:camiones);\
    procedure MaxyMin(distancia:integer;patente:str20;var patenteMax,patenteMin:str20;var max,min:integer);
    begin
        if(distancia > max)then begin
            max:=distancia;
            patenteMax:=patente;
        end;  
        if(distancia < min)then begin
            min:=distancia;
            patenteMin:=patente;
        end;
    end;
    function antiguedad(anioViaje,fabricacion:Integer):boolean;
    var
        aux:integer;
    begin
        aux:=anioViaje-fabricacion;
        antiguedad:=(aux > 5);
    end;
    procedure informarImpares(l:lista);
    var
        ok:boolean;
        dni:integer;
    begin
        ok:=false;
        while(l <> nil)do begin
            dni:=l^.dato.dnichofer;
            while(dni <> 0)and (ok=false)do begin
                if(dni mod 2 = 0)then
                    ok:=true
                dni:=dni div 10;
            end;
            if(ok=false)then
                writeln(l^.dato.codViaje);
            l:=l^.sig;
        end;
    end;
var
    patenteMax,patenteMin:str20;
    max,min,totalCamiones:integer;
begin
    max:=-1; min:=9999; totalCamiones:=0;
    while(l <> nil)do begin
        MaxyMin(l^.dato.distancia,c[l^.dato.codCamion].patente,patenteMax,patenteMin,max,min);
        if(c[l^.dato.codCamion].capacidad > 30.5)and (antiguedad(l^.dato.anio,c[l^.dato.codCamion].fabricacion))then
                totalCamiones:=totalCamiones+1;
        l:=l^.sig;
    end;
    writeln('Patente del camion que mas km recorrio:',patenteMax,' patente del camion que menos km recorrio:',patenteMin);
    writeln('En camiones con mas de 5 años de antiguedad y 30,5 toneladas de peso se han realizado un total de:',totalCamiones,' viajes');
    writeln('Codigo de viajes por choferes con DNI impar');
    InformarImpares(l);
end;

var
    c:camiones;
    l:lista;
begin
    cargarCamiones(c); //se dispone
    cargarLista(l);
    RecorrerLista(l,c);
end.
