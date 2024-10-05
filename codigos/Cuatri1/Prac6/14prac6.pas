program fourteen;
const   
    finish=-1;
    Total=2;
type
    range=1..5;

    students=record
        cod:Integer;
        day:Integer;
        fac:String[20];
        trans:range;
    end;

    list=^nodo;
    nodo=record
        data:students;
        next:list;
    end;

procedure readS(var s:students);
begin
    writeln('---------------------------');
    with s do begin
        write('Ingrese el codigo de alumno: '); readln(cod);
        if(cod<>finish)then begin
            write('Ingrese el dia de mes: '); readln(day);
            write('Ingrese la Facultad: '); readln(fac);
            write('Ingrese el medio de transporte: '); readln(trans);
        end;
    end;
end;

procedure addBack(var f:list;s:students);
var
    aux,curr:list;
begin
    new(aux);
    aux^.data:=s;
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

function tripsSix(contTrips,cont:integer):integer;
begin
    if(contTrips > 6)then
        cont+=1;
    tripsSix:=cont;
end;

procedure InformSixTrips(contTrips:integer);
begin
    writeln('---------------------------');
    writeln('Hay un total de: ',contTrips,' que realizaron mas de 6 viajes por dia');
end;

procedure processL(s:students;var cont,conStu:Integer);
var
    currDay,currStu,contTrips:integer;
begin
    cont:=0;
    while(s.cod <> finish)do begin
        currDay:=s.day;
        currStu:=s.cod;
        contTrips:=0;
        while(s.cod <> finish)and (currStu = s.cod)and (currDay = s.day)do
            contTrips+=1;
        conStu:=tripsSix(contTrips,cont);
    end;
end;

procedure loadL(var f:list;var cont,contStu:integer);
var
    s:students;
begin
    readS(s);
    while(s.cod<>finish)do begin
        addBack(f,s);
        processL(s,cont,contStu);
        readS(S);
    end;
end;

procedure InformASixTrips(contStu:integer);
begin
    writeln('---------------------------');
    writeln('Hay un total de: ',contStu,' alumnos que realizan mas de 6 viajes por dia');
end;

var
    first:list;
    cont,contStu:integer;
begin
    first:=nil; contStu:=0;
    loadL(first,cont,contStu);
    InformASixTrips(contStu);
end.