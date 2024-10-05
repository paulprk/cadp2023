program fifteen;
const
    dF=5;
type
    turns=1..dF;
    str20=string[40];

    students=record;
        dni:integer;
        lnameAndname:str20;
        grade=integer;
    end;

    list:=^node;
    node=record;
        data:students;
        next:list;
    end;

    Vturn=array[turns]of students;

procedure loadL(var f:list);    //Is Avaliable

procedure initializeV(var v:vturn);
var
    i:turns;
begin
    for i:=1 to dF do
        v[i];
end;

procedure traverseList(f:list;v:vturn);
var

begin
    while (f <> nil)do begin
        if(f^.data.grade >= 8)and (f^.data.grade <= 9)then
            v[1]:=f^.data;
        if(f^.data.grade >=10)then
            v[4]:=f^.data;
        

        f:=f^.next;
    end;
end;

var
    first:list;
    v:vturn;
begin
    loadL(first); //Is Avaliable
    initializeV(v);
    TraverseList(first,v);
end.
