{
program alcance4a;
var
    a,b: integer;

procedure uno;
begin
    a := 1;
    writeln(a);
end;

begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.
}

{
program alcance4b;

procedure uno;
begin
    a := 1;
    writeln(a);
end;

var 
    a,b: integer;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.
}

{Las diferencia son que en el primero esta usando variables globales que tienen alcance a todo
el programa, y en el segundo la usa como variables globales al programa principal}