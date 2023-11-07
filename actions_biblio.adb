package body actions_biblio is

	function Nb_Livres_Disponibles(b: in Type_Biblio) return Integer is
		i: Integer := 1;
		nbPret: Integer := 0;
	begin
		while i < b.nb_Livres loop
			nbPret := (if Est_En_Pret(b.livres(i)) then nbPret + 1 else nbPret);
			i := i + 1;
		end loop;
		return b.nb_Livres - nbPret;
	end Nb_Livres_Disponibles;

end actions_biblio;