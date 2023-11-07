with actions_biblio;

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
	
	function Livre_Avec_La_Plus_Grande_Note_Moyenne(b: in Type_Biblio) return Type_Livre is
		i: Integer := 1;
		livrePlusHauteNote: Type_Livre;
	begin
		if b.nb_Livres < 1 then 
			livrePlusHauteNote := b.livres(1);
		else
			raise NOT_ENOUGH_BOOKS_IN_LIBRARY;
		end if;
		while i <= b.nb_Livres loop
			livrePlusHauteNote := (if Calculer_Note_Moyenne(livrePlusHauteNote) < Calculer_Note_Moyenne(b.livres(i)) then b.livres(i) else livrePlusHauteNote);
			i := i + 1;
		end loop;
		return livrePlusHauteNote;
	end Livre_Avec_La_Plus_Grande_Note_Moyenne;
	
	function Livre_Moins_Prete(b: in Type_Biblio) return Type_Livre is
		i: Integer := 1;
		livrePlusPrete: Type_Livre;
	begin
		if b.nb_Livres < 1 then 
			livrePlusPrete := b.livres(1);
		else
			raise NOT_ENOUGH_BOOKS_IN_LIBRARY;
		end if;
		while i <= b.nb_Livres loop
			livrePlusPrete := (if Obtenir_nbPrets(livrePlusPrete) < Obtenir_nbPrets(b.livres(i)) then b.livres(i) else livrePlusPrete);
			i := i + 1;
		end loop;
		return livrePlusPrete;
	end Livre_Moins_Prete;
end actions_biblio;