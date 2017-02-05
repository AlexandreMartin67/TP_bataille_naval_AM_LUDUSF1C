program battail_naval;

uses crt;

CONST
        MAX=5;
type
	liste = array[1..100,1..2] of integer;

type
	cases = record
		x , y : integer;
end;

type
	bateau = record
		tabbateau : array[1..MAX] of cases;
end;

type
	flotte = record
		tabflotte : array[1..2] of bateau;
end;

procedure initialisation(mflotte : flotte);//initialise la flotte à zero

	Var
		i,j :integer
	Begin
		FOR i:=1 TO 2 DO
			FOR y:=1 TO 5 DO
				Begin
					mflotte[i].tabbateau[y].y := 0;
					mflotte[i].tabbateau[y].x := 0;
				End
	End;//initialise la flotte à zero

procedure haut_bas( tabbateau : bateau ; mflotte : flotte ; x , y :cases ; blackliste:liste ; compteur_flotte , compteur_blackliste , taille_bateau , saissie_x , saissie_y , compteur_bateau , compteur_cases :integer);//procedure qui met affecte toute les cases d'un bateau de haut en bas

	Var

		i:integer;
        j:integer;

	Begin
		FOR i:=0 TO taille_bateau-1 DO
			Begin
				IF saissie_x - taille_bateau >0 THEN
					Begin
						FOR j:=1 TO 100 DO
							IF ((blackliste[j,1,compteur_bateau] <> saissie_y) and (blackliste[j,2,compteur_bateau] <> saissie_x-i)) THEN //verifie si les coordonées saissies ,pour savoir si elle appartient a un bateau 
								Begin
									compteur_blackliste[compteur_bateau]:=compteur_blackliste[compteur_bateau]+1;
									blackliste[compteur_blackliste,1,compteur_bateau]:=saissie_y; 
									blackliste[compteur_blackliste,2,compteur_bateau]:=saissie_x;
									mflotte[compteur_bateau].tabbateau[compteur_cases].y := saissie_y;
									mflotte[compteur_bateau].tabbateau[compteur_cases].x := saissie_x -i;
								End;
							Else
								test:=true;
					End;
				Else
					test:=true;
			End;
	End;

procedure bas_haut( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste:liste ; compteur_flotte , compteur_blackliste , taille_bateau , saissie_x , saissie_y , compteur_bateau , compteur_case :integer);//procedure qui met affecte toute les cases d'un bateau de bas en haut

	Begin
		FOR i:=0 TO taille_bateau-1 DO
			Begin
				IF saissie_x + taille_bateau <16 THEN
					Begin
						FOR j:=1 TO 100 DO
							IF ((blackliste[j,1,compteur_bateau] <> saissie_y) and (blackliste[j,2,compteur_bateau] <> saissie_x+i)) THEN//verifie si les coordonées saissies ,pour savoir si elle appartient a un bateau
								Begin
									compteur_blackliste[compteur_bateau]:=compteur_blackliste[compteur_bateau]+1;
									blackliste[compteur_blackliste,1,compteur_bateau]:=saissie_y;
									blackliste[compteur_blackliste,2,compteur_bateau]:=saissie_x;
									mflotte[compteur_bateau].mbateau[compteur_cases].mcases.y := saissie_y;
									mflotte[compteur_bateau].mbateau[compteur_cases].mcases.x := saissie_x +i;
								End;
							Else
								test:=true;
					End;
				Else
					test:=true;
			End;
	End;

procedure largueur( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste:liste ; compteur_flotte , compteur_blackliste , taille_bateau , saissie_x , saissie_y , compteur_bateau , compteur_case :integer);//procedure qui appel permet d'apeller les sous procedure bas haut ou gauche droite

	Begin
		writeln('de bas en haut taper 1');
		writeln('de droite à gauche taper 2');
		readln (choix2);
		IF choix2=1 THEN
			bas_haut;
		IF choix2=2 THEN
			haut_bas;
	End;

