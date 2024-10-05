program eleven;
const
    dF = 100;
type

    str20 = string[20];
    range = 1..5;
    countE = 1..dF;
    rangeNum = 1..100;

    events = record
        name : str20;
        typeE : range;
        place : str20;
        maxP : integer;
        cost : real;
    end;

    vEvents = array[countE]of events;

    sale = record
        cod : Integer;
        num : rangeNum;
        dni : Integer;
        countE : Integer;
    end;

    list = ^node;
    node = record
        data : sale;
        next : list;
    end;

procedure loadV(var vE : vEvents); //Is avaliable

procedure readS(var s : sale);
begin
  with s do begin
        write('Enter code of sale: '); readln(cod);
        if(cod <> -1)then begin
            write('Enter number of event: '); readln(num);
            write('Enter dni of buye: '); readln(dni);
            write('Enter number of tickets purchased: '); readln(countE);
        end;
  end;
end;

procedure addForward(var f : list;s : sale);
var
    aux : list;
begin
    new(aux);
    aux^.data:= s;
    aux^.next:= f;
    f:= aux;
end;

procedure loadL(var f : list);
var
    s : sale;
begin
    readS(s);
    while(s.cod <> -1)do begin
        addForward(f,s);
        readS(s);
    end;
end;

procedure min(vE : vEvents;var min1,min2 : real;var name1,name2,Place1,Place2 : str20);
var
    i : countE;
begin
    for i:= 1 to dF do begin
        if(vE[i].cost < min1)then begin
            min2:= min1;
            name2:= name1;
            Place2:= Place1;
            min1:= vE[i].cost;
            name1:= vE[i].name;
            Place1:= vE[i].place;
        end
        else if(vE[i].cost < min2)then begin
            min2:= vE[i].cost;
            name2:= vE[i].name;
            Place2:= vE[i].place;
        end;
    end;
end;

function ok(dni :: integer): boolean;
var
    peers,odds : integer;
begin
    peers:= 0; odds:= 0;
    while(dni <> 0)do begins
        if((dni mod 2)=0)then
            peers += 1
        else
            odds += 1;
    end;
    ok := (peers > odds);
end;

procedure TraverseLandV(f : list;vE : vEvents);
var
    min1,min2 : real;
    name1,name2,Place1,Place2 : str20;
begin
    min1:= 9999; min2:= 9999;
    while(f <> nil)do begin
        min(vE,min1,min2,name1,name2,Place1,Place2);
        for i:= 1 to dF do begin
            if(ok(f^.data.dni))and (vE[i].typeE = 3)then
                    count += 1;
            if(f^.data.num = 50)and (f^.data.countE > vE[i].maxP)then
                writeln('The event 50th reached the limit');
        end;
        f:= f^.next;
    end;
    writeln('The 2 names and places with the lowest collection are: ',name1,' ',Place1,' and ',name2,' ',Place2);
    writeln('Point B: ',count);
end;

var
    vE : vEvents;
    first : list;
begin
    first := nil;
    loadV(vE);
    loadL(first);
    TraverseLandV(first,vE);
end.