program thirteen;
const
    finish='xx';
type
    roles=1..4;

    users=record
        email:string[20];
        rol:roles;
        megazine:string[20];
        days:Integer;
    end;

    list=^nodo;
    nodo=record
        data:users;
        next:list;
    end;

    vcont=array[roles]of Integer;

procedure readS(var s:users); //se dispone  Read Information
begin
    writeln('------------------------------');
    with s do begin
        write('Ingrese el email(FIN XX): '); readln(email);
        if(email<>finish)then begin
            write('Ingrese el rol: '); readln(rol);
            write('Ingrese en la revista que participa: '); readln(megazine);
            write('Ingrese los dias de su ultima conexion: '); readln(days);
        end;
    end;
end;

procedure SetUpV(var v:vcont); //b Set Up in 0 all Vector
var
    i:roles;
begin
    for i:=1 to 4 do 
        v[i]:=0;
end;
 
procedure InserSorted(var f:list;s:users);  //a Sor Ascending
var
    aux,curr,prev:list;
begin
    New(aux); 
    aux^.data:=s; 
    curr:=f; 
    prev:=f;
    while(curr<>nil)and (s.days < curr^.data.days)do begin
        prev:=curr;
        curr:=curr^.next;
    end;
    if(curr=prev)then
        f:=aux
    else
        prev^.next:=aux;
    aux^.next:=curr;
end;

procedure AddV(var v:vcont;rol:integer); //Add roles
begin
    v[rol]:=v[rol]+1;
end;

procedure loadLandV(var f:list;var v:vcont);  //a Load List and Vector
var
    s:users;
begin
    readS(s);
    while(s.email <> finish)do begin
        InserSorted(f,s);
        AddV(v,s.rol);
        readS(s);
    end;
end;

procedure MoreTime(f:list;var emailMax1,emailMax2:string); //c Calculate the maximum days of disconecction
var
    max1,max2:integer;
begin
    max1:=-1; max2:=-1;
    while(f<>nil)do begin
        if(f^.data.days > max1)then begin
            max2:=max1;
            max1:=f^.data.days;
            emailMax2:=emailMax1;
            emailMax1:=f^.data.email;
        end
        else if(f^.data.days > max2)then begin
            max2:=f^.data.days;
            emailMax2:=f^.data.email;
        end;
        f:=f^.next;
    end;
end;

procedure printL(f:list);  //a Print list of megazine Economica
begin
    writeln('------------------------------');
    writeln('Los usuarios de la revista Economica: ');
    writeln('');
    while(f<>nil)do begin
        if(f^.data.megazine = 'Economica')then begin
            writeln('El email es: ',f^.data.email);
            writeln('Ultimo acceso fue hace: ',f^.data.days);
            writeln('------------------------------');
        end;
        f:=f^.next;
    end;
end;

procedure printV(v:vcont); //b Print total roles
var
    i:roles;
begin
    for i:=1 to 4 do
        writeln('Del rol ',i,' hay un total de: ',v[i],'.');
end;

var
    first:list;
    v:vcont;
    emailMax1,emailMax2:String;
begin
    first:=Nil;
    SetUpV(v);  //b SetUp in 0 all Vector
    loadLandV(first,v);  //a Load List and Vector
    MoreTime(first,emailMax1,emailMax2); //c Calculate the maximum days of disconecction
    printL(first);  //a Print List of megazine Economica
    printV(v); //b Print Total roles
    writeln('Los usuarios que mas tiempo llevan sin acceder su email es: ',emailMax1,' y ',emailMax2);
end.