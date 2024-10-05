program twelve;
type
    range = 1..4;
    str20 = string[20];

    vSubs = array[range]of integer;

    vCostSubs = array[range]of real; //Is Avaliable

    client = record
        name : str20;
        dni : integer;
        age : integer;
        typeSub : range;
    end;

    list = ^node;
    node = record
        data : client;
        next : list;
    end;

procedure loadV(var vCS : vCostSubs); //Is Avaliable

procedure readC(var c : client);
begin
    writeln('------------------------');
    with c do begin
        write('Enter dni of client: '); readln(dni);
        if(dni <> 0)then begin
            write('Enter name of client: '); readln(name);
            write('Enter age of client: '); readln(age);
            write('Enter type Sub of client: '); readln(typeSub);
        end;
    end;    
end;

procedure addForward(var f : list; c : client);
var
    aux : list;
begin
    new(aux);
    aux^.data := c;
    aux^.next := f;
    f := aux;
end;

procedure loadL(var f : list);
var
    c : client;
begin   
    readC(c);
    while(c.dni <> 0)do begin
        addForward(f,c);
        readC(c);
    end;
end;

procedure InitializeV(var vS : vSubs);
var
    i : range;
begin
    for i:= 1 to 4 do   
        vS[i]:=0;
end;

procedure moreClients(vS : vSubs);
var
    i : range;
    max1,max2 : integer;
    maxSub1,maxSub2 : integer;
begin
    max1 := -1; max2:= -1;
    for i:= 1 to 4 do begin
        if(vS[i] > max1)then begin
            max2 := max1;
            maxSub2 := maxSub1;
            max1 := vS[i];
            maxSub1 := i;
        end
        else if(vS[i] > max2)then begin
            max2 := vS[i];
            maxSub2 := i;
        end;
    end;
    writeln('The 2 Subs with more Clients are: ',maxSub1,' and ',maxSub2);
end;

procedure InsertSorted(var s : list; c : client);
var 
    new1,prev,curr : list;
begin
    new(new1);
    new1^.data := c;
    prev := s;
    curr := s;
    while(curr <> nil)and (c.dni < curr^.data.dni)do begin
        prev := curr;
        curr := curr^.next;
    end;
    if(curr = prev)then
        s := new1
    else
        prev^.next := new1;
    new1^.next := curr;
end;

procedure TraverseLandV(f : list;vS : vSubs;vCS : vCostSubs);
var
    totalGain : real;
    second : list;
begin
    second := nil;
    totalGain := 0;
    InitializeV(vS);
    while (f <> nil) do begin
        totalGain := totalGain + vCS[f^.data.typeSub];
        vS[f^.data.typeSub] += 1;
        if(f^.data.age > 40)and (f^.data.typeSub = 3)then
            InsertSorted(second,f^.data);
    end;
    writeln('Total gain of fortaco is: ',totalGain:0:2);
    moreClients(vS);
end;

var
    first : list;
    vS : vSubs;
    vCS : vCostSubs;
begin
    loadV(vCS);
    loadL(first);
    TraverseLandV(first,vS,vCS);
end.