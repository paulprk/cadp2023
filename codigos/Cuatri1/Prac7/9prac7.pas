program nine;
const
    dF = 8;
type
    range_gen = 1..dF;
    str20 = string[20];

    critic = record
        dni : integer;
        lnameAndname : str20;
        codMovie : range_gen;
        score : Integer;
    end;

    movie = record
        cod : integer;
        title : str20;
        gen : range_gen;
        score : critic;
    end;

    list = ^node;
    node = record
        data : movie;
        next : list;
    end;

    list2 = ^node2;
    node2 = record
        data : str20;
        next : list2;
    end;

    vcont = array[range_gen]of Integer;

procedure loadL( var f:list );    //Is Avaliable

procedure readC( var c : critic );
begin
    writeln('--------------------------------');
    with c do begin
        write('Enter code of movie: '); readln(codMovie);
        if(codMovie <> -1)then begin
            write('Enter DNI: '); readln(dni);
            write('Enter Name and Last name: '); readln(lnameAndname);
            write('Enter score: '); readln(score);
        end;
    end;
end;

procedure initializeV( var v : vcont );
var
    i : range_gen;
begin
    for i := 1 to dF do
        v[i] := 0;
end;

procedure InsertSorted( var f : list; c : critic );
var
    new1,curr,prev : list;
begin
    new(new1);
    new1^.data.score := c;
    curr := f;
    prev := f;
    while (curr <> nil)and (new1^.data.score.codMovie < curr^.data.cod)do begin
        prev := curr;
        curr := curr^.next;
    end;
    if(curr = prev)then
        f := new1
    else
        prev^.next := new1;
    new1^.next := curr;
end;

procedure UpdateList( var f : list );
var
    c : critic;
begin
    readC(c);
    while(c.codMovie <> -1)do begin
        InsertSorted(f,c);
        readC(c);
    end;
end;

procedure max( v : vcont );
var
    max1,codMax,i : Integer;
begin
    max1 := -1;
    for i := 1 to dF do begin
        if(v[i] > max)then begin
            max1 := v[i];
            codMax := i;
        end;
    end;
    writeln('Code max: ',codMax);
end;

procedure printL( s : list2 );
begin
    writeln('Some count peers and odds: ');
    while(s <> nil)do begin
        writeln(s^.data);
        s := s^.next;
    end;
end;

function ok( dni : integer; lnameAndname : str20 );
var
    peers,odds : Integer;
begin
    peers := 0; odds := 0;
    while(dni <> 0)do begin
        if((dni mod 2)=0)then
            peers += 1
        else
            odds += 1;
        dni := dni div 10;
    end;
    ok := (peers = odds);
end;

procedure addBack( var s : list2; lnameAndname : str20 );
var
    aux,new1 : list2;
begin
    new(new1);
    new1^.data := lnameAndname;
    new1^.next := nil;
    if(s = nil)then
        s := new1
    else
        aux^.next := new1;
    aux := new1;
end;

procedure traverseList( f : list; v:vcont; s : list2 );
begin
    initializeV( v );
    while (f <> nil) do begin
        v[f^.data.score.codMovie] := v[f^.data.score.codMovie] + f^.data.score.score;
        if(ok(f^.data.score.dni,f^.data.score.lnameAndname));
            AddBack(s,f^.data.score.lnameAndname);
        f := f^.next;
    end;
    max(v);
    printL(s);
end;

procedure deleteMovie( var f : list; delete : str20 );
var
    curr,prev : list;
begin
    curr := f;
    prev := f;
    while(curr <> nil)and (delete < curr^.data.title);
        prev := curr;
        curr := curr^.next;
    end;
    if(curr <> nil)and (curr^.data.title = delete)then begin
        if(curr  = f)then
            f := f^.next;
        else
            prev^.next := curr^.next;
        Dispose(curr);
    end;
end;

var
    first : list;
    second : list2
    v : vcont;
    delete : str20;
begin
    first := nil; second := nil;
    loadL( first ); //Is Avaliable
    UpdateList( first );
    traverseList( first,v,second );
    writeln('Enter movie to eliminate: '); readln(delete);
        deleteMovie( first,delete );
end.