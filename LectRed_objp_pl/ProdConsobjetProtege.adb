
with TEXT_IO; use TEXT_IO;

-- 1 producteur, 1 consommateur, tampon de taille n

procedure ProdConsObjetProtege_pl is

package int_io is new Integer_io(integer);
use int_io;

-- interface Magasinier
protected type Magasinier is
entry debut_lect;
entry debut_red;
procedure fin_lect;
procedure fin_red;

private
nbred, nblect : Integer := 0;
end Magasinier;

M : Magasinier;

-- Interface Producteur
task type Redacteur is end Redacteur;

-- Interface Consommateur
task type Lecteur is end Lecteur;

--body  Magasinier
protected body Magasinier is

entry debut_red
when (nblect + nbred + debut_lect'count = 0) is
begin
nbred := nbred + 1;
put_line("Edition");
end debut_red;

entry debut_lect
when (nbred = 0) is
begin
nblect := nblect + 1;
put_line("Lecture");
end debut_lect;

procedure fin_lect is 
begin
nblect := nblect - 1;
end fin_lect;

procedure fin_red is 
begin
nbred := nbred - 1;
end fin_red;

end Magasinier;

task body Redacteur is
value : Integer := 3;
begin
for i in 1..10 loop
M.debut_red;
M.fin_red;
end loop;
end Redacteur;

task body Lecteur is
value : Integer := 0;
begin
for i in 1..10 loop
M.debut_lect;
M.fin_lect;
end loop;
end Lecteur;

P : Redacteur;
C : Lecteur;
begin
null;
end ProdConsObjetProtege_pl;
