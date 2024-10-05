program siete;
const
    fin=-1;
type
    contador=array[0..9] of integer;
procedure descomponerDigitos(n:integer; var c:contador);
var
    dig:integer;
begin
    while(n<>0)do begin
        dig:=n mod 10;  {procesar digito}
        c[dig]:=c[dig]+1;
        n:=n div 10;
    end;
end;

procedure inicializarVector( var v:contador);
var
    i:integer;
begin
    for i:=0 to 9 do begin
        v[i]:=0;
    end;
end;

procedure informarOcurrencia(c:contador);
var
    i:integer;
begin
    for i:=0 to 9 do begin
        if(c[i]>0)then
            writeln('Numero ', i,': ',c[i],' veces');
    end;
end;

function digitoMasLeido(c:contador):integer;
var
    i,max,digMax:integer;
begin
    max:=-1;
    for i:=0 to 9 do begin
        if(c[i]>max)then begin
            max:=c[i];
            digMax:=i;
        end;
    end;
    digitoMasLeido:=digMax;
end;

procedure informarNOOcurrencia(c:contador);
var
    i:integer;
begin
    write('Los digitos que no tuvieron ocurrencias son: ');
    for i:=0 to 9 do begin
        if(c[i]=0)then
            write(i,', ');
    end;
    writeln();
end;

var
    cont:contador;
    aux:integer;
begin
    inicializarVector(cont);
    writeln('Ingrese un numero(finaliza -1)'); readln(aux);
    while(aux<>fin)do begin
        descomponerDigitos(aux,cont);
        writeln('Ingrese un numero(finaliza -1)'); readln(aux);
    end;
    informarOcurrencia(cont);
    writeln('El digito mas leido fue el ',digitoMasLeido(cont));
    informarNOOcurrencia(cont);
end.