program eleven;
const
    finish=0;
    dF=10;
type
    range=1..dF;

    students=record
        num:Integer;
        lname:string[20];
        average:real;
    end;

    list=^nodo;
    nodo=record
        data:students;
        next:list;
    end;

procedure readS(var s:students);
begin
    writeln('------------------------------');
    with s do begin
        write('Ingrese el numero de alumno: '); readln(num);
        if(num<>finish)then begin
            write('Ingrese el apellido de alumno: '); readln(lname);
            write('Ingrese el promedio del estudiante: '); readln(average);
        end;
    end;
end;

procedure InsertSorted(var f:list;s:students); //b
var
    aux,prev,curr:list;
begin
    new(aux);
    aux^.data:=s;
    aux^.next:=nil;
    if(f=nil)then
        f:=aux
    else begin
        curr:=f;
        prev:=f;
        while(curr<>nil)and (s.average < curr^.data.average)do begin
            prev:=curr;
            curr:=curr^.next;
        end;
        if(curr=f)then begin
            aux^.next:=f;
            f:=aux;
        end
        else if(curr<>nil)then begin
            prev^.next:=aux;
            aux^.next:=curr;
        end
        else begin
            prev^.next:=aux;
            aux^.next:=nil;
        end;
    end;
end;

procedure loadL(var f:list); //a
var
    s:students;
begin
    readS(s);
    while(s.num<>finish)do begin
        InsertSorted(f,s);
        readS(s);
    end;
end;

procedure printL(f:list);
var
    i:range;
begin
    for i:= 1 to dF do begin
        if(f<>nil)then begin
            writeln('------------------------------');
            writeln('El alumno ',i,' con numero: ',f^.data.num,' con apellido: ',f^.data.lname,' tiene un promedio de: ',f^.data.average:2:2);
            f:=f^.next;
        end;
    end;
end;

var
    first:list;
begin
    first:=nil;
    loadL(first);
    writeln('------------------------------');
    writeln('Lista de los mejores 10 promedios que recibiran el premio');
    printL(first);
end.