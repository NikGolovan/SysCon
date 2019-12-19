with TEXT_IO; use TEXT_IO;

--sauvegarder ce fichier sous le nom de: ProdCons.adb, et pour compiler lancer: gnatmake ProdCons.adb -o Prodcons


-- un producteur et un consommateur avec un tampon de taille N

procedure LectRed_pr is
package int_io is new Integer_io(integer);
use int_io;

-- Interface  Magasinier
task type Magasinier is
entry debut_lect;
entry fin_lect; 
entry debut_red;
entry fin_red;
end Magasinier;

M : Magasinier;
X : Integer := 0;

-- Interface Producteur
task type Lecteur is end Lecteur;

-- Interface consommateur
task type Redacteur is end Redacteur;

-- Body Magasinier
task body Magasinier is
nbred, nblect : Integer := 0;

begin
loop
select
-- si le nombre de production est inf�rieur � la taille du tampon, on peut produire
when (nblect + nbred = 0) => accept debut_lect
do
nblect := nblect + 1;
end;
put_line("Lecture");
or
-- sil y a au moins une production, on peut consommer
when (nblect = 0) => accept debut_red
do nbred := nbred + 1; end;
put_line("Edition");
or 
accept fin_lect do nblect := nblect - 1; end;
or
accept fin_red do nbred := nbred - 1; end;
end select;
end loop;
end Magasinier;
-- corps Redacteur
task body Redacteur is
begin
for i in 1..10 loop
X := X + 1;
M.debut_red;
M.fin_red;
end loop;
end Redacteur;

-- corps Lecteur
task body Lecteur is
begin
for i in 1..10 loop
M.debut_lect;
M.fin_lect;
--Put(X);
end loop;
end Lecteur;
r : Redacteur;
l : Lecteur;
begin
null;
end LectRed_pr;
