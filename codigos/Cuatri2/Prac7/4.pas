program cuatro;
const
    dF=42;
type
    rango=1..dF;
    str40=string[40];
    pesoDia=array[rango]of integer;

    paciente=record
        NomyApe:str40;
        peso:pesoDia;
    end;
    lista=^nodo;
    nodo=record
        dato:paciente;
        sig:lista;
    end;

procedure cargarLista(var l:lista;var Vpeso:pesoDia;var dL:integer); //se dispone
procedure recorrerLista(l:lista;Vpeso:pesoDia;dL:integer);
    procedure cadaEmbarzada(NomyApe:str40;Vpeso:pesoDia);
    var
        i:rango;
        max,maxSemana,totalPeso:integer;
    begin
        max:=-1; totalPeso:=0;
        for i:=1 to dF do begin
            if(Vpeso[i] > max)then begin
                max:=Vpeso[i];
                maxSemana:=i;
            end;
            totalPeso:=totalPeso+max;
        end;
        writeln('La paciente: ',NomyApe,' su semana con mayor aumento fue:',maxSemana);
        writeln('El aumento de peso total durante todo el embarazo es de:',totalPeso);
    end;

var
begin
    while(l <> nil)do begin
        cadaEmbarzada(l^.dato.NomyApe,Vpeso);
        l:=l^.sig;
    end;
end;

var
    l:lista;
    dL:integer;
    Vpeso:pesoDia;
begin
    l:=Nil; dL:=0;
    cargarLista(l,Vpeso,dL); //Se dispone
    recorrerLista(l,Vpeso,dL);
end.