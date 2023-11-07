package body biblio is

    procedure remplir_biblio (b : out Type_Biblio) is
      reponse : Character;
   begin
      b.nb_livres := 1;
      Put_line ("                                                                        ");
      Put("Voulez vous introduir un livre ? ");
      Get(reponse);
      while (reponse = 'O' or reponse = 'o') and  b.nb_livres <=  NB_MAX loop
         lire_livre(b.livres(b.nb_livres));
         Put("Voulez vous introduir un nouveau livre ? ");
         Get(reponse);
          b.nb_livres :=  b.nb_livres + 1;
      end loop;
       b.nb_livres :=   b.nb_livres - 1;
   end remplir_biblio;



   procedure afficher_biblio (b : in Type_Biblio) is
      i: Integer;
   begin
      Put_line ("                                                                        ");
      Put_line  ("################################################");
      Put_Line  ("############# Liste de livres  ###############");
      Put_line  ("################################################");

      i:=1;
       while i <= b.nb_livres loop
         afficher_livre(b.livres(i));
         i := i + 1;
      end loop;
   end afficher_biblio;


   procedure trouver_livre (b : in Type_Biblio ; l: in Type_Livre ; rang :out Integer; trouve : out Boolean) is
      i: Integer;
   begin
      trouve:= false;
      rang:=-1;
      i:=1;
      while i <= b.nb_livres and not trouve loop
         -- test si la voiture correspond à la voiture recherchee
         if b.livres(i) = l then
            trouve := true;
            rang := i;
         end if;
         i := i + 1;
      end loop;
   end trouver_livre;



   procedure ajouter_livre (b : in out Type_Biblio ; l: in Type_Livre) is

   begin

      if b.nb_livres < NB_MAX then
         b.nb_livres := b.nb_livres + 1;
         b.livres(b.nb_livres) := l;
      end if;

   end ajouter_livre;


   procedure ajouter_livre_pos (b : in out Type_Biblio ; l: in Type_Livre ; pos : in Integer ) is
      i: Integer;
   begin
      if b.nb_livres < NB_MAX and pos <= b.nb_livres then
         i:= b.nb_livres;
         while i >= pos loop
            b.livres(i + 1) := b.livres(i);
            i := i - 1;
         end loop;
         b.nb_livres := b.nb_livres + 1;
         b.livres(pos) := l;
      end if;
   end ajouter_livre_pos;


   procedure supprimer_livre (b : in out Type_Biblio) is
   begin
         b.nb_livres := b.nb_livres - 1 ;
   end supprimer_livre;


   procedure supprimer_livre_pos (b : in out Type_Biblio ; pos : in Integer ) is
      i: Integer;
   begin
      if b.nb_livres >= pos and pos >= 1 then

         i:= pos;
         while i < b.nb_livres loop
            b.livres(i) := b.livres(i + 1);
            i := i + 1;
         end loop;
         b.nb_livres := b.nb_livres - 1;
      end if;
   end  supprimer_livre_pos;





end biblio;
