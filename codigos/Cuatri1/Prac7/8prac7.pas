program eight;
type

    rangeCod = 1..7;

    year = record
        year : integer;
        month : string[20];
        day : integer;
    end;

    transfer = record
        sourceAccount : integer;
        dniorigin : integer;
        DestinationAccount : integer;
        dnidestination : integer;
        date : year;    
        hour : integer;
        amount : real;
        ReasonCod : rangeCod;
    end;

    list = ^node;
    node = record
        data : transfer;
        next : list;
    end;

    vcount = array[rangeCod]of integer;

procedure LoadL(var f : list);    //Is Avaliable

procedure initializeV(var vc : vcount);
var
    i : rangeCod;
begin
    for i := 1 to dF do
        vc[i] := 0;
end;

procedure InsertSorted(var s : list; t : transfer);
var
    curr,prev,new1 : list;
begin
    new(new1);
    new1^.data := t;
    curr := s;
    prev := s;
    while(curr <> nil)and (t.sourceAccount < curr^.data.sourceAccount)do begin
        prev := curr;
        curr := curr^.next;
    end;
    if(curr = prev)then
        s := new1
    else
        prev^.next := new1;
    new1^.next := curr;
end;

procedure newList(f : list; var s : list);
begin
    while (f <> nil)do begin
        if(f^.data.sourceAccount <> f^.data.DestinationAccount)then
            InsertSorted(s,f^.data);
        f := f^.next;
    end;
end;

procedure max(vc : vcount);
var
    i : rangeCod;
    max1,codMax : integer;
begin
    max1 := -1;
    for i :=1 to dF do begin
        if(v[i] > max1)then begin
            max1 := v[i];
            codMax := i;
        end;
    end;
    writeln('Code with most transfers: ',codMax);   
end;

function ok(DestinationAccount : integer);
var
    peers,odds : integer;
begin
    peers := 0;
    odds := 0;
    while(DestinationAccount <> 0 )do begin
        if((DestinationAccount mod 2) =0)then
            peers += 1
        else
            odds += 1;
    end;
    ok := (peers < odds);
end;

procedure TraverseList2(s : list; vc : vcount);
var
    add : real;
    accountAct,count : integer;
begin
    count := 0;
    while(s <> nil)do begin
        accountAct := s^.data.sourceAccount;
        add := 0;
        while(s <> nil)and (accountAct = s^.data.sourceAccount)do begin
            add := add + s^.data.amount;
            vc[s^.data.ReasonCod] := vc[s^.data.ReasonCod] + 1;
            if(s^.data.date.month = 'June')and (ok(s^.data.DestinationAccount))then
                count += 1;
        end;
        writeln('Account ',accountAct,' had amount total: ',add);
    end;
    max(vc);
    writeln('Transfers in June are: ',count);
end;

var
    first,second : list;
    vc : vcount;
begin
    first := nil; 
    second := nil;
    LoadL(first);   //Is Avaliable
    initializeV(vc);
    newList(first,second);
    TraverseList2(second,vc);
end.