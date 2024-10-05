program dieciocho;
const
    dF=2000;
    dFrubro=15;
    fin=-999;
type
    str20=string[20];
    tipoRubro=1..dFrubro;
    rangoProductos=1..dF;

    productos=record
        nom:str20;
        marca:str20;
        rubro:tipoRubro;
    end;
    vproductos=array[rangoProductos]of productos;

//----------------------------------------------------

    vcont=array[tipoRubro]of integer;

//----------------------------------------------------
    Rfecha=record
        dia:integer;
        mes:integer;
        anio:integer;
    end;
    Rproducto=record
        cod:rangoProductos;
        cantidad:integer;
    end;
    VRproducto=array[rangoProductos]of Rproducto;
    pedido=record
        num:integer;
        fecha:Rfecha;
        productos:VRproducto;
        dL:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:pedido;
        sig:lista;
    end;

//----------------------------------------------------

    diezproductos=record
        numeroPedidos:integer;
        cantProductos:integer;
    end;
    lista2=^nodo2;
    nodo2=record
        dato2:diezproductos;
        sig2:lista2;
    end;

//----------------------------------------------------

procedure cargarV(var vp:vproductos);   //se dispone
procedure cargarL(var l:lista);
    procedure leerPedido(var p:pedido);
        procedure LeerFecha(var f:Rfecha);
        begin
            write('Ingrese el dia:'); readln(f.dia);
            write('Ingrese el mes:'); readln(f.mes);
            write('Ingrese el anio:'); readln(f.anio);
        end;
        procedure LeerProductos(var VRP:VRproducto;var dL:integer);
        var
            cod,,cantidad:integer;
        begin
            dL:=0;
            write('Ingrese el codigo de producto:'); readln(cod);
            while(cod <> fin)and (dL < dF)do begin
                dL:=dL+1;
                VRP[dL].cod:=cod;
                write('Ingrese la cantidad:'); readln(cantidad);
                VRP[dL].cantidad:=cantidad;
                write('Ingrese el codigo de producto:'); readln(cod);
            end;
        end;

    begin
        write('Ingrese numero de pedidos(fin -999):'); readln(p.num);
        if(p.num <> fin)then begin
            LeerFecha(p.fecha);
            LeerProductos(p.productos,p.dL);
        end;
    end;
    procedure AgregarAtras(var l:lista;p:pedido);
    var
        nue,act:lista;
    begin
        new(nue);
        nue^.dato:=p;
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
    p:pedido;
begin
    l:=nil;
    leerPedido(p);
    while(p.num <> fin)do begin
        AgregarAtras(l,p);
        leerPedido(p);
    end;
end;

//----------------------------------------------------

procedure RecorrerVP(vp:vproductos;var vc:vcont);
    procedure iniV(var vc:vcont);   
    var
        i:tipoRubro;
    begin
        for i:=1 to dFrubro do
            vc[i]:=0;
    end;
    procedure inforRubros(vc:vcont);
    var
        i:tipoRubro;
    begin
        for i:=1 to dFrubro do
            writeln('Del rubro "',i,'" hubo un total de:',vc[i]);
    end;

var
    i:rangoProductos;
    vc:vcont;
begin
    iniV(vc);
    for i:=1 to dF do
        vc[vp[i].rubro]:=vc[vp[i].rubro]+1;
    inforRubros(vc);
end;

//----------------------------------------------------

procedure RecorrerL(l:lista;var l2:lista2);
    procedure agregarAtras(productos:integer;numeroPedido:integer;var l2:lista2);
    var
        nue,act:lista2;
    begin
        new(nue);
        nue^.dato2.numeroPedidos:=numeroPedido;
        nue^.dato2.cantProductos:=productos;
        nue^.sig2:=nil;
        if(l2 = nil)then
            l2:=nue
        else begin
            act:=l2;
            while(act^.sig2 <> nil)do
                act:=act^.sig2;
            act^.sig2:=nue;
        end;
    end;
var
    pedidosTotal:integer;
begin
    l2:=nil;    pedidosTotal:=0;
    while(l <> nil)do begin
        pedidosTotal:=pedidosTotal+l^.dato.dL;
        if(l^.dato.dL > 10)then
            AgregarAtras(l^.dato.dL,l^.dato.num,l2);
        l:=l^.sig;
    end;
//a)iii
    writeln('Total Pedidos solicitados al comercio:',pedidosTotal);
end;

//----------------------------------------------------

procedure Informar(l:lista;valor:integer);
    function ParImpar(num:integer):boolean;
    var
        par,impar:integer;
    begin
        par:=0; impar:=0;
        while(num <> 0)do begin
            if(num mod 2 = 0)then
                par:=par+1
            else
                impar:=impar+1;
            num:=num div 10;
        end;
        ParImpar:=(par = impar);
    end;
begin
    while(l <> nil)do begin
        if(ParImpar(l^.dato.num))and (l^.dato.dL < valor)then
            writeln('Numero de pedido:',l^.dato.num);
        l:=l^.sig;
    end;
end;



//----------------------------------------------------

procedure RubroMax(vc:vcont;var maxRubro:integer);
var
    i:tipoRubro;
    max:integer;
begin
    max:=-1;
    for i:=1 to dFrubro do begin
        if(vc[i] > max)then begin
            max:=vc[i];
            maxRubro:=i;
        end;
    end;
end;

//----------------------------------------------------

var
    vp:vproductos;
    l:lista;
    l2:lista2;
    vc:vcont;
    valor,maxRubro:integer;
begin
    cargarV(vp);    //se dispone
//a)
    cargarL(l);
//a)i
    RecorrerVP(vp,vc);
//a)ii
    RecorrerL(l,l2);
//b)
    writeln('Ingrese un valor:'); readln(valor);
    Informar(l,valor);
//c)
    RubroMax(vc,maxRubro);
    writeln('El rubro con mayor cantidad de productos solicitados fue:',maxRubro);
end.