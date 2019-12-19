with TEXT_IO; use TEXT_IO;

procedure Carrefour is
package int_io is new Integer_io(integer);
use int_io;

nbvoie_total : Integer := 5;
subtype type_voie is Integer range 0..nbvoie_total-1;
task type Voiture is end Voiture;

--V1 : Voiture(1);
--V2 : Voiture(2);
--V3 : Voiture(3);
--V4 : Voiture(4);

protected type Giratoire is 
entry entrer(type_voie);
procedure sortir; 

private
cap_max : Integer := 20;
nb_vehicules : Integer := 0;
voie_courant : Integer := -1;
end Giratoire;

protected body Giratoire is 
--entry entrer(for voie in type_voie) loop
entry entrer(2)
voie_courant := voie;
when ((carrefour_vide or carrefour_pris) and (nb_vehicules <= cap_max)) is
begin
nb_vehicules := nb_vehicules + 1;
voie_courant := voie;
end entrer;
end Giratoire;

procedure sortir is
begin
nb_vehicules := nb_vehicules -1;

end sortir;

begin
null;
end Carrefour;