procedure droite_gauche( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste:liste ; compteur_flotte , compteur_blackliste , taille_bateau , saissie_x , saissie_y , compteur_bateau , compteur_case :integer);//procedure qui met affecte toute les cases d'un bateau de droite a gauche

	Begin
		FOR i:=0 TO taille_bateau-1 DO
			Begin
				IF saissie_y - taille_bateau >0 THEN
					Begin
						FOR j:=1 TO 100 DO
							IF ((blackliste[j,1,compteur_bateau] <> saissie_y-i) and (blackliste[j,2,compteur_bateau] <> saissie_x)) THEN//verifie si les coordonées saissies ,pour savoir si elle appartient a un bateau
								Begin
									compteur_blackliste[compteur_bateau]:=compteur_blackliste[compteur_bateau]+1;
									blackliste[compteur_blackliste,1,compteur_bateau]:=saissie_y;
									blackliste[compteur_blackliste,2,compteur_bateau]:=saissie_x;
									mflotte[compteur_bateau].mbateau[compteur_cases].mcases.y := saissie_y -i;
									mflotte[compteur_bateau].mbateau[compteur_cases].mcases.x := saissie_x;
								End;
							Else
								test:=true;
					End;
				Else
					test:=true;
			End;
	End;

procedure gauche_droite( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste:liste ; compteur_flotte , compteur_blackliste , taille_bateau , saissie_x , saissie_y , compteur_bateau , compteur_case :intege);//procedure qui met affecte toute les cases d'un bateau de gauche a droite

	Begin
		FOR i:=0 TO taille_bateau-1 DO
			Begin
				IF saissie_y + taille_bateau <16 THEN
					Begin
						FOR j:=1 TO 100 DO
							IF ((blackliste[j,1,compteur_bateau] <> saissie_y+i) and (blackliste[j,2,compteur_bateau] <> saissie_x)) THEN//verifie si les coordonées saissies ,pour savoir si elle appartient a un bateau
								Begin
									compteur_blackliste[compteur_bateau]:=compteur_blackliste[compteur_bateau]+1;
									blackliste[compteur_blackliste,1,compteur_bateau]:=saissie_y;
									blackliste[compteur_blackliste,2,compteur_bateau]:=saissie_x;
									mflotte[compteur_bateau].mbateau[compteur_cases].mcases.x := saissie_x ;
									mflotte[compteur_bateau].mbateau[compteur_cases].mcases.y := saissie_y +i;
								End
							Else
								test:=true;
					End;
				Else
					test:=true;
			End;
	End;

procedure longueur( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste:liste ; compteur_flotte , compteur_blackliste , taille_bateau , saissie_x , saissie_y , compteur_bateau , compteur_case :integer);//procedure qui appel permet d'apeller les sous procedure gauche a droite ou droite a gauche

	Begin
		writeln('de gauche à droite taper 1');
		writeln('de droite à gauche taper 2');
		readln (choix2);
		IF choix2=1 THEN
			gauche_droite;
		IF choix2=2 THEN
			droite_gauche;
	End;
				
procedure creation_case ( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste:liste ; compteur_flotte , compteur_blackliste , taille_bateau , compteur_bateau , compteur_case :integer);//procedure qui demende a l'utilisateur comment il veut placer son bateau , elle permet de crée les cases qui composeront le bateau

	Var

		saissie_x : integer;
		saissie_y : integer;
		choix : integer;
		choix2 : integer;
		i : integer;
		j : integer;
		test : boolean;


	Begin
		REPEAT
			REPEAT
				writeln('entrer la valeur en X');
				readln (saissie_x);
				writeln('entrer la valeur en Y');
				readln (saissie_y);
			UNTIL ((saissie_x < 16) and (saissie_x > 0) and (saissie_y < 16) and (saissie_y > 0));
			REPEAT
				writeln('taper 1 pour le mettre en longueur');
				writeln('taper 2 pour le mettre en largueur');
				readln(choix);
			UNTIL ((choix=1) and (choix=2));
			IF choix = 1 THEN
				longueur;
			IF choix = 2 THEN
				largueur;
		UNTIL(test=false);
	End;

