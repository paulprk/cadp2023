program seis;
type
    str20=string[20];
    microprocesador=record
        marca:str20;
        linea:str20;
        cores:integer;
        reloj:real;
        nm:integer; 
    end;
procedure leer(var m:microprocesador);
begin
    with m do 
    begin
        writeln('Ingrese la cantidad de cores');
            readln(cores);
        if(m.cores<>0)then
        begin
            writeln('Ingrese la marca');
                readln(marca);
            writeln('Ingrese la linea');
                readln(linea);
            writeln('Ingrese la velocidad de reloj en Ghz');
                readln(reloj);
            writeln('Ingrese el tamanio en nanometros(nm)');
                readln(nm);
        end;
        writeln('-------------------------------------');
    end;
end;
procedure calcularmaximo(var max1,max2:integer;cant:integer;marcaAct:str20;var marcaMax1,marcaMax2:str20);
begin
    if(cant>max1)then
    begin
        max2:=max1;
        max1:=cant;
        marcaMax2:=marcaMax1;
        marcaMax1:=marcaAct;
    end
    else if (cant>max2)then
    begin
        max2:=cant;
        marcaMax2:=marcaAct;
    end;
end;
procedure procesar();
var
    m:microprocesador;
    marcaAct,marcaMax1,marcaMax2:str20;
    cant,cant2,max1,max2:integer;
begin
    marcaMax1:='';
    marcaMax2:='';
    max1:=-1;
    max2:=-1;
    cant2:=0;
    leer(m);
    while(m.cores<>0)do
    begin
        marcaAct:=m.marca;
        cant:=0;
        while(m.cores<>0)and (marcaAct=m.marca)do
        begin
            if(m.cores>1)and (m.reloj>=2)and (m.marca='Intel')or (m.marca='AMD')then
                cant2:=cant2+1;
            if(m.cores>2)and (m.nm<=22)then
                writeln('La marca ',marcaAct,' de la linea ',m.linea,' tiene mas de 2 cores y transistores menores o igual a 22nm');
            if(m.nm=14)then
                cant:=cant+1;
            writeln('-------------------------------------');
            leer(m);
        end;
        calcularmaximo(max1,max2,cant,marcaAct,marcaMax1,marcaMax2);
    end;
    writeln('La primera marca con mayor cantidad de transistores de 14nm fue: ',marcaMax1);
    writeln('La segunda marca con mayor cantidad de transistores de 14nm fue: ',marcaMax2);
    writeln('Procesadores multicore Intel o AMD, con relojes mayores a 2Ghz fueron: ',cant2);
end;
begin
    procesar();
end.