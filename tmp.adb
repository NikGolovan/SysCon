WITH TEXT_IO; use TEXT_IO;

procedure Giratoire is 
package int_io is new Integer_io(integer);
use int_io;
nb_voie : Integer := 4;
subtype type_voie is Integer range 0..nb_voie-1;


-- déclaration de type Carrefour
protected type Carrefour is 
  entry Entrer(type_voie);
  procedure Sortir;
  private 
    voie_courante : Integer := -1;
    nb_voiture_in : Integer := 0;
    nb_voiture_possible : Integer := 20;
    voie : type_voie;
end Carrefour;


-- instance du Carrefour
C : Carrefour;


-- corps du Carrefour
protected body Carrefour is 
  entry Entrer(for voie in type_voie)
    when ((voie_courante = -1) or ((voie_courante = voie) and (nb_voiture_in < nb_voiture_possible))) is 
    begin
      nb_voiture_in := nb_voiture_in + 1;
      voie_courante := voie;
  end Entrer; 


-- corps de la procédure Sortir
  procedure Sortir is 
    occupe : boolean := False;
    voie_regarde : Integer := voie_courante;
    compteur : Integer := 0;
    begin
      voie_courante := -1;
      while((occupe = False) and (compteur < nb_voie)) loop
        if(Entrer(voie_regarde mod nb_voie)'count /= 0) then
          voie_courante := (voie_regarde + nb_voie) mod nb_voie;
          put("La voie est occupee : ");
          put(voie_courante); 
          new_line;
          occupe := True;
        else
          put("La voiture rentre sur la voie : ");
          put(voie_regarde); 
          new_line;
          compteur := compteur + 1;
          voie_regarde := voie_regarde + 1 mod nb_voie;
          voie_courante := voie_courante + 1;
        end if;
      end loop;
      nb_voiture_in := nb_voiture_in - 1;
  end Sortir;
end Carrefour;


-- déclaration de type de Voiture
task type Voiture is end Voiture;
-- le corps de Voiture
task body Voiture is 
  begin
    for i in 1..10 loop
      C.Entrer(i mod nb_voie);
      C.Sortir;
    end loop;
end Voiture;


-- création des instances de Voiture
v1: Voiture;
v2: Voiture;
v3: Voiture;
v4: Voiture;
v5: Voiture;
v6: Voiture;
v7: Voiture;
v8: Voiture;
v9: Voiture;
v10: Voiture;

begin 
null;

end Giratoire;
