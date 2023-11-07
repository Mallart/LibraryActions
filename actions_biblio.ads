with livre; use livre;
with biblio; use biblio;

package actions_biblio is

	-- Retourne le nombre de livres disponibles
	function Nb_Livres_Disponibles(b: in Type_Biblio) return Integer;

end actions_biblio;