procedure agregarAtras(var l:lista;dato:tipo);
var
    nue,act:lista;
begin
    new(nue);
    nue^.dato:=dato;
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

procedure agregaradelante(var l:lista;dato:tipo);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=dato;
    nue^.sig:=l;
    l:=nue;
end;

procedure InsertSorted(var l:lista;dato:tipo);
var
    nue,ant,act:lista;
begin
    new(nue);
    nue^.dato:=dato;
    act:=l;
    while(act <> nil)and (act^.dato < dato)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act = l)then
        l:=nue
    else 
        ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure eliminardesordenado(var l:lista;dato:tipo;var ok:Boolean);
var
    ant,act:lista;
begin
    act:=l;
    ok:=false;
    while(act <> nil)and (act^.dato <> dato)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)then begin
        ok:=true;
        if(act = l)then
            l:=l^.sig
        else 
            ant^.sig:=act^.sig;
        dispose(act);
    end;
end;

procedure eliminarOrdenado(var l:lista;dato:tipo;var ok:Boolean);
var
    ant,act:lista;
begin
    act:=l;
    ok:=false;
    while(act <> nil)and (act^.dato < dato)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)and (act^.dato = dato)then begin
        ok:=true;
        if(act = l)then
            l:=l^.sig
        else 
            ant^.sig:=act^.sig;
        dispose(act);
    end;
end;

procedure eliminarRepeDesordenado(var l:lista;dato:tipo);
var
    ant,act,aux:lista;
begin
    act:=l;
    while(act <> nil)do begin
        if(act^.dato = dato)then begin
            if(act = l)then
                l:=l^.sig
            else 
                ant^.sig:=act^.sig;
            aux:=act;
            act:=act^.sig;
            dispose(aux);
        end
        else begin
            ant:=act;
            act:=act^.sig;
        end;
    end;
end;

procedure eliminarRepeOrdenado(var l:lista;dato:tipo);
var
    ant,act,aux:lista;
    pri:Boolean;
begin
    act:=l;
    while(act <> nil)and (act^.dato < dato)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)and (act^.dato = dato)then begin
        if(act = l)then
            pri:=True
        else 
            pri:false;
        while(act <> nil)and (act^.dato = dato)do begin
            aux:=act;
            act:=act^.sig;
            dispose(aux);
        end;
        if(pri = true)then
            l:=act
        else
            ant^.sig:=act;
    end;
end;