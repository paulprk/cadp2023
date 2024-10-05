program seis;
const
    fin=-1;
type
    rango=1..7;
    str20=string[20];
    objeto=record
        cod:integer;
        categoria:rango;
        nombre:str20;
        distancia:integer;
        descubridor:str20;
        anio:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:objeto;
        sig:lista;
    end;


procedure cargarLista(var l:lista);
    procedure leerObjeto(var o:objeto);
    begin
        writeln('-----------------------------------');
        write('Ingrese el codigo del objeto:'); readln(o.cod);
        if(o.cod <> fin)then begin
            write('Ingrese la categoria(1..7):'); readln(o.categoria);
            write('Ingrese nombre del objeto:'); readln(o.nombre);
            write('Ingrese la distancia a la tierra:'); readln(o.distancia);
            write('Ingrese el nombre del descubridor:'); readln(o.descubridor);
            write('Ingrese el anio de descubrimiento:'); readln(o.anio);
        end;
    end;
    procedure agregarAtras(var l:lista;o:objeto);
    var
        nue,act:lista;
    begin
        new(nue);
        nue^.dato:=o;
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
    o:objeto;
begin
    l:=nil;
    leerObjeto(o);
    while(o.cod <> fin)do begin
        agregarAtras(l,o);
        leerObjeto(o);
    end;
end;

procedure recorrerLista(l:lista);
type
    vcategorias=array[rango]of integer;

    procedure Maxs(codigo,distancia:integer;var max1,max2,codMax1,codMax2:integer);
    begin
        if(distancia > max1)then begin
            max2:=max1;
            codMax2:=codMax1;
            max1:=distancia;
            codMax1:=codigo;
        end
        else if(distancia > max2)then begin
            max2:=distancia;
            codMax2:=codigo;
        end;
    end;
    procedure inicializarV(var vc:vcategorias);
    var
        i:rango;
    begin
        for i:=1 to 7 do
            vc[i]:=0;
    end;
    procedure imprimirV(vc:vcategorias);
    var
        i:rango;
    begin
        for i:=1 to 7 do
            writeln('De la categoria ',i,' hay un total de:',vc[i]);
    end;
    procedure MasPares(cod:integer;nombre:str20);
    var
        pares,impares:integer;
    begin
        pares:=0;
        impares:=0;
        while(cod <> 0)do begin
            if(cod mod 2 = 0)then
                pares:=pares+1
            else
                impares:=impares+1;
            cod:=cod div 10;
        end;
        if(pares > impares)then
            writeln(nombre);
    end;

var
    max1,max2,codMax1,codMax2,porGalileo:integer;
    vc:vcategorias;
begin
    max1:=-1; max2:=-1; porGalileo:=0;
    inicializarV(vc);
    writeln('---Nombre de las estrellas que su codigo posee mas pares que impares---');
    while(l <> nil)do begin
        Maxs(l^.dato.cod,l^.dato.distancia,max1,max2,codMax1,codMax2);
        if(l^.dato.descubridor = 'Galileo Galilei')and (l^.dato.anio < 1600)then
            porGalileo:=porGalileo+1;
        if(l^.dato.categoria = 1)then
            MasPares(l^.dato.cod,l^.dato.nombre);
        vc[l^.dato.categoria]:=vc[l^.dato.categoria]+1;
        l:=l^.sig;
    end;
    writeln('Los codigos de los 2 objetos mas lejanos de la tierra:',codMax1,' y ',codMax2);
    writeln('Planetas descubiertos por Galileo Galilei antes del 1600:',porGalileo);
    imprimirV(vc);
end;

var
    l:lista;
begin
    cargarLista(l);
    RecorrerLista(l);
end.