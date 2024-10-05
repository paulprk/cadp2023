program tres;
type
    str20=string[20];

    viaje=record
        num:integer;
        codAuto:integer;
        dirOrigen:str20;
        dirDestino:str20;
        km:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:viaje;
        sig:lista;
    end;

procedure cargarLista(var l:lista); //se dispone
procedure recorrerLista(l:lista);
    procedure MasKm(codAuto,km:integer;var cod1,cod2,max1,max2:integer);
    begin
        if(km > max1)then begin
            max2:=max1;
            cod2:=cod1;
            max1:=km;
            cod1:=codAuto;
        end
        else if(km > max2)then begin
            max2:=km;
            cod2:=codAuto;
        end;
    end;
    procedure NuevaLista(var l2:lista;v:viaje);
    var
        nue,act,ant:lista;
    begin
        new(nue);
        nue^.dato:=v;
        nue^.sig:=nil;
        act:=l;
        ant:=l;
        while(act <> nil)and (act^.dato.num < v.num)do begin
            ant:=act;
            act:=act^.sig;
        end;
        if(act = ant)then
            f:=nue
        else 
            ant^.sig:=nue;
        nue^.sig:=act;
    end;

var
    cod1,cod2,max1,max2:integer;
    l2:lista;
begin
    max1:=-1; max2:=-1; l2:=nil;
    while(l <> nil)do begin
        MasKm(l^.dato.codAuto,l^.dato.km,cod1,cod2,max1,max2);
        if(l^.dato.km > 5)then
            NuevaLista(l2,l^.dato);
        l:=l^.sig;
    end;
    writeln('Los 2 codigos de auto que mas km recorrieron:',cod1,' y ',cod2);
end;

var
    l:lista;
begin
    l:=nil;
    cargarLista(l); //se dispone
    recorrerLista(l);
end.