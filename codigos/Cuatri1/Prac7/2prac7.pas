program two;
const
    dm=6;
    fin=1122;
type
    range=1..dm;

    customers=record
        cod:integer;
        dni:integer;
        lnameAname:string[40];
        policy:range;
        amountMonth:real;
    end;

    list=^nodo;
    nodo=record
        data:customers;
        next:list;
    end;

    vtable=array[range]of real;

procedure readC(var c:customers); //Read info of customers
begin
    writeln('--------------------------');
    with c do begin
        write('Ingrese el codigo de cliente(fin 1122): '); readln(cod);
        write('Ingrese el dni: '); readln(dni);
        write('Ingrese el Nombre y Apellido: '); readln(lnameAname);
        write('Ingrese la poliza contratada: '); readln(policy);
        write('Ingrese el monto mensual: '); readln(amountMonth);
    end;
end;

procedure loadLable(var v:vtable) //is available

procedure addBack(var f:list;c:customers); //add Back on the list
var
    aux,curr:list;
begin   
    new(aux);
    aux^.data:=c;
    aux^.next:=Nil;
    if(f=nil)then
        f:=aux
    else begin
        curr:=f;
        while(curr^.next<>nil)do
            curr:=curr^.next;
        curr^.next:=aux;
    end;
end;

procedure loadL(var f:list);  //load info of List
var
    c:customers;
begin
    repeat
        readC(c);
        addBack(f,c);
    until(c.cod = fin);
end;

procedure printCustomers(f:list;v:vtable); //print Info of customers
begin
    writeln('--------------------------');
    writeln('Su dni es: ',f^.data.dni);
    writeln('Su nombre y apellido es: ',f^.data.lnameAname);
    writeln('El monto completo de pago es: ',f^.data.amountMonth+v[f^.data.amountMonth]:2:2);
end;

procedure printLastnameAndName(f:list); //print name and last name only if has two nine
begin
    writeln('Clientes que tienen al menos dos nueve en DNI');
    while(f<>nil)do begin
        writeln('--------------------------');
        writeln(f^.data.lnameAname);
        f:=f^.next;
    end;
end;

function twoNine(f:list):boolean; //b if the dni has two nine
var
    cont:integer;
begin
    cont:=0;
    while(f^.data.dni<>0)do begin
        if((f^.data.dni mod 10)=9)then
            cont+=1;
        f^.data.dni:=f^.data.dni div 10;
    end;
    twoNine:=(cont >= 2);
end;

procedure processInfo(f:list;v:vtable); //process table and vector
begin
    while(f<>nil)do begin
        printCustomers(f,v); //a Print info of customers
        ok:=twoNine(f); //b if the dni has two nine
        f:=f^.next;
    end;
    if(ok)then
        printLastnameAndName(f); //print name and last name only if has two nine
end;    

procedure SearchDeleteDNI(var f:list;dni:integer); //search dni and delete this
var
    prev,curr:list;
begin
    curr:=f; prev:=f;
    while(curr^.data.dni <> dni)do begin
        prev:=curr;
        curr:=curr^.next;
    end;
    if(curr=f)then
        f:=f^.next
    else
        prev^.next:=curr^.next;
    Dispose(curr);
end;

var
    first:list;
    v:vtable
    dni:integer;
begin
    first:=Nil; table:=nil;
    loadLable(table); //Load table of prices
    loadL(first); //load Info of List
    processInfo(first,v); //process table and vector
    writeln('Ingrese dni a eliminar: '); readln(dni);
    SearchDeleteDNI(f,dni); //Search dni and delete this
end.