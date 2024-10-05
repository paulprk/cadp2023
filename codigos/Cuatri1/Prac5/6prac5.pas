//a
program StaticMemory;
const
    size = 50000;
type
    sizet=1..size;
    buffer=array[sizet]of char;
    puntero=^buffer;

var
    b:buffer;
    p:puntero;
begin
    new(p);
    new(p^);
end.