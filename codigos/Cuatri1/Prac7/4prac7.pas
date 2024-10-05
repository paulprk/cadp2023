program four;
type
    VcontWeek=array[1..42]of real;
    patient=record
        name:string[20];
        lname:string[20];
        fweek:VcontWeek;
        contweeks:integer;
    end;

    list=^nodo;
    nodo=record
        data:patient;
        next:list;
    end;

procedure loadV(var v:VcontWeek); //Is avaliable
procedure readP(var p:patient);  //Is avaliable
procedure loadL(var f:list); //Is Avaliable

procedure max(num:integer;weigh:real;var weightMax:real;var weekMax:integer);
begin
    if(weigh > weightMax)then begin
        weightMax:=weigh;
        weekMax:=num;
    end;
end;

procedure weekMaxWeight(v:VcontWeek;contweeks:Integer;var weekMax:integer);
var
    i:integer;
    weightMax:real;
begin   
    weightMax:=0;
    for i:=2 to contweeks do begin
        max(i,v[i],weightMax,weekMax);
    weekMax-=1;
end;

procedure traverseL(f:list);
var
    weightGain:real;
    weekMax:integer;
begin   
    while(f<>nil)do begin
        weekMax:=0;
        weekMaxWeight(f^.data.fweek,f^.data.contweeks,weekMax);




        f:=f^.next;
    end;
end;

var
    first:list;
begin
    first:=nil;
    loadL(first); //Is avaliable
    traverseL(first);
end.