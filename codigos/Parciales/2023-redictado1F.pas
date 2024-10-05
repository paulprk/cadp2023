program x;
type
    str20=string[20];
    rangocategorias=1..4;
    rangoIngredientes=1..10;
    VIngredientes=array[rangoIngredientes] of str20;

    plato=record
        nombre:str20;
        precio:real;
        categoria=RangoCategorias;
        CantIngredientes:rangoIngredientes;
        Ingredientes:VIngredientes;
    end;
    lista=^nodo;
    nodo=record
        dato:plato;
        sig:lista;
    end;

    vcont=array[rangocategorias] of integer;

procedure cargarL(var l:lista);     //se dispone

procedure recorrerL(l:lista;var l2:lista);
    procedure agregaradelante(var l2:lista;nombre:str20;precio:real);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato.nombre:=nombre;
        nue^.dato.precio:=precio;
        nue^.sig:=l2;
        l2:=nue;
    end;

    procedure iniV(var vc:vcont);
    var
        i:rangocategorias;
    begin   
        for i:=1 to 4 do
            vc[i]:=0;
    end;

    procedure CalcMax(vc:vcont);
    var
        i:rangocategorias;
        cod1,cod2,max1,max2:integer;
    begin
        max1:=-1; max2:=-1;
        for i:=1 to 4 do begin
            if(vc[i] > max1)then begin
                max2:=max1;
                cod2:=cod1;
                max1:=vc[i];
                cod1:=i;
            end
            else if(vc[i] > max2)then begin
                max2:=vc[i];
                cod2:=i;
            end;
        end;
        writeln('Las dos categorias mas platos ofrecidos son: ',cod1,' y ',cod2);
    end;

var
    i:rangoIngredientes;
    precio:real;
    cant:integer;
begin
    l2:=nil;
    iniV(vc);
    precio:=0;
    cant:=0;
    while(l <> nil)do begin
        for i:= 1 to l^.dato.CantIngredientes do begin
            if(l^.dato.Ingredientes[i] = 'perejil')then
                AgregarAdelante(l2,l^.dato.nombre,l^.dato.precio);
        end;        
        vc[l^.dato.categoria]:=vc[l^.dato.categoria]+1;  
        if(l^.dato.CantIngredientes > 5)then 
            precio:=precio+l^.dato.precio;
        cant:=cant+1;
        l:=l^.sig;
    end;
    CalcMax(vc);
    writeln('El promedio de precio de los platos con mas de 5 ingredientes es: ',precio/cant:2:2);
end;

var
    l,l2:lista;
    vc:vcont;
begin
    l:=nil;
    cargarL(l);
    recorrerL(l,l2,vc);
end.