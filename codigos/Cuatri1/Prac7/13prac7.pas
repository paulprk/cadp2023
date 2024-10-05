program threeteen;
type
    str40 = string[40];
    range = 1..35;

    book = record
        title : str40;
        name : str40;
        pages : integer;
        year : integer;
        sold : Integer;
        cod : range;
    end;

    list = ^node;
    node = record
        data : book;
        next : list;
    end;

    Planeta = record
        name : str40;
        yearOld : integer;
        count : integer;
        solds : real;
    end;

    list2 = ^node2;
    node2 = record
        data : Planeta;
        next : list2;
    end;

procedure readB(var b : book);
begin
    writeln('-----------------------------------');
    with b do begin
        write('Enter title of the book: '); readln(title);
        write('Enter name of editorial: '); readln(name);
        write('Enter total pages of the book: '); readln(pages);
        write('Enter year of edition: '); readln(year);
        write('Enter count sold: '); readln(sold);
        write('Enter code of book(1..35): '); readln(cod);
    end;
end;

procedure addBack(var f : list;b : book);
var
    aux,new1 : list;
begin
    new(new1);
    new1^.data := b;
    new1^.next := Nil;
    if(f = nil)then
        f := new1
    else 
        aux^.next := new1;
    aux := new1;
end;

procedure loadL(var f : list);
var
    b : book;
begin
    repeat
        readB(b);
        AddBack(f,b);
    until(b.title = 'Relato de un naufrago');
end;

procedure readP(var p : Planeta);
begin
    writeln('-----------------------------------');
    with p do begin
        write('Enter name of editorial: '); readln(name);
        if(name <> 'zzz')then begin
            write('Enter year of most old edit: '); readln(yearOld);
            write('Enter count books editing: '); readln(count);
            write('Enter count total of sold: '); readln(solds);
        end;
    end;
end;

procedure addBack2(var s : list2;p : Planeta);
var
    aux,new1 : list2;
begin   
    new(new1);
    new1^.data := p;
    new1^.next := nil;
    if(s = nil)then
        s := new1
    else 
        aux^.next := new1;
    aux := new1;
end;

procedure loadS(var s : list2);
var
    p : Planeta;
begin
    readP(p);
    while(p.name <> 'zzz')do begin
        addBack2(s,p);
        readP(p);
    end;
end;

procedure travereseLandloadS(f : list;var s : list2);
begin
    while(f <> nil)do begin
        if(f^.data.name = 'Planeta Libros')then
            loadS(s);

        f := f^.next;
    end;
end;

var
    first : list;
    second : list2;
begin
    first := nil; second := nil;
    loadL(first);
    travereseLandloadS(first,second);
end.