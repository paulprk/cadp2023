program twelve;
type
    android=record
        version:real;
        size:integer;
        ram:Integer;
    end;

    list=^nodo;
    nodo=record
        data:android;
        next:list;
    end;

procedure readA(var a:android) //se dispone
procedure InsertSorted(var f:list;a:android) //se disponse
procedure loadL(var f:list) //se dispone

procedure contAndorids(f:list); //a Cantidad de dispositivos de la misma version
var
    contVersion:Integer;
    Currversion:real;
begin
    while(f<>nil)do begin
        Currversion:=f^.data.version;
        contAndorids:=0;
        while(f<>nil)and (f^.data.version = Currversion)do begin
            contVersion+=1;
            f:=f^.next;
        end;
        writeln('De la version: ',Currversion:1:2,' hay un total de: ',contVersion);
    end;
end;

procedure contRAM(f:list);
var
    cont:Integer;
begin
    cont:=0;
    while(f<>nil)do begin
        if(f^.data.ram > 3)and (f^.data.size >= 5)then begin
            cont+=1;
            f:=f^.next;
        end
        else
            f:=f^.next;
        writeln('Dispositivos con mas de de 3GB de ram y pantallas de a lo sumo 5 pulgadas sos: ',cont);
    end;
end;

procedure PromSize(f:list);
var
    promSize,size:real; cont:Integer;
begin
    cont:=0; size:=0;
    while(f<>nil)do begin
        size:=size+f^.data.size;
        cont+=1;
        f:=f^.next;
    end;
    PromSize:=size/cont;
    writeln('El promedio de las pantallas es de: ',PromSize:1:2);
end;

var
    first:list;
begin
    loadL(f) //se dispone
    contAndorids(f);
    contRAM(f);
    PromSize(f);
end;