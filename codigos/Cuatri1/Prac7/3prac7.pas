program three;
const
    fin=0;
type
    taxi=record
        num:integer;
        cod:integer;
        SourceAddress:string[20];
        DesAddress:string[20];
        km:integer;
    end;

    list=^nodo;
    nodo=record
        data:taxi;
        next:list;
    end;

procedure readT(var t:taxi); //Is avaliable
begin
    writeln('-----------------------------');
    with t do begin
        write('Enter number of travel(fin 0): ');  read(num);
        if(num<>fin)then begin
            write('Enter code of car: '); readln(cod);
            write('Enter Sorce Address: '); readln(SourceAddress);
            write('Enter Destination Address: '); readln(DesAddress);
            write('Enter total km did travel: '); readln(km);
        end;
    end;
end;

procedure InsertSorted(var f:list;t:taxi); //Inser Sorted of km
var
    aux,curr,prev:list;
begin
    new(aux);
    aux^.data:=t;
    prev:=f;
    curr:=f;
    while(curr<>nil)and (curr^.data.num < t.num)do begin
        prev:=curr;
        curr:=curr^.next;
    end;
    if(curr = prev)then
        f:=aux
    else
        prev^.next:=aux;
    aux^.next:=curr;
end;

procedure loadL(var f:list); //load info on the List
var
    t:taxi;
begin
    readT(t);
    while(t.num<>fin)do begin
        insertSorted(f,t);
        readT(t);
    end;
end;

procedure loadSecondL(f:list;var s:list);
begin
    while(f<>nil)do begin
        if(f^.data.km >  5)then
            InsertSorted(s,f^.data);
        f:=f^.next;
    end;
end;

procedure max(var f:list;var max1,max2,codMax1,codMax2:integer); //a. calculate two max km did travel
begin
    while(f<>nil)do begin
        if(f^.data.km > max1)then begin
            max2:=max1;
            max1:=f^.data.km;
            codMax2:=codMax1;
            codMax1:=f^.data.cod;
        end
        else if(f^.data.km > max2)then begin
            max2:=f^.data.km;
            codMax2:=f^.data.cod;
        end;
        f:=f^.next;
    end;
end;

procedure printSecondL(s:list);
begin
    writeln('-----------------------------');
    while(s<>nil)do begin
        writeln(s^.data.num);
        writeln(s^.data.cod);
        writeln(s^.data.SourceAddress);
        writeln(s^.data.DesAddress);
        writeln(s^.data.km);
        writeln('-----------------------------');
        s:=s^.next;
    end;
end;

var
    first,second:list;
    max1,max2,codMax1,codMax2:Integer;
begin
    first:=nil; max1:=-1; max2:=-1; second:=nil;
    loadL(first); //Load info on the List
    loadSecondL(first,second);
    max(first,max1,max2,codMax1,codMax2); //a. calcualte two max km did travel
        writeln('Los codigos de los que mas km recorrieron son: ',codMax1,' y ',codMax2);
    printSecondL(second);
end.