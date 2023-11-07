with livre; use livre;
with biblio; use biblio;

package actions_biblio is
	
	NOT_ENOUGH_BOOKS_IN_LIBRARY: Exception; -- Levée quand il y a moins d'un livre dans une bibliotheque.

	-- Retourne le nombre de livres disponibles dans la bibliotheque b
	function Nb_Livres_Disponibles(b: in Type_Biblio) return Integer;
	-- Affiche les livres disponibles dans la bibliotheque b
	procedure Afficher_Livres_Dispo(b: in Type_Biblio);
	-- Retourne le livre qui a la plus grande note moyenne
	function Livre_Avec_La_Plus_Grande_Note_Moyenne(b: in Type_Biblio) return Type_Livre;
	-- Retourne le livre le moins prete de la bibliotheque
	function Livre_Moins_Prete(b: in Type_Biblio) return Type_Livre;
end actions_biblio;