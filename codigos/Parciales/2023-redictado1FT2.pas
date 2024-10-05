program x;
const
    fin=-1;
type
    str20=string[20];
    RangoCategoria=1..4;

    producto=record
        codigo:integer;
        descripcion:str20;
        categoria:RangoCategoria;
        marca:str20;
        precio:real;
    end;
    lista=^nodo;
    nodo=record
        dato:producto;
        sig:lista;
    end;

    marca=record
        nombre:str20;
        cantidadProductos:integer;
    end;
    lista2=^nodo2;
    nodo2=record
        dato:marca;
        sig:lista2;
    end;

procedure cargarL(var l:lista);
    procedure LeerProducto(var p:producto);
    begin
        write('Ingrese el codigo del producto: '); readln(p.codigo);
        if(p.codigo <> fin)then begin
            write('Ingrese la descripcion del producto: '); readln(p.descripcion);
            write('Ingrese la categoria del producto: '); readln(p.categoria);
            write('Ingrese la marca del producto: '); readln(p.marca);
            write('Ingrese el precio del producto: '); readln(p.precio);
        end;
    end;

    procedure InsertarOrdenado(var l:lista;p:producto);
    var
        nue,act,ant:lista;
    begin
        new(nue);
        nue^.dato:=p;
        act:=l;
        while(act <> nil)and (act^.dato.marca < p.marca)do begin
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
    p:producto;
begin
    LeerProducto(p);
    while(p.codigo <> fin) do begin
        InsertarOrdenado(l,p);
        LeerProducto(p);
    end;
end;

procedure recorrer(l:lista;var l2:lista2);
type
    vcont=array[RangoCategoria]of integer;

    procedure AgregarNueva(var l2:lista2;marcaAct:str20;cantidadProductos:integer);
    var
        nue:lista2;
    begin
        new(nue);
        nue^.dato.nombre:=marcaAct;
        nue^.dato.cantidadProductos:=cantidadProductos;
        nue^.sig:=l2;
        l2:=nue;
    end;

    procedure iniV(var vc:vcont);
    var
        i:RangoCategoria;
    begin   
        for i:=1 to 4 do
            vc[i]:=0;
    end;
    procedure CalcMins(vc:vcont);
    var
        min1,min2:integer;
        cat1,cat2,i:RangoCategoria;
    begin
        min1:=9999; min2:=9999;
        for i:=1 to 4 do begin
            if(vc[i] < min1)then begin
                min2:=min1;
                cat2:=cat1;
                min1:=vc[i];
                cat1:=i;
            end
            else if(vc[i] < min2)then begin
                min2:=vc[i];
                cat2:=i;
            end;
        end;
        writeln('Las dos categorias con menos productos son: ',cat1,' y ',cat2);
    end;

    function MulTres(codigo:integer):boolean;
    begin
        MulTres:=(codigo mod 3 = 0);
    end;

var
    marcaAct:str20;
    cantidadProductos,cantProductos:integer;
    vc:vcont;
    precioProm:real;
begin
    l2:=nil;
    iniV(vc);
    precioProm:=0;
    cantProductos:=0;
    while(l <> nil)do begin
        marcaAct:=l^.dato.marca;
        cantidadProductos:=0;
        while(l <> nil)and (marcaAct = l^.dato.marca)do begin
            cantidadProductos:=cantidadProductos+1;
            vc[l^.dato.categoria]:=vc[l^.dato.categoria]+1;
            if(MulTres(l^.dato.codigo))then
                precioProm:=precioProm+l^.dato.precio;
            cantProductos:=cantProductos+1;
            l:=l^.sig;
        end;
        AgregarNueva(l2,marcaAct,cantidadProductos);
    end;
    CalcMins(vc);
    writeln('El precio promedio de los productos cuyo codigo es multiplo de 3 es: ',precioProm/cantProductos:2:2);
end;

var
    l:lista;
    l2:lista2;
begin
    CargarL(l);
    Recorrer(l,l2);
end.