program siete;
const
    dF=7;
    finish='GAIA';
type
    spectre=1..7;
    Rsonas=record
        nom:string;
        time:integer;
        cost:real;
        costmonth:real;
        categories:spectre;
    end;

    list=^nodo;
    nodo=record
        data:Rsonas;
        next:list;
    end;

    listname=^nodoname;
    nodoname=record
        data:string;
        next:listname;
    end;

    listok=^nodook;
    nodook=record
        data:Rsonas;
        next:listok;
    end;

    listNOTok=^nodoNOTok;
    nodoNOTok=record
        data:Rsonas;
        next:listNOTok;
    end;

    vcounter=array[spectre]of integer;

procedure initializeV(var v:vcounter);
var
    i:spectre;
begin
    for i:=1 to dF do begin
        v[i]:=0;
    end;
end;

procedure readR(var r:Rsonas);
begin
    writeln('----------------------------');
    with r do begin
        write('Ingrese el nombre de sonda: '); readln(nom);
        write('Ingrese duracion de la mision: '); readln(time);
        write('Ingrese el costo de construccion: '); readln(cost);
        write('Ingrese el costo mensual de mantenimiento: '); readln(costmonth);
        write('Ingrese el numero de espectro: '); readln(categories);
    end;
end;

procedure addForward(var f:list;r:Rsonas);
var
    neww:list;
begin
    new(neww);
    neww^.data:=r;
    neww^.next:=f;
    f:=neww;
end;

procedure addForwardName(name:string;var fName:listname);
var
    newwName:listname;
begin
    new(newwName);
    newwName^.data:=name;
    newwName^.next:=fName;
    fName:=newwName;
end;

procedure addForwardOK(r:Rsonas;var fOK:listok);
var
    neww:listok;
begin
    new(neww);
    neww^.data:=r;
    neww^.next:=fOK;
    fOK:=neww;
end;

procedure addForwardNOTok(r:Rsonas;var fNOTok:listNOTok);
var
    neww:listNOTok;
begin
    new(neww);
    neww^.data:=r;
    neww^.next:=fNOTok;
    fNOTok:=neww;
end;

procedure max(f:list;var nomMax:string;var maxx:real);
var
    addtotal:real;
begin
    addtotal:=0;
    addtotal:=f^.data.cost+f^.data.costmonth;
    if(addtotal > maxx)then begin
        maxx:=addtotal;
        nomMax:=f^.data.nom;
    end;
end;

procedure addSondas(categories:integer;var v:vcounter);
begin
    v[categories]:=v[categories]+1;
end;

procedure promtime(time:integer;var count:integer;var averageT,average:real);
begin
    count+=1;
    averageT:=averageT+time;
    average:=averageT/count;
end;

procedure promCostTotal(cost:real;var promCostT,promCost:real;var countCost:integer);
begin
    countCost+=1;
    promCostT:=promCostT+cost;
    promCost:=promCostT/countCost;
end;

function passSonda(cost,costmonth:real;categories:Integer):boolean;
var
    ok:Boolean;
begin
    ok:=False;
    if(costmonth < cost)and (categories<>1)then
        ok:=true;
    passSonda:=ok;
end;

function priceTotal(cost,costmonth:real):real;
var
    add:Real;
begin
    add:=0;
    add:=cost+costmonth;
    priceTotal:=add;
end;

procedure loadandProcessL(var f:list;var nomMax:string;var v:vcounter;var countMax:integer;var fName:listname;var fOK:listok;var fNOTok:listNOTok;var TotalNOok:real);
var
    r:Rsonas; maxx,average,averageT,promCostT,promCost:real; count,countCost:integer; ok:Boolean;
begin   
    maxx:=-1; count:=0; countMax:=0; averageT:=0; average:=0; countCost:=0; promCostT:=0; promCost:=0;
    repeat
        readR(r);
        addForward(f,r);

        max(f,nomMax,maxx);

        addSondas(f^.data.categories,v);

        promtime(f^.data.time,count,averageT,average);
        if(f^.data.time > average)then 
            countMax+=1;
        
        promCostTotal(f^.data.cost,promCostT,promCost,countCost); 
        while(f^.data.cost > promCost)and (f<>nil)do begin
            addForwardName(f^.data.nom,fName);
            f:=f^.next;
        end;

        ok:=passSonda(f^.data.cost,f^.data.costmonth,f^.data.categories); //a
        
        if(ok=true)then //b
            addForwardOK(r,fOK)
        else if(ok=False)then begin
            addForwardNOTok(r,fNOTok);
                TotalNOok:=priceTotal(fNOTok^.data.cost,fNOTok^.data.costmonth); //c
        end;

    until(r.nom=finish);
    writeln('----------------------------');
    writeln('El promedio de tiempo es: ',average:0:2);
    writeln('El costo promedio de construccion es de: ',promCost:0:2);
    writeln('----------------------------');
end;

procedure printV(v:vcounter);
var
    i:spectre;
begin
    for i:=1 to dF do
        writeln('El espectro ',i,' realizo un total de: ',v[i],' estudios.');
end;

procedure printListName(fName:listname);
begin
    Writeln('Los nombres de las sondas que superan es coste promedio son: ');
    while(fName <> nil)do begin
        writeln(fName^.data);
        fName:=fName^.next;
    end;
end;

var
    first:list; firstName:listname; firstOK:listok; firstNOTok:listNOTok;
    nomMax:string;
    v:vcounter;
    countMax:integer;
    TotalNOok:real;
begin
    first:=nil; firstName:=nil; firstOK:=nil; firstNOTok:=nil;
    initializeV(v);
    loadandProcessL(first,nomMax,v,countMax,firstName,firstOK,firstNOTok,TotalNOok);
        writeln('La sonda mas costosa es: ',nomMax);
    printV(v);
        writeln('Las sondas que superan el promedio de tiempo son: ',countMax);
    printListName(firstName);
        writeln('El total del precio de los proyectos que NO seran financiados es: ',TotalNOok:0:2);
end.
