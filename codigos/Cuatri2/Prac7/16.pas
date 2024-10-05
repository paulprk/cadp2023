program dieciseis;
type
    str20=string[20];
    rangoTipo=1..5;

    clientes=record //ultimos 6 meses
        cod:integer;
        localidad:str20;
        tipo:rangoTipo;
        kW:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:clientes;
        sig:lista;
    end;

    vcont=array[rangoTipo]of integer;

procedure cargarL(var l:lista); //se dispone

procedure recorrerL(l:lista;var vc:vcont;var l2:lista);
    procedure iniV(var vc:vcont);
    var
        i:rangoTipo;
    begin
        for i:=1 to 5 do
            vc[i]:=0;
    end;
    procedure CalcMax(clientesTotal:integer;var max:integer;localidaAct:str20;var localidaActMax:str20);
    begin
        if(clientesTotal > max)then begin
            max:=clientesTotal;
            localidaActMax:=localidaAct;
        end;
    end;
    procedure NuevaLista(var l2:lista;c:clientes);
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
    localidaAct:str20;
    clientesTotal,max,localidaActMax:integer;
begin
    iniV(vc); max:=-1; l2:=nil;
    while(l <> nil)do begin
        clientesTotal:=0;
        localidaAct:l^.dato.localidad;
        while(l <> nil)and (localidaAct = l^.dato.localidad)do begin
            clientesTotal:=clientesTotal+1;
//a)Un módulo que reciba la estructura con la información de los clientes y retorne en otra estructura la cantidad de clientes que hay para cada tipo
            vc[l^.dato.tipo]:=vc[l^.dato.tipo]+1;   
//c)Un módulo que reciba la estructura con la información de los clientes y retorne en otra estructura adecuada los clientes que consumieron más de 1000 kW en los últimos 6 meses
            if(l^.dato.kW > 1000)then               
                NuevaLista(l2,l^.dato); 
            l:=l^.sig;
        end;
//b)Un módulo que reciba la estructura con la información de los clientes y retorne la localidad con mayor cantidad de clientes
        CalcMax(clientesTotal,max,localidaAct,localidaActMax); 
    end;
    writeln('La localidad con mayor cantidad de clientes fue:',localidaActMax);
end;

procedure impriV(vc:vco);
var
    i:rangoTipo;
begin
    for i:=1 to 5 do
        writeln('Del tipo:',i,' hay un total de clientes de:',vc[i]);
end;

procedure recorrerL2(l2:lista);
    function ParImpar(cod:integer):boolean;
    var
        par,impar:integer;
    begin
        par:=0; impar:=0;
        while(cod <> 0)do begin
            if(cod mod 2 = 0)then
                par:=par+1
            else
                impar:=impar+1;
            cod:=cod div 10;
        end;
        ParImpar:=(par = impar);
    end;

begin
    while(l2 <> nil)do begin
        if(ParImpar(l2^.dato.cod))then
            writeln(l^.dato.localidad);
        l2:=l2^.sig;
    end;
end;

var
    l,l2:lista;
    vc:vcont;
begin
    l:=nil;
    cargarL(l);    //se dispone organizada por localidad
    recorrerL(l,vc,l2);
    impriV(vc); //a)
//d) Un módulo que reciba la estructura generada en c) y que informe el domicilio de cada cliente cuyo código tiene igual cantidad de dígitos pares que impares.
    recorrerL2(l2);
end.
