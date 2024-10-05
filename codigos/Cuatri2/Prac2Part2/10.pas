program diez;

function cumpleA(c:Char):Boolean;
var
    cumple:Boolean;
begin
    cumple:=true;
    while(c <> '$')and (cumple = true)do begin
        if(c = 'a')or (c = 'e')or (c = 'i')or (c = 'o')or (c = 'u')or (c = 'A')or (c = 'E')or (c = 'I')or (c = 'O')or (c = 'U')then
            cumple:=true
        else
            cumple:=false;
    end;
    cumpleA:=cumple;
end;

function cumpleB(c:Char):Boolean;
var
    cumple:Boolean;
begin
    cumple:=true;
    while(c <> '#')and (cumple = true)do begin
        case c of 
            'b'..'d':   cumple:=true;
            'f'..'h':   cumple:=true;
            'j'..'n':   cumple:=true;
            'p'..'t':   cumple:=true;
            'v'..'z':   cumple:=true;
            'B'..'D':   cumple:=true;
            'F'..'H':   cumple:=true;
            'J'..'N':   cumple:=true;
            'P'..'T':   cumple:=true;
            'V'..'Z':   cumple:=true
        else
            cumple:=false;
    end;
    cumpleB:=cumple;
end;

var
    c:char;
begin
    writeln('Ingrese un caracter:'); readln(c);
    while(c <> '$')do begin
        if(cumpleA(c))then begin
            writeln('Ingrese un caracter:'); readln(c);
            while(c <> '#')do begin
                if(cumpleB(c))then
                writeln('Cumple el patron')
                else
                    writeln('No cumple B');
            end;
        end
        else
            writeln('No cumple A');
    end;
end.