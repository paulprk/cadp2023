program seven;
const
    finish=-1;
    dF=7;
type
    categories=1..dF;
    str20=string[20];

    vcont=array[categories]of integer;

    objects=record
        cod:integer;
        categorie:categories;
        nameobject:str20;
        distance:integer;
        discovername:str20;
        year:integer;
    end;

    list=^node;
    node=record
        data:objects;
        next:list;
    end;

    list2=^node2;
    node2=record
        data:string;
        next:list2;
    end;

procedure readO(var o:objects);
begin
    writeln('---------------------------------');
    with o do begin
        write('Enter Code(end -1): '); readln(cod);
        if(cod <> finish)then begin
            write('Enter Categorie(1..7): '); readln(categorie);
            write('Enter Name object: '); readln(nameobject);
            write('Enter distance(light years): '); readln(distance);
            write('Enter Discovers name: '); readln(discovername);
            write('Enter year of discovery: '); readln(year);
        end;
  end;
end;

procedure initializeV(var v:vcont);
var
    i:categories;
begin
    for i:=1 to dF do
        v[i]:=0;
end;

procedure addBack(var f:list;o:objects);
var
    aux,curr:list;
begin
    new(aux);
    aux^.data:=o;
    aux^.next:=Nil;
    if(f = nil)then
        f:=aux
    else begin
        curr:=f;
        while(curr^.next <> nil)do 
            curr:=curr^.next;
        curr^.next:=aux;
    end;
end;

procedure addBackName(var namesStars:list2;nameobject:str20);
var
    aux,curr:list2;
begin
    new(aux);
    aux^.data:=nameobject;
    aux^.next:=Nil;
    if(namesStars = nil)then
        namesStars:=aux
    else begin
        curr:=namesStars;
        while(curr^.next <> nil)do 
            curr:=curr^.next;
        curr^.next:=aux;
    end;
end;

procedure loadL(var f:list);
var
    o:objects;
begin
    readO(o);
    while(o.cod <> finish)do begin
        addBack(f,o);
        readO(o);
    end;
end;

procedure max(var max1,max2:integer;distance,cod:integer;var codMax1,codMax2:integer);
begin
    if (distance > max1)then begin
        codMax2:=codMax1;
        codMax1:=cod;
        max2:=max1;
        max1:=distance;
    end
    else if(distance > max2)then begin
        codMax2:=cod;
        max2:=distance;
    end;
end;

procedure discoverGalileo(year:integer;discover:str20;var cont:integer);
begin
    if(discover = 'Galileo Galilei')and (year < 1600)then
        cont+=1;
end;

procedure addV(var v:vcont;categorie:categories);
begin
    v[categorie]+=1;
end;

procedure printV(v:vcont);
var
    i:categories;
begin
    for i:=1 to dF do 
        writeln('The amount of category: ',i,' had: ',v[i]);
end;

procedure loadLStars(var namesStars:list2;cod:integer;nameobject:str20);
var
    peers,odds:integer;
begin
    peers:=0; odds:=0;
    while(cod <> 0)do begin
        if((cod mod 2)=0)then
            peers+=1
        else
            odds+=1;
        cod:=cod div 10;
    end;
    if(peers > odds)then
        addBackName(namesStars,nameobject);
end;

procedure printL(namesStars:list2);
begin
    while(namesStars <> nil)do begin
    writeln('Name Stars with most peers that odds' );
        writeln(namesStars^.data);
        namesStars:=namesStars^.next;
    end;
end;

procedure TraverseList(f:list;v:vcont);
var
    codMax1,codMax2,cont,max1,max2:Integer;
    namesStars:list2;
begin
    cont:=0; max1:=-1; max2:=-1; namesStars:=nil; codMax1:=0; codMax2:=0;
    while(f <> nil)do begin
        max(max1,max2,f^.data.distance,f^.data.cod,codMax1,codMax2);
        discoverGalileo(f^.data.year,f^.data.discovername,cont);
        AddV(v,f^.data.categorie);
        if(f^.data.categorie = 1)then
            loadLStars(namesStars,f^.data.cod,f^.data.nameobject);
        f:=f^.next;
    end;
    writeln('---------------------------------');
    writeln('2 codes with most distance of the earth are: ',codMax1,' and ',codMax2);
    writeln('---------------------------------');
    writeln('Amount planets discovered by Galileo Galilei before year 1600 are: ',cont);
    writeln('---------------------------------');
    printV(v);
    writeln('---------------------------------');
    printL(namesStars);
end;

var
    first:list;
    v:vcont;
begin
    first:=nil;
    initializeV(v);
    loadL(first);
    TraverseList(first,v);
end.