<?php 
	function getCnx() 
	{
		// Paramètres de connexion 
	    $PARAM_sgbd         ="mysql";       // SGBDR
	    $PARAM_hote         ="mysql-lebonc.alwaysdata.net";   // le chemin vers le serveur
	    $PARAM_port         ="3306";        // Port de connexion
	    $PARAM_nom_bd       ="lebonc_db_komidi";   // le nom de votre base de données
	    $PARAM_utilisateur  ="lebonc";        // nom utilisateur
	    $PARAM_mot_passe    ="root";            // mot de passe utilisateur
	    $PARAM_dsn          =$PARAM_sgbd.":host=".$PARAM_hote.";dbname=".$PARAM_nom_bd; // Nom de la source de données

	    $dboptions = array(
	    PDO::ATTR_PERSISTENT => FALSE,
	    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
	    PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING,
	    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",);

	    $cnx = new PDO($PARAM_dsn, $PARAM_utilisateur, $PARAM_mot_passe, $dboptions);
	    return $cnx;
	}
	function getUser()
	{
		$cnx = getCnx();
		return $cnx->query('SELECT * FROM kdi_utilisateur;');
	}
	function newUser()
	{
		$cnx = getCnx();
		$cnx->query('INSERT INTO kdi_utilisateur VALUES("'.$_GET['email'].'", "'.$_GET['mdp'].'", "'.$_GET['nom'].'", "'.$_GET['prenom'].'", NULL, 0);');
	}
	function getSpectacles()
	{
		$cnx = getCnx();
		return $cnx->query('SELECT kdi_note.Spe_id, Spe_titre, AVG(Note) AS Note, COUNT(Note) AS NbNote
							FROM kdi_spectacle LEFT OUTER JOIN kdi_note ON kdi_spectacle.Spe_id = kdi_note.Spe_id
							GROUP BY kdi_spectacle.Spe_id
							ORDER BY Note DESC
							LIMIT 5;
						   ');
	}
	function getSpectaclesRandom()
	{
		$cnx = getCnx();
		return $cnx->query('SELECT kdi_note.Spe_id, Spe_titre, AVG(Note) AS Note, COUNT(Note) AS NbNote, 0 AS Random
							FROM kdi_spectacle LEFT OUTER JOIN kdi_note ON kdi_spectacle.Spe_id = kdi_note.Spe_id
							GROUP BY kdi_spectacle.Spe_id
							ORDER BY RAND()
						   ');
	}

	$affiche = json_encode(getUser()->fetchAll(PDO::FETCH_ASSOC));
	$len = strlen($affiche)-1;
	$affiche[$len] = ",";
	$affiche.= json_encode(getSpectacles()->fetchAll(PDO::FETCH_ASSOC));
	$affiche[$len+1] = " ";
	$len = strlen($affiche)-1;
	$affiche[$len] = ",";
	$affiche.= json_encode(getSpectaclesRandom()->fetchAll(PDO::FETCH_ASSOC));
	$affiche[$len+1] = " ";
	echo $affiche;
	if (isset($_GET['nom'])) 
	{
		newUser();
	}
?>