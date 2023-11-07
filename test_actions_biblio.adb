with Ada.text_io; use Ada.text_io;
with Ada.integer_text_io; use Ada.integer_text_io;
with livre; use livre;
with biblio; use biblio;
with actions_biblio; use actions_biblio;

procedure test_actions_biblio is
-------------------------------
---Déclaration des variables---
-------------------------------

Livre1 : Type_Livre;
Livre2 : Type_Livre;
b1 : Type_Biblio;

TempFloat :Float;
TempBool : Boolean;

begin 
	
	-------------------------------------
	--Entre des informations du livre 1--
	-------------------------------------
	
	Livre1.iD := ('H','a','r','r','y',' ', 'P','o','t');
	Livre1.pret := true;
	Livre1.sumNote := 32.0;
	Livre1.nbPrets := 1;
	
	-------------------------------------
	--Entre des informations du livre 2--
	-------------------------------------
	
	Livre2.iD := ('H','a','r','r','y',' ', 'T','o','p');
	Livre2.pret := false;
	Livre2.sumNote := 33.0;
	Livre2.nbPrets := 4;
	
	b1.livres(1) := Livre1;
	b1.livres(2) := Livre2;
	
	b1.nb_livres:=2;
	
	Put_line("le sous programme nb_livres_disponibles fonctionne ?");
	if nb_livres_disponibles(b1) = 1 then
		Put_line("le programme est ok");
	else
		Put_Line("le programme est ko");
	end if;
	
	--------------------------------------------------------
	--Afficher les livres disponibles dans la bibliotheque--
	--------------------------------------------------------
	
	afficher_livres_dispo(b1);
	
	-----------------------------------------------------------------------
	-- Afficher le livre avec la plus grande moyenne dans la bibliotheque--
	-----------------------------------------------------------------------
	
	Put_line("Le sous programme Livre_Avec_La_Plus_Grande_Note_Moyenne fonctionne ?");
	if Livre_Avec_La_Plus_Grande_Note_Moyenne(b1) = Livre1 then
		Put_line("Le programme est ok");
	else
		Put_Line("le programme est ko");
	end if;
	
	
	----------------------------------------------------------
	--Afficher le livre le moins prete dans une bibliotheque--
	----------------------------------------------------------
	
	Put_line("Le sous programme Livre_Moins_Prete fonctionne ?");
	if Livre_Moins_Prete(b1) = Livre1 then
		Put_line("Le programme est ok");
	else
		Put_Line("le programme est ko");
	end if;
	
	---------------------------------------------------
	--Sous programme pour ajouter une note à un livre--
	---------------------------------------------------
	
	Put_Line("Le sous programme Ajouter_Note fonctionne ?: ");
	TempFloat := Livre1.sumNote;
	Ajouter_Note(Livre1, 12.0);
	if Livre1.sumNote = TempFloat + 12.0 then
		Put_line("Le sous programme est ok");
	else 
		Put_line("Le sous programme est ko");
	end if;
	
	--------------------------------------
	--Change la disponibilite d'un livre--
	--------------------------------------
	
	TempBool := Livre1.pret;
	Changer_Disponibilite(b1, Livre1);
	
	Put_Line("Est-ce que le sous programme Changer_Disponibilite fonctionne ?");
	if Livre1.pret /= TempBool then
		Put_line("Le sous programme est ok");
	else 
		Put_Line("Le sous programme est ko");
	end if;
	
	menu;
	
end test_actions_biblio;