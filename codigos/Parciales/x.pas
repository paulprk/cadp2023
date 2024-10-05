program x;
type
    str40=string[40];
    RangoEquipo=1..28;
    rangoCalificacion=0..10;
    fechas=1..27;

    vcalificaciones=array[fechas]of rangoCalificacion;

    jugadores=record
        codJugador:integer;
        apeynom:str40;
        codEquipo:RangoEquipo;
        nacimiento:integer;
        calificacion:vcalificaciones;
    end;
    lista=^nodo;
    nodo=record
        dato:jugadores;
        sig:lista;
    end;

procedure cargarL(var l:lista); //se dispone

procedure recorrerL(l:lista;var l2:lista);
type
    vcont=array[RangoEquipo]of integer;

    procedure iniV(var vc:vcont);
    var
        i:RangoEquipo;
    begin
        for i:=1 to 28 do
            vc[i]:=0;
    end;

    procedure calcMaxs(codJugador,calificacion:integer;var max1,max2,cod1,cod2:integer);
    var
        prom:real;
    begin
        prom:=calificacion/27;
        if(prom > max1)then begin
            max2:=max1;
            cod2:=cod1;
            max1:=prom;
            cod1:=codJugador;
        end
        else if(prom > max2)then begin
            max2:=prom;
            cod2:=codJugador;
        end;
    end;

    function Imparestres(codJugador:integer):Boolean;
    var
        impares:integer;
        par:Boolean;
    begin   
        impares:=0;
        while(codJugador <> 0)and (par = false)do begin
            if(codJugador mod 2 = 0)then
                par:=true
            else 
                impares:=impares+1;
            codJugador:=codJugador div 10;
        end;
        Imparestres:=(impares = 3);
    end;
    procedure InsertarOrdenado(var l2:lista;j:jugadores);
    var
        nue,ant,act:lista;
    begin
        new(nue);
        nue^.dato:=j;
        act:=l2;
        while(act <> nil)and (act^.dato.codJugador < j.codJugador)do begin
            ant:=act;
            act:=act^.sig;
        end;
        if(act = l)then
            l:=nue
        else 
            ant^.sig:=nue;
        nue^.sig:=act;
    end;

var
    vc:vcont;
    i:rangoCalificacion;
    fechas,calificacion:integer;
    max1,max2,cod1,cod2:integer;
begin
    iniV(vc);
    max1:=-1;
    max2:=-1;
    while(l <> nil)do begin
        fechas:=0;  
        calificacion:=0;
        if(l^.dato.nacimiento > 35)then
            vc[l^.dato.codEquipo]:=vc[l^.dato.codEquipo]+1;
        for i:=1 to 27 do begin
            calificacion:=calificacion+l^.dato.calificacion[i];
            if(l^.dato.calificacion[i] <> 0)then
                fechas:=fechas+1;
        end;
        if(fechas > 14)then
            calcMaxs(l^.dato.codJugador,calificacion,max1,max2,cod1,cod2);
        if(Imparestres(l^.dato.codJugador))and (l^.dato.nacimiento > 1983)and (l^.dato.nacimiento < 1990)then
            InsertarOrdenado(l2,l^.dato);
        l:=l^.sig;
    end;
    writeln('Los 2 jugadores que mejor calificacion promedio obtuvieron son:',cod1,' y ',cod2);
end;

var
    l,l2:lista;
begin
    l:=nil;
    l2:=nil;
    cargarL(l); //se dispone
    recorrerL(l,l2);
end.