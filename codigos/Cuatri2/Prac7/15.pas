program quince;
const
    dF=15;
    fin=-1;
type
    str20=string[20];
    rango=1..dF;

    productos=record
        nom:str40;
        disponibles:integer;
        precio:real;
    end;
    vproductos=array[rango]of productos;

    pedidos=record
        cod:integer;
        dni:integer;
        tipo:rango;
        pedidas:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:pedidos;
        sig:lista;
    end;

procedure cargarV(var vp:vproductos);

procedure InsertarOrdenado(var l:lista;p:pedidos);
    var
        nue,act,ant:lista;
    begin
        new(nue);
        nue^.dato:=p;
        act:=l;
        while(act <> nil)and (act^.dato.cod < p.cod)do begin
            ant:=act;
            act:=act^.sig;
        end;
        if(act = l)then
            l:=nue
        else
            ant^.sig:=nue;
        nue^.sig:=act;       
    end;
procedure cargarL(var l:lista);
    procedure leerPedidos(var p:pedidos);
    begin
        write('Ingrese el codigo de pedido:'); readln(p.cod);
        if(p.cod <> fin)then begin
            write('Ingrese el DNI del cliente:'); readln(p.dni);
            write('Ingrese el tipo de producto(1..15):'); readln(p.tipo);
            write('Ingrese la cantidad de unidades pedidas:'); readln(p.pedidas);
        end;    
    end;
var
    p:pedidos;
begin
    l:=nil;
    leerPedidos(p);
    while(p.cod <> fin)do begin
        InsertarOrdenado(l,p);
        leerPedidos(p);
    end;
end;

procedure ReL(l:lista;vp:vproductos;var l2:lista);
var
    totalSatisfechos:real;
begin
    l2:=nil; totalSatisfechos:=0;
    while(l <> nil)do begin
        if(l^.dato.pedidas <= vp[l^.dato.tipo].disponibles)then begin
            writeln('El pedido:',l^.dato.cod,' debe pagar un total de:',(l^.dato.pedidas*vp[l^.dato.tipo].precio):0:2);
            totalSatisfechos:=totalSatisfechos+(l^.dato.pedidas * vp[l^.dato.tipo].precio);
        end
        else
            InsertarOrdenado(l2,l^.dato); //nueva lista de pedidos No hechos
        l:=l^.sig;
    end;
    writeln('El monto total de pedidos satisfechos fue:',totalSatisfechos:0:2);
end;

function PuntoB(l:lista;vp:vproductos):integer;
var
    menordeCinco:integer;
begin
    menordeCinco:=0;
    while(l <> nil)do begin
        if(vp[l^.dato.tipo].disponibles < 5)then
            menordeCinco:=menordeCinco+1;
        l:=l^.sig;
    end;
    PuntoB:=menordeCinco;
end;

procedure PedidosNoSatisfechos(l2:lista;vp:vproductos);
    function IgualParImpar(dni:integer):boolean;
    var
        par,impar:integer;
    begin
        par:=0; impar:=0;
        while(dni <> 0)do begin
            if(dni mod 2 = 0)then
                par:=par+1
            else
                impar:=impar+1;
            dni:=dni div 10;
        end;
        IgualParImpar:=(par = impar);
    end;

begin
    while(l2 <> nil)do begin
        if(IgualParImpar(l2^.dato.dni))then
            writeln('Pedidos no Satisfechos con DNI par=impares:',l2^.dato.cod);
        l2:=l2^.sig;
    end;
end;

var
    l,l2:lista;
    vp:vproductos;
    menordeCinco:integer;
begin
    cargarV(vp); //se dispone
    cargarL(l);
    ReL(l,vp,l2);
    writeln('Cantidad de productos con unidades disponibles menor a 5:',PuntoB(l,vp));
    PedidosNoSatisfechos(l2,vp);
end.