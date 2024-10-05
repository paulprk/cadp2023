procedure cortedecontrol();
var
    actual:tipo de dato;
    contador;
begin
    leerR(r);
    while(r.campo<>'fin programa')do begin
        actual:=r.campo;
        contador:=0
        while(r.campo<>'fin programa')and (r.campo=actual)do begin
            contador+=contador+r.campo;
            leerR(r);
        end;
        writeln('Informar ',contador,' de: ',actual);
    end;
end;