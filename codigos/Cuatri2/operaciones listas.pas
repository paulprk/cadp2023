//sacar ult para aplicar 2 agregar al final
function BuscarUltimo(l:lista):lista;
begin
    if(l <> nil)then
        while(l^.sig <> nil)do
            l:=l^.sig;
    buscarUltimo:=l;
end;
//agregar adelante-----------

procedure agregaradelante(var primero:lista;valoragregar:tipodedato);
var
    nuevo:Lista;
begin
    new(nuevo);
    nuevo^.dato:=valoragregar;
    nuevo^.sig:=pri;
    pri:=nuevo;
end;

//agregar al final------------------
procedure agregarAtras(var l: lista; v: integer);
var
    nuevo,actual:lista;
begin
    new(nuevo);
    nuevo^.num:=v;
    nuevo^.sig:=nil;
    if(l=nil)then
        l:=nuevo
    else begin
        actual:=l;
        while(actual^.sig <> nil)do
            actual:=actual^.sig;
        acutal^.sig:=nuevo;
    end;
end;

procedure agregarAtras(var l,lu:lista;t:tipo);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=t;
    nue^.sig:=nil;
    if(l=nil)then begin
        l:=nue;
        lu:=nue;
    end
    else begin
        lu^.sig:=nue;
        lu:=nue;
    end;
end;

---Insertar Ordenado
procedure InsertSorted(var f:list; x:tipo);
var
    curr,prev,neww:list;
begin
    new(neww);
    neww^.data:=x;
    curr:=f;
    while(curr <> nil)and (curr^.data.tipo < x{ascendente})do begin
        prev:=curr;
        curr:=curr^.next;
    end;
    if(curr = f)then
        f:=neww
    else
        prev^.next:=neww;
    neww^.next:=curr;
end;

//search on sorted list--------------

function buscarEnListaDesordenada(l:lista;valorbuscar:tipodedato):Boolean;
var
    ok:boolean;
begin
    ok:=false;
    while(l<>nil)and (ok=false)do begin
        if(l^.elemento=valorbuscar)then
            ok:=true
        else
            l:=l^.sig;
    end;
    buscarEnListaDesordenada:=ok;
end;

//Search on unordered list
function buscarEnListaOrdenada(l:lista;valorbuscar:tipodedato):boolean;
begin
    while(l<>nil)and (l^.elemento < valorbuscar)do
        l:=l^.sig;
    if(l<>nil)and (l^.elemento=valorbuscar)then
        buscarEnListaOrdenada:=true
    else
		buscarEnListaOrdenada:=false;
end;

//eliminar sin orden-seguro existe

procedure eliminarSinOrden(var l:lista;dato:tipo;var ok:boolean);
var
    actual,anterior:lista;
begin
    actual:=l; ok:=false;
    while(actula <> nil)and (actual^.dato <> dato)do begin
        anterior:=actual;
        actual:=actual^.sig;
    end;
    if(actual <> nil)then begin
        ok:=true;
        if(actual = l)then
            l:=l^.sig
        else
            anterior^.sig:=actual^.sig;
        dispose(actual);
    end;
end;

//eliminar con orden, puede que no exista

procedure eliminarOrdenado(var l:lista;dato:tipo;var ok:boolean);
var
    actual,anterior:lista;
begin
    actual:=l; ok:=false;
    while(actula <> nil)and (actual^.dato < dato)do begin
        anterior:=actual;
        actual:=actual^.sig;
    end;
    if(actual <> nil)and (actual^.dato = dato)then begin
        ok:=true;
        if(actual = l)then
            l:=l^.sig
        else
            anterior^.sig:=actual^.sig;
        dispose(actual);
    end;
end;

//si se repite desordenado

procedure eliminarRepetidoDesordenado(var l:lista;tipo:tipoelimintar);
var
    ant,act,aux:lista;
begin
    act:=l;
    while(act <> nil)do begin
        if(act^.dato.tipo = tipo)then begin
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

//si se repite ordenado
procedure eliminarRepetidoOrdenado(var l:lista;tipo:tipoeliminar);
var
    ant,act,aux:lista;
    primero:boolean;
begin
    act=l;
    while(act <> nil and act^.dato.tipo < tipo)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil and act^.dato.tipo = tipo)then begin
        if(l = act)then
            primero:=true
        else
            primero:=false;
        while(act <> nil and act^.dato.tipo = tipo)do begin
            aux:=act;
            act:=act^.sig;
            dispose(aux);
        end;
        if(primero = true)then
            l:=act
        else
            ant^.sig:=act;
    end;
end;