procedure creation_bateau ( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste:liste ; compteur_flotte , compteur_bateau , compteur_blackliste , taille_bateau :integer);//permet de crée les bateau pour la flotte

	Var
		i : integer;
		compteur_cases : integer;
	Begin
		compteur_cases:=0
		FOR i:=1 TO 5 DO
			Begin
				compteur_cases:=compteur_case+1;
				creation_case(mcases : cases);
			End;
	End;

procedure creation_flotte ( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste : liste ;compteur_flotte ; compteur_blackliste :integer);//permet de crée la flotte 

	Var

		i : integer;
		taille_bateau : integer;

	Begin

		taille_bateau :=0;
		compteur_bateau:=0;
		FOR i:=1 TO 2 DO
			Begin
				compteur_bateau:=compteur_bateau+1;
				taille_bateau:=i+1;
				creation_bateau;
			End;

procedure affichage_joueur_1( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste : liste ;compteur_flotte ; compteur_whiteliste :integer);//permet de crée l'interface du joueur 1

	Var

		y : integer;
		i : integer;
		j : integer;
		taille_bateau : integer;
		test : boolean;


	Begin
		clrscr;
		taille_bateau:=1;
		FOR y:=1 TO 5 DO

			Begin
				GoToXY(1,1+(y*5));
				write ('bateau : ',y);
				taille_bateau+1;
				FOR i:=1 TO taille_bateau DO
					Begin
						GoToXY(i+1,1+(y*5));
						FOR j:=1 TO 100 DO
							Begin
								IF ((whiteliste[j,1,2] <> mflotte[1].mbateau[y].mcases.x) and (whiteliste[j,2,2] <> mflotte[1].mbateau[y].mcases.y)) THEN
									test := false
								Else
									test := true
							End;
						IF test = false THEN
							write (mflotte[1].mbateau[y].mcases.x , ' , ' , mflotte[1].mbateau[y].mcases.y);
						Else
							write (mflotte[1].mbateau[y].mcases.x , ' , ' , mflotte[1].mbateau[y].mcases.y) , ' detruit !';
					End;
			End;
		GoToXY(1,30)
		writeln ('liste des cible toucher');
		FOR i:=1 TO 100 DO
			IF ((whiteliste[i,1] <>0) and (whiteliste[i,2] <>0)) THEN
			FOR y:=1 TO 5 DO
				FOR j:=1 TO 100 DO
					Begin
						IF ((whiteliste[j,1] = mflotte[2].mbateau[y].mcases.x) and (whiteliste[j,2] <> mflotte[2].mbateau[y].mcases.y)) THEN
							test := false
						Else
							test := true
					End;
				IF test = false THEN
					write (mflotte[2].mbateau[y].mcases.x , ' , ' , mflotte[2].mbateau[y].mcases.y) ,' tir rate !';
				Else
					write (mflotte[2].mbateau[y].mcases.x , ' , ' , mflotte[2].mbateau[y].mcases.y) ,' bateau ennemi !';
	End;

