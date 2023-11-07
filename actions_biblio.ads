with livre; use livre;
with biblio; use biblio;

package actions_biblio is

	-- Retourne le nombre de livres disponibles dans la bibliotheque b
	function Nb_Livres_Disponibles(b: in Type_Biblio) return Integer;
	-- Affiche les livres disponibles dans la bibliotheque b
	procedure afficher_livres_dispo(b: in Type_Biblio);
end actions_biblio;