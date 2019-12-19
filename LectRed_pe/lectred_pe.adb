with TEXT_IO; use TEXT_IO;

--sauvegarder ce fichier sous le nom de: ProdCons.adb, et pour compiler lancer: gnatmake ProdCons.adb -o Prodcons

procedure LectRed_pe is
package int_io is new Integer_io(integer);
use int_io;
-- Interface  Magasinier
task type Magasinier is
entry Barriere;
entry debut_lect;
entry fin_lect;
entry debut_red;
entry fin_red;
end Magasinier;

M : Magasinier;
D : Boolean := true;
-- Interface Redacteur
task type Redacteur is end Redacteur;
-- Interface Lecteur
task type Lecteur is end Lecteur;

-- Body Magasinier
task body Magasinier is
cpt : Integer := 0;
nbred, nblect_libre : Integer := 0;
begin
loop
D := true;
select
when (D) => accept Barriere do D := false; end;
or
when (nbred = 0) => accept debut_lect do nblect_libre := nblect_libre + 1; end;
put_line("Lire");
or
when (nblect_libre = 0) => accept debut_red do nbred := nbred + 1; end;
put_line("Ecrire");
or
accept fin_lect do nblect_libre := nblect_libre - 1; end;
or
accept fin_red do nbred := nbred - 1; end;
end select;
end loop;
end Magasinier;

-- Body Redacteur
task body Redacteur is
begin
for i in 1..10 loop
M.Barriere;
M.debut_red;
M.fin_red;
end loop;
end Redacteur;

-- Body Lecteur
task body Lecteur is
begin
for i in 1..10 loop
M.Barriere;
M.debut_lect;
M.fin_lect;
end loop;
end Lecteur;
r : Redacteur;
l : Lecteur;
begin
null;
end LectRed_pe; 
