with livre;         use livre;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


package biblio is

   NB_MAX : constant Integer :=200;
   type tab_Livres is array (1.. NB_MAX) of Type_Livre;

   type Type_Biblio is record
      nb_livres : Integer := 0;
      livres : tab_Livres;
   end record;

   -- lit les informations d'une bibliotheque b
   procedure remplir_biblio (b : out Type_Biblio);

   -- affiche les informations d'un parking p
   procedure afficher_biblio (b : in Type_Biblio);

   -- recherche un livre l dans une bibliotheque b
   -- rang designe la position ou a été trouvé
   -- trouve indique si le livre a été trouvé
   procedure trouver_livre (b : in Type_Biblio ; l: in Type_Livre ; rang :out Integer; trouve : out Boolean);

   -- ajoute un libre l à la bibliotheque b apres le derniere livre qui a été stockée
   procedure ajouter_livre (b : in out Type_Biblio ; l: in Type_Livre);

  -- ajoute un libre l à la bibliotheque b dans la position p en considerant l'ordre d'arrivé
   procedure ajouter_livre_pos (b : in out Type_Biblio ; l: in Type_Livre ; pos : in Integer );

   -- supprime le livre qui est arrivé en derniere à la bibliotheque b
   procedure supprimer_livre (b : in out Type_Biblio);

   -- supprime le livre de la bibliotheque b dans la position p
   procedure supprimer_livre_pos (b : in out Type_Biblio ; pos : in Integer );

end biblio;