procedure tir_joueur_1( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste : liste ;compteur_flotte ; compteur_whiteliste :integer);//procedure qui permet au joueur 1 de tirer sur les bateau adverse 

	Var

	i : integer;
	x_attack,y_attack : integer;

	Begin
		REPEAT
			GoToXY(1,10);
			writeln ('entrer la valeur X pour l''attaque');
			readln(x_attack);
			writeln ('entrer la valeur Y pour l''attaque');
			readln(y_attack);
		UNTIL ((x_attack < 16) and (x_attack > 0) and (y_attack < 16) and (y_attack > 0));
		FOR i:=1 TO 5 DO
			Begin
				compteur_whiteliste[1]:=compteur_whiteliste[1]+1;
				IF(( mflotte[2].mbateau[i].mcases.x=x_attack )and( mflotte[2].mbateau[i].mcases.y=y_attack )) THEN
					Begin
						writeln(' tire reussi ! ');
						whiteliste[compteur_whiteliste,1,1]:=y_attack;
						whiteliste[compteur_whiteliste,2,1]:=x_attack;
						mflotte[2].mbateau[i].mcases.x=0;
						mflotte[2].mbateau[i].mcases.x=0;
					End;
				Else
					Begin
						writeln(' tire rate ! ');
						whiteliste[compteur_whiteliste,1,1]:=y_attack;
						whiteliste[compteur_whiteliste,2,1]:=x_attack;
						mflotte[2].mbateau[i].mcases.x=0;
						mflotte[2].mbateau[i].mcases.x=0;
					End;
			End;
	End;

procedure victoire_1( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; win_joueur_1 : boolean);//procedure qui verifie si il reste des bateaux dans l'armee adverse

	Var
		i : integer;

	Begin
		win_joueur_1:=true;
		FOR i:=1 TO 5 DO
			Begin
				IF (( mflotte[1].mbateau[i].mcases.x<>0 )and( mflotte[1].mbateau[i].mcases.y<>0 )) THEN
					win_joueur_1:=false;
	End;

procedure affichage_joueur_2( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste : liste ;compteur_flotte ; compteur_whiteliste :integer);//permet de crée l'interface du joueur 1

	Var

		y : integer;
		i : integer;
		j : integer;
		taille_bateau : integer;
		test : boolean;


	Begin
		clrscr;
		taille_bateau:=1;
		FOR y:=1 TO 5 DO

			Begin
				GoToXY(1,1+(y*5));
				write ('bateau : ',y);
				taille_bateau+1;
				FOR i:=1 TO taille_bateau DO
					Begin
						GoToXY(i+1,1+(y*5));
						FOR j:=1 TO 100 DO
							Begin
								IF ((whiteliste[j,1,1] <> mflotte[2].mbateau[y].mcases.x) and (whiteliste[j,2,1] <> mflotte[2].mbateau[y].mcases.y)) THEN
									test := false
								Else
									test := true
							End;
						IF test = false THEN
							write (mflotte[2].mbateau[y].mcases.x , ' , ' , mflotte[2].mbateau[y].mcases.y);
						Else
							write (mflotte[2].mbateau[y].mcases.x , ' , ' , mflotte[2].mbateau[y].mcases.y) , ' detruit !';
					End;
			End;
		GoToXY(1,30)
		writeln ('liste des cible toucher');
		FOR i:=1 TO 100 DO
			IF ((whiteliste[i,1] <>0) and (whiteliste[i,2] <>0)) THEN
			FOR y:=1 TO 5 DO
				FOR j:=1 TO 100 DO
					Begin
						IF ((whiteliste[j,1] = mflotte[1].mbateau[y].mcases.x) and (whiteliste[j,2] <> mflotte[1].mbateau[y].mcases.y)) THEN
							test := false
						Else
							test := true
					End;
				IF test = false THEN
					write (mflotte[1].mbateau[y].mcases.x , ' , ' , mflotte[1].mbateau[y].mcases.y) ,' tir rate !';
				Else
					write (mflotte[1].mbateau[y].mcases.x , ' , ' , mflotte[1].mbateau[y].mcases.y) ,' bateau ennemi !';
	End;

