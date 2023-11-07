package livre is

   LENGTH : constant Integer := 9;
   type CharArray is array (1.. LENGTH) of Character;

   type Type_Livre is record
      iD : CharArray ;
      pret : Boolean;
      sumNote : Float;
      nbPrets : Integer;
   end record;

   -- permet de saisir les information d'un livre l
   procedure lire_livre (l : out Type_Livre);

   -- permet d'afficher les information du livre l
   procedure afficher_livre (l : in Type_Livre);

   -- permet de comparer si les livres l1 et l2 sont Ègales
   -- retourne vrai si les livres ont le meme identifiant
   -- retourne false si les livres n'ont pas le meme identifiant
   function "=" (l1 : in Type_Livre; l2 : in Type_Livre) return Boolean;

   -- permet de recuperer le numero d'identifiant du livre l
   function obtenir_identifiant(l : in Type_Livre) return CharArray;

   -- permet de savoir si le livre l est disponible
   -- retourne vrai si le livre est en pret
   -- retourne false si le livre n'est pas en pret
   function est_en_pret  (l : in Type_Livre) return Boolean;

   -- permet de recuperer la note moyenne du livre l
   function calculer_note_moyenne  (l : in Type_Livre) return Float;

   -- permet de recuperer le nombre de fois que le livre l
   -- a été en pret
   function obtenir_nbPrets  (l : in Type_Livre) return Integer;

end livre;
