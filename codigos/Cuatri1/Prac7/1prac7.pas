program one;
const
    fin=354;
    dm=5;
type
    range=1..dm;

    casting=record
        dni:integer;
        lnameAndName:string[40];
        age:integer;
        gen:range;
    end;

    list=^node;
    node=record
        data:Casting;
        next:list;
    end;

    vcont=array[range]of Integer;

procedure readC(var c:casting); //Load Info
begin
    writeln('--------------------------------');
    with c do begin
        write('Ingree dni(fin 354): '); readln(dni);
        write('Ingese el Nombre y Apellido: '); readln(lnameAndName);
        write('Ingrese la edad: '); readln(age);
        write('Ingrese el genero(1 a 5): '); readln(gen);
    end;
end;

procedure SetUpV(var v:vcont); //Set Up all positions of vector in 0
var
    i:range;
begin
    for i:=1 to dm do
        v[i]:=0;
end;

procedure AddV(var v:vcont;pos:range);
begin
    v[pos]:=v[pos]+1;
end;

procedure addBack(var f:list;c:casting); //Add info Back on the list
var
    aux,curr:list;
begin
    New(aux);
    aux^.data:=c;
    aux^.next:=nil;
    if(f=nil)then
        f:=aux
    else begin
        curr:=f;
        while(curr^.next<>nil)do
            curr:=curr^.next;
        curr^.next:=aux;
    end;
end;

procedure loadL(var f:list;var v:vcont); //Load info of List And Vector
var
    c:casting;
begin
    repeat
        readC(c);
        AddV(v,c.gen);
        addBack(f,c);
    until(c.dni = fin);
end;

procedure MorePeers(dni:integer;var contPeers:integer); //a calculate peers and odd
var
    peers,odd:integer; 
begin
    peers:=0; odd:=0;
    while(dni<>0)do begin
        if((dni mod 2)=0)then
            peers+=1
        else
            odd+=1;
        dni:=dni div 10;
    end;
    if(peers > odd)then
        contPeers+=1;
end;

procedure max(num:Integer;var codMax1,codMax2,max1,max2:integer;gen:Integer); //calcualte two max cods 
begin
        if(num > max1)then begin
            max2:=max1;
            codMax2:=codMax1;
            max1:=num;
            codMax1:=gen;
        end
        else if(num > max2)then begin
            max2:=num;
            codMax2:=gen;
        end;
end;

procedure ProcessPeers(f:list;v:vcont);
var
    contPeers,codMax1,codMax2,max1,max2,i:integer;
begin
    contPeers:=0; max1:=-1; max2:=-1;
    while(f<>nil)do begin
        MorePeers(f^.data.dni,contPeers); //a calculate peers and odd
        for i:=1 to dm do 
            max(v[i],codMax1,codMax2,max1,max2,i); //calculate cods max
        f:=f^.next;
    end;
    writeln('--------------------------------');
    writeln('Las personas con mas digitos pares que impares son: ',contPeers); //inform more peers
    writeln('Los dos generos mas elegidos fueron el: ',codMax1,' y ',codMax2); //inform more select genders
end;

procedure deleteDNI(var f:list;dni:integer;var ok:boolean); //delete dni
var
    curr,prev:list;
begin
    ok:=false;
    curr:=f;
    prev:=f;
    while(curr<>nil)and (curr^.data.dni <> dni)do begin
        prev:=curr;
        curr:=curr^.next;
    end;
    if(curr<>nil)then begin
        ok:=true;
        if(curr=f)then
            f:=f^.next
        else
            prev^.next:=curr^.next;
        Dispose(curr);
    end;
end;

var
    first:list;
    v:vcont;
    dni:integer;
    ok:boolean;
begin
    first:=nil;
    SetUpV(v); //Set Up all positions of vector in 0
    loadL(first,v); //load Info on List and Vector
    ProcessPeers(first,v); //processes information from the list and vector
    writeln('Ingrese DNI a eliminar: '); readln(dni); //read dni to eliminate it
    deleteDNI(first,dni,ok); //eliminate dni
        if(ok)then
            writeln('SE elimino')
        else
            writeln('NO se elimino');
end.