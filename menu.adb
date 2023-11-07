with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with livre; use livre;
with biblio; use biblio;
with actions_biblio; use actions_biblio;

procedure menu is

	procedure Entrer_Entier(n: out Integer) is
	begin
		Put_Line("Veuillez entrer un nombre entier pour cette commande: ");
		Get(n);
	end Entrer_Entier;
	
	procedure Help_Message is
	begin
		Put_Line("--- Commandes disponibles: ---");
		Put_Line("0 - Remplissage de la bibliotheque manuellement a partir du clavier");
		Put_Line("1 - Afficher la liste de livres de la bibliotheque");
		Put_Line("2 - Trouver un livre dans la bibliotheque");
		Put_Line("3 - Ajouter un livre dans la bibliotheque");
		Put_Line("4 - Ajouter un livre dans la bibliotheque dans une position donnee");
		Put_Line("5 - Supprimer un livre dans la bibliotheque");
		Put_Line("6 - Supprimer un livre dans la bibliotheque dans une position donnee");
		Put_Line("7 - Calculer le nombre de livres disponibles");
		Put_Line("8 - Obtenir le livre avec la plus grande note moyenne");
		Put_Line("9 - Obtenir le livre avec le livre moins prete");
		Put_Line("10 - Ajouter une note pour un livre donne");
		Put_Line("11 - Changer la disponibilite d’un livre");
		Put_Line("12 - Affiche ce message");
		Put_Line("autre - Sortir du programme");
		Put_Line("Entrer une commande: ");
	end Help_Message;

	command: Integer;
	biblio: Type_Biblio;
	livre: Type_Livre;
	index: Integer;
	generalFloat: Float;
	generalBool: Boolean;
begin
	Help_Message;
	loop
		Get(command);
		New_Line;
		case command is
			when 0 =>
				Remplir_Biblio(biblio);
			when 1 =>
				Afficher_Biblio(biblio);
			when 2 =>
				Lire_Livre(livre);
				Trouver_Livre(biblio, livre, index, generalBool);
				Afficher_Livre(biblio.livres(index));
			when 3 =>
				Lire_Livre(livre);
				Ajouter_Livre(biblio, livre);
			when 4 =>
				Lire_Livre(livre);
				Entrer_Entier(index);
				Ajouter_Livre_Pos(biblio, livre, index);
			when 5 =>
				Supprimer_Livre(biblio);
			when 6 =>
				Entrer_Entier(index);
				Supprimer_Livre_Pos(biblio, index);
			when 7 =>
				Put(Nb_Livres_Disponibles(biblio));
			when 8 =>
				Afficher_Livre(Livre_Avec_La_Plus_Grande_Note_Moyenne(biblio));
			when 9 => 
				Afficher_Livre(Livre_Moins_Prete(biblio));
			when 10 =>
				Lire_Livre(livre);
				Put_Line("Veuillez entrer un nombre flottant pour cette commande: ");
				Get(generalFloat);
				Ajouter_Note(livre, generalFloat);
			when 11 =>
				Lire_Livre(livre);
				Changer_Disponibilite(biblio, livre);
			when 12 =>
				Help_Message;
			when others =>
				exit;
		end case;
	end loop;
	Put_Line("Au revoir bebou"); -- ENLEVER CETTE MERDE
end menu;