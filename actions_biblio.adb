package body actions_biblio is

	function Nb_Livres_Disponibles(b: in Type_Biblio) return Integer is
		i: Integer := 1;
		nbPret: Integer := 0;
	begin
		while i <= b.nb_Livres loop
			nbPret := (if Est_En_Pret(b.livres(i)) then nbPret + 1 else nbPret);
			i := i + 1;
		end loop;
		return b.nb_Livres - nbPret;
	end Nb_Livres_Disponibles;

	procedure Afficher_Livres_Dispo(b: in Type_Biblio) is
		i: Integer := 1;
	begin
		while i <= b.nb_Livres loop
			if not Est_En_Pret(b.livres(i)) then
				Afficher_Livre(b.livres(i));
			end if;
			i := i + 1;
		end loop;
	end Afficher_Livres_Dispo;
end actions_biblio;