program doce;
const
    dF=4;
    fin=0;
type
    rangoSub=1..dF;
    str20=string[20];
    vtipoSub=array[rangoSub]of real;

    clientes=record
        nom:str20;
        dni:integer;
        edad:integer;
        tipoSub:rangoSub;
    end;
    lista=^nodo;
    nodo=record
        dato:clientes;
        sig:lista;
    end;

procedure cargarPrecios(var vt:vtipoSub); //se dispone

procedure cargarL(var l:lista);
    procedure leerCliente(var c:clientes);
    begin
        write('Ingrese el Dni del cliente:'); readln(c.dni);
        if(c.dni <> fin)then begin
            write('Ingrese el nombre del cliente:'); readln(c.nom);
            write('Ingrese la edad:'); readln(c.edad);
            write('Ingrese el tipo de suscripcion contratada(1..4):'); readln(c.tipoSub);
        end;
    end;
    procedure AgregarAtras(var l:lista;c:clientes);
    var
        nue,act:lista;
    begin
        new(nue);
        nue^.dato:=c;
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
    c:clientes;
begin
    l:=nil;
    leerCliente(c);
    while(c.dni <> fin)do begin
        AgregarAtras(l,c);
        leerCliente(c);
    end;
end;

procedure recorrerLista(l:lista;vt:vtipoSub;var l2:lista);
type
    vcont=array[rangoSub]of integer;
    procedure iniV(var vc:vcont);
    var
        i:rangoSub;
    begin
        for i:=1 to dF do
            vc[i]:=0;
    end;
    procedure CalcMaxs(vc:vcont);
    var
        i:rangoSub;
        max1,max2:integer;
        codMax1,codMax2:integer;
    begin   
        max1:=-1; max2:=-1;
        for i:=1 to dF do begin
            if(vc[i] > max1)then begin
                max2:=max1;
                codMax2:=codMax1;
                max1:=vc[i];
                codMax1:=i;
            end
            else if(vc[i] > max2)then begin
                max2:=vc[i];
                codMax2:=i;
            end;
        end;
        writeln('Las 2 suscripciones con mas clientes fueron:',codMax1,' y ',codMax2);
    end;

    procedure nuevaListaOrdenada(var l2:lista;c:clientes);
    var
        nue,act,ant:lista;
    begin
        new(nue);
        nue^.dato:=c;
        act:=l2;
        while(act <> nil)and (act^.dato.dni < dni)do begin
            ant:=act;
            act:=act^.sig;
        end;
        if(act = l2)then
            l2:=nue
        else
            ant^.sig:=nue;
        nue^.sig:=act;
    end;

var
    totalGanado:Integer;
    vc:vcont;
begin
    totalGanado:=0;
    iniV(vc);
    l2:=nil;
    while(l <> nil)do begin
        totalGanado:=totalGanado+vt[l^.dato.tipoSub];
        vc[l^.dato.tipoSub]:=vc[l^.dato.tipoSub]+1;
        if(l^.dato.edad > 40)and (l^.dato.tipoSub = 3)or (l^.dato.tipoSub = 4)then
            nuevaListaOrdenada(l2,l^.dato);
        l:=l^.sig;
    end;
    writeln('Ganancia total de Fortaco:',totalGanado);
    CalcMaxs(vc);
end;

var
    l,l2:lista;
    vt:vtipoSub;
begin
    cargarPrecios(vt); //se dispone
    cargarL(l);
    recorrerLista(l,vt,l2);
end.