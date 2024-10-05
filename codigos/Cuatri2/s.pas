procedure agregar1(var l:lista;dato:tipo);
var
    nue,act:lista;
begin
    new(Nue);
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

procedure agregara2(var l,l2:lista;dato:tipo);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=dato;
    nue^.sig:=nil;
    if(l = nil)then begin
        l:=nue;
        l2:=nue;
    end
    else begin
        l2^.sig:=nue;
        l2:=nue;
    end;
end;

procedure insertar(var l:lista;dato:tipo);
var
    nue,ant,act:lista;
begin
    new(Nue);
    nue^.dato:=dato;
    act:=l;
    while(act <> nil)and (act^.dato < dato)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(l = act)then
        l:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure eliminarsin(var l:lista;dato:tipo;var ok:boolean);
var
    ant,act:lista;
begin
    act:=l;
    while(act <> nil)and (act^.dato <> dato)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)then begin
        if(l = act)then
            l:=l^.sig
        else    
            ant^.sig:=act^.sig;
        dipose(act);
    end;
end;

procedure eliminarcon(var l:lista;dato:tipo);
var
    ant,act:lista;
begin
    act:=l;
    while(act <> nil)and (act^.dato < dato)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)and (act^.dato = dato)then begin
        if(l = act)then
            l:=l^.sig
        else
            ant^.sig:=act^.sig;
        dispose(act);
    end;
end;

procedure repesin(var l:lista;dato:tipo);
var
    aux,ant,act:lista;
begin
    act:=l;
    while(act <> nil)do begin
        if(act^.dato = dato)then begin
            if(l = act)then
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

procedure repecon(var l:lista;dato:tipo);
var
    aux,ant,act:lista;
    pri:boolean;
begin
    act:=l;
    while(act <> nil)and (act^.dato < dato)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)and (act^.dato = dato)then begin
        if(l = act)then
            pri:=True
        else
            pri:=False;
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