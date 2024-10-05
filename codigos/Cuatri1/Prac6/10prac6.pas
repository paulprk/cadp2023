program ten;
type
    customers=record
        dni:integer;
        num:integer;
    end;

    list=^nodo;
    nodo=record
        data:customers;
        next:list;
    end;


procedure addBack(dni,num:Integer;var f,l:list);
var
    aux:list;
begin
    new(aux);
    aux^.data.dni:=dni;
    aux^.data.num:=num;
    aux^.next:=nil;
    if(f=nil)then begin
        f:=aux;
        l:=aux;
    end
    else begin
        l^.next:=aux;
        l:=aux;
    end;
end;

procedure getClient(dni,num:integer;var f,l:list);
begin
    addBack(dni,num,f,l);
end;

procedure ServeClients(var f:list);
var
    curr:list;
    next:char;
begin
    while(f<>nil)do begin
        writeln('El Cliente que sera atendido es ',f^.data.num,' con DNI ',f^.data.dni);
        curr:=f;
        f:=f^.next;
        dispose(curr);
        writeln('Ingrese "n" para atender al siguiente: '); readln(next);
    end;
end;

procedure LoadClients(var f,l:list);
var
    num,dni:integer;
begin
    num:=0;
    writeln('Ingrese el DNI: '); readln(dni);
    while(dni<>0)do begin
        num+=1;
        getClient(dni,num,f,l);
        writeln('Ingrese el DNI: '); readln(dni);
    end;
end;

var
    first,last:list;
begin
    first:=nil;
    LoadClients(first,last);
    ServeClients(first);
end.