procedure tir_joueur_2( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; blackliste : liste ;compteur_flotte ; compteur_whiteliste :integer);//procedure qui permet au joueur 2 de tirer sur les bateau adverse

	Var

	i : integer;
	x_attack,y_attack : integer;

	Begin
		REPEAT
			GoToXY(1,10);
			writeln ('entrer la valeur X pour l''attaque');
			readln(x_attack);
			writeln ('entrer la valeur Y pour l''attaque');
			readln(y_attack);
		UNTIL ((x_attack < 16) and (x_attack > 0) and (y_attack < 16) and (y_attack > 0));
		FOR i:=1 TO 5 DO
			Begin
				compteur_whiteliste[2]:=compteur_whiteliste[2]+1;
				IF(( mflotte[1].mbateau[i].mcases.x=x_attack )and( mflotte[1].mbateau[i].mcases.y_attack ) THEN
					Begin
						writeln(' tire reussi ! ');
						whiteliste[compteur_whiteliste,1,2]:=y_attack;
						whiteliste[compteur_whiteliste,2,2]:=x_attack;
					End;
				Else
					Begin
						writeln(' tire rate ! ');
						whiteliste[compteur_whiteliste,1,2]:=y_attack;
						whiteliste[compteur_whiteliste,2,2]:=x_attack;
					End;
			End;
	End;

procedure victoire_2( tabbateau : bateau ; mflotte : flotte ; x , y : cases ; win_joueur_2 : boolean);//procedure qui verifie si il reste des bateaux dans l'armee adverse

	Var
		i : integer;

	Begin
		win_joueur_2:=true;
		FOR i:=1 TO 5 DO
			Begin
				IF (( mflotte[2].mbateau[i].mcases.x<>0 )and( mflotte[2].mbateau[i].mcases.y<>0 )) THEN
					win_joueur_2:=false;
	End;

Var
	
	mflotte : flotte; //variable pour la flotte des deux joueurs
	blackliste : array[1..100,1..2,1..2] of integer; //la blackliste sert a garder en mémoire les coordonné des cases déja occupé par un bateau
	whiteliste : array[1..100,1..2,1..2] of integer; //la whiteliste sert a garder en mémoire les coordonné x et y des tir effectuer 
	compteur_blackliste:array[1..2] of integer; // compteur pour la black liste
	compteur_whiteliste:array[1..2] of integer; // compteur pour la white liste
	i :integer;
	win_joueur_1,win_joueur_2 : boolean;

Begin

	initialisation;
	FOR i:=1 TO 2 DO
		creation_flotte;
	REPEAT
		affichage_joueur_1;
		tir_joueur_1;
		victoire_1;
		IF win_joueur_1 = false THEN
			Begin
				affichage_joueur_2;
				tir_joueur_2;
				victoire_2;
			End;
	UNTIL(win_joueur_2=true or win_joueur_1=true);
	clrscr;
	IF win_joueur_1=true THEN
		writeln('le joueur 1 a gagne !');
	Else
		writeln('le joueur 2 a gagne !');

End.











{
	
	Battail naval :

	réaliser l'aglo et le pascal du jeu bataille naval
	Dans cette version de la battail , vous utiliserez pour representer la grille du jeu , un type enregistrement nommer case afin de décrire les case occupé par les bateau , de même un bateau sera décrit par un ensemble de case et la flotte de bateau a
	coulé sera représenter par un ensemble de bateau

	travail a faire
	ecrire le type enregistement case composé de deux champs ( ligne et colone )
	ecrire le type enregistement bateau composé d'un emsemble n de case (tableau)
	ecrire la structure flotte composé d'un emsemble de bateau
	ecrire une fonction de création d'un case elle prend en paramétre la ligne et la colone
	ecrire une fonction de comparaison de deux case cette foncion renvoie vrai ou faux
	ecrire une fonction de création de bateau elle renvoie une structure bateau correctement remplis
	ecrire une fonction qui verifie qu'une case apparatient a un bateau elle renvoie vrai ou faux ! attention ! cette fonction de vérification devra utiliser la fonction de comparaison de case
	ecrire une fonction qui vérifie qu'une case appartient a une flotte de bateau , attention ! cette fonction de vérification devra utiliser la fonction de vérification pour un bateau
	ecrire la battail naval complete

}
