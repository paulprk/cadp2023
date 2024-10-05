program ten;
type

    str20 = string[20];

    cropstype = record
        typecrop : str20;
        countHectares : integer;
        months : integer;
    end;

    enterprises = record
        cod : integer;
        name : str20;
        types : str20;
        nameCity : str20;
        crops : cropstype;
    end;

    list = ^node;
    node = record
        data : enterprises;
        next : list;
    end;

procedure readE( var e : enterprises );
begin
    writeln('--------------------------------');
    with e do begin
        write('Enter code of enterprise: '); readln(cod);
        if(cod <> -1)then begin
            write('Enter name of enterprise: '); readln(name);
            write('Enter type(private or public): '); readln(types);
            write('Enter city: '); readln(nameCity);
            write('Enter count Hectares '); readln(crops.countHectares);
            if(crops.countHectares <> 0)then begin
                write('Enter crops type: '); readln(crops.typecrop);
                write('Enter count months: '); readln(crops.months);
            end;
        end;
    end;
end;

procedure addForward( var f : list; e : enterprises );
var
    new1 : list;
begin
    new(new1);
    new1^.data := e;
    new1^.next := f;
    f := new1;
end;

procedure loadL( var f : list );
var
    e : enterprises;
begin   
    readE(e);
    while(e.cod <> -1)do begin
        addForward(f,e);
        readE(e);
    end;
end;

function ok( cod : Integer ): boolean;
var
    zero : integer;
begin
    zero := 0;
    while(cod <> 0)do begin
        if((cod mod 10) = 0)then
            zero += 1;
        cod := cod div 10;
    end;
    ok := (zero >= 2);
end;

procedure max(name : str20;months : integer;var max1 : integer;var nameMax : str20);
begin
    if(months > max1)then begin
        max1 := months;
        nameMax := name;
    end;
end;

procedure IncrementMonths ( var f : list );
var
    typeCulti : str20;
    hecteres : integer;
    typeE : str20;
begin
    typeCulti := f^.data.crops.typecrop;
    hecteres := f^.data.crops.countHectares;
    typeE := f^.data.types;
    if(typeCulti = 'SunFlower')and (hecteres < 5)and (typeE = 'Private')then
        f^.data.crops.months += 1;
end;

procedure traverseList( f : list );
var
    totalHecteres,hecteresSoya,max1 : integer;
    nameMax : str20;
begin
    totalHecteres := 0; hecteresSoya := 0; max1:= -1;
    while(f <> nil)do begin
        if(f^.data.nameCity = 'San Miguel del Monte')and (f^.data.crops.typecrop = 'Wheat')and (ok(f^.data.cod))then
            writeln('Enterprises of San Miguel del Monte that cultivate Wheat are: ',f^.data.name);
        totalHecteres := totalHecteres + f^.data.crops.countHectares;
        if(f^.data.crops.typecrop = 'Soya')then
            hecteresSoya := hecteresSoya + f^.data.crops.countHectares;
        if(f^.data.crops.typecrop = 'Corn')then
            max(f^.data.name,f^.data.crops.months,max1,nameMax);
        IncrementMonths(f);
        f := f^.next;
    end;
    writeln('Have total hectares of soya: ',hecteresSoya,' and its porcentage over total is: ',(hecteresSoya*100)/totalhecteres:0:2,'%');
    writeln('The company that devotes more time to the cultivation of corn is: ',nameMax);
end;

var
    first : list;
begin
    loadL( first );
    traverseList( first );
end.