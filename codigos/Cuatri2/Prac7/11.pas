program once;
const
    dF=100;
    fin=-1;
type
    rango=1..dF;
    tipoRango=1..5;
    str20=string[20];

    eventos=record
        nombre:str20;
        tipo:tipoRango;
        lugar:str20;
        CantMax:integer;
        costoEntrada:real;
    end;
    vevento=array[rango]of eventos;

    entradas=record
        codVenta:integer;
        nEvento:rango;
        dniComprador:integer;
        cantEntradas:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:entradas;
        sig:lista;
    end;

procedure cargarV(var ve:vevento); //se dispone
procedure cargarL(var l:lista);
    procedure leerEntradas(var e:entradas);
    begin
        write('Ingrese el codigo de venta:'); readln(e.codVenta);
        if(e.codVenta <> fin)then begin
            write('Ingrese el numero de evento(1..100):'); readln(e.nEvento);
            write('Ingrese el dni del comprador:'); readln(e.dniComprador);
            write('Ingrese la cantidad de entradas adquiridas:'); readln(e.cantEntradas);
        end;
    end;
    procedure AgregarAtras(var l:lista;e:entradas);
    var
        nue,act:lista;
    begin
        new(nue);
        nue^.dato:=e;
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
    e:entradas;
begin
    l:=nil;
    leerEntradas(e);
    while(e.codVenta <> fin)do begin
        AgregarAtras(l,e);
        leerEntradas(e);
    end;
end;

procedure recorrerLista(l:lista;ve:vevento);
type
    vcont=array[rango]of real;
    procedure iniV(var vc:vcont);
    var
        i:rango;
    begin
        for i:=1 to dF do
            vc[i]:=0;
    end;
    procedure calcMinVenta(l:lista;vc:vcont;ve:vevento);
    var
        min1,min2:real;
        nom1,nom2,lugar1,lugar2:str20;
    begin
        min1:=9999;    min2:=9999;
        while(l <> nil)do begin
            if(vc[l^.dato.nEvento] < min1)then begin
                min2:=min1;
                nom2:=nom1;
                lugar2:=lugar1;
                min1:=vc[l^.dato.nEvento];
                nom1:=ve[l^.dato.nEvento].nombre;
                lugar1:=ve[l^.dato.nEvento].lugar;
            end
            else if(vc[l^.dato.nEvento] < min2)then begin
                min2:=vc[l^.dato.nEvento];
                nom2:=ve[l^.dato.nEvento].nombre;
                lugar2:=ve[l^.dato.nEvento].lugar;
            end;
            l:=l^.sig;
        end;
        writeln('--Lugar y nombre de los 2 eventos con menos recaudacion--');
        writeln('1.Nombre:',nom1,' ,lugar:',lugar1);
        writeln('2.Nombre:',nom2,' ,lugar:',lugar2);
    end;
    function masPares(dniComprador:integer):Boolean
    var
        par,impar:integer;
    begin
        while(dniComprador <> 0)do begin
            if(dniComprador mod 2 = 0)then
                par:=par+1
            else
                impar:=impar+1;
            dniComprador:=dniComprador div 10;
        end;
        masPares:=(par > impar);
    end;

var
    vc:vcont
    cantEntradas:integer;
begin
    iniV(vc); cantEntradas:=0;
    while(l <> nil)do begin
        vc[l^.dato.nEvento]:=(vc[l^.dato.nEvento]+ve[l^.dato.nEvento].costoEntrada) * l^.dato.cantEntradas;
        if(masPares(l^.dato.dniComprador))and (ve[l^.dato.nEvento].tipo = 'obra de teatro')then
            cantEntradas:=cantEntradas+l^.dato.cantEntradas;
        if(l^.dato.cantEntradas > ve[50].CantMax)then
            writeln('El evento 50 alcanzo las maximas personas permitidas');
        l:=l^.sig;
    end;
    calcMinVenta(l,vc,ve);
    writeln('Cantidad de entradas vendida con dni con mas pares que impares y tipo "obra de teatro":',cantEntradas);
end;

var
    ve:vevento;
    l:lista;
begin
    cargarV(ve); //se dispone
    cargarL(l);
    recorrerLista(l,ve);
end.