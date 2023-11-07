
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body livre is

   procedure lire_livre (l : out Type_Livre) is
      i : Integer;
      c : Integer;
   begin
      Put_line ("                                                                        ");
      Put("Introduire les 9 caracteres correspondant au identifiant du livre: ");

      i := 1;
      while i <= 9 loop
         Get (l.iD(i));
         i := i + 1;
      end loop;

      Put("Saisir :  1 si le livre est en pret ou 0 si le livre est disponible ");
      Get(c);
      if c = 0 then
         l.pret := false;
      else
         l.pret := true;
      end if;

      Put("Introduire la somme de toutes les notes recues par le livre : ");
      Get (l.sumNote);
      while l.sumNote < 0.0 loop
         Put_line("La valeur saisie n'est pas valide ");
         Put("Introduire une nouvelle valeur pour la somme de toutes les notes du livre: ");
         Get (l.sumNote);
      end loop;

      Put("Introduire le nombre de prets : ");
      Get (l.nbPrets);
      while l.nbPrets < 0 loop
         Put_line("La valeur saisie n'est pas valide ");
         Put("Introduire une nouvelle valeur pour le nombre de prets du livre: ");
         Get (l.nbPrets);
      end loop;

   end lire_livre ;



   procedure afficher_livre (l : in Type_Livre) is
      i : Integer;
   begin

      Put_line ("                                                                        ");
      Put_Line  ("############# Informations  ###############");
      Put_line ("                                                                        ");

      Put ("Le livre avec identifiant : ");
      i := 1;
      while i <= 9 loop
         Put (l.iD(i));
         i := i + 1;
      end loop;

      if l.pret then
         Put ("est en pret  : ");
      else
         Put (" est disponible dans la bibliotheque ");
      end if;

      New_Line;

      Put ("il a ete deja note par");
      Put (l.nbPrets);
      Put (" personnes ");

      Put ("et sa note moyenne est egale a");
      Put (l.sumNote/Float(l.nbPrets), exp=>3);
      New_Line;
      Put_line ("                                                                        ");
      Put_line ("                                                                        ");
   end afficher_livre ;

   -- permet de comparer si les livres l1 et l2 sont Ègales
   -- retourne vrai si les livres ont le meme identifiant
   -- retourne false si les livres n'ont pas le meme identifiant
   function "=" (l1 : in Type_Livre; l2 : in Type_Livre) return Boolean is
       i : Integer;
   begin

      i:=1;
      while i<=9 and then l1.iD(i)=l2.iD(i) loop
         i:=i+1;
      end loop;

      if i> 9 then
         return true;
      else
         return false;
      end if;
   end "=" ;

   -- permet de recuperer le numero d'identifiant du livre l
   function obtenir_identifiant(l : in Type_Livre) return CharArray is
   begin
      return l.iD;
   end obtenir_identifiant;

   -- permet de savoir si le livre l est disponible
   -- retourne vrai si le livre est en pret
   -- retourne false si le livre n'est pas en pret
   function est_en_pret  (l : in Type_Livre) return Boolean is
   begin
        return l.pret;
   end  est_en_pret ;

   -- permet de recuperer la note moyenne du livre l
   function calculer_note_moyenne  (l : in Type_Livre) return Float is
   begin
      return (l.sumNote/Float(l.nbPrets));
   end calculer_note_moyenne;

   -- permet de recuperer le nombre de fois que le livre l
   -- a été en pret
   function obtenir_nbPrets  (l : in Type_Livre) return Integer is
   begin
      return (l.nbPrets);
   end obtenir_nbPrets;


end livre;
