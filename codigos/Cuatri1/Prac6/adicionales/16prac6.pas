program sixteen;
type

    str40=string[40];

    runner=record
        lnameAndname:str40;
        distance:integer;
        time:real;
        countryAndCity:str40;
        cityEnd:str40;
    end;

    list=^node;
    node=record
        data:runner;
        next:list;
    end;

procedure readR(var r:runner);
begin
    writeln('-------------------------------');
    with r do begin
        write('Enter Name And Last Name: '); readln(lnameAndname);
        write('Enter distance: '); readln(distance);
        if(distance <> -1)then begin
            write('Enter Time: '); readln(time);
            write('Enter County And City: '); readln(countryAndCity);
            write('Enter End City: '); readln(cityEnd);
        end;
    end;
end;

procedure AddBack(var f:list;r:runner);
var
    aux,new1:list;
begin
    new(new1);
    new1^.data:=r;
    new1^.next:=nil;
    if(f = nil)then
        f:=new1
    else begin
        aux:=f;
        while(aux^.next <> nil) do
            aux:=aux^.next;
        aux^.next:=new1;
    end;    
end;

procedure loadL(var f:list);
var
    r:runner;
begin
    readR(r);
    while(r.distance <> -1)do begin
        AddBack(f,r);
        readR(r);
    end;
end;

var
    first:list;
    CityMax:str40;
begin
    first:=nil;
    loadL(first);
    Inform(first);
    Max(first,CityMax);
end.
