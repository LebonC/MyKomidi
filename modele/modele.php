<?php
	function getDb() {
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

	function getSpectacles() {
		$db = getDb();
		$requete = $db->query("SELECT ks.*, kg.* FROM kdi_spectacle ks, kdi_genre kg WHERE ks.Gre_code=kg.Gre_code GROUP BY ks.Spe_id");
		return $requete;
	}

	

	function getDescSpectacles($id) {
		$db = getDb();
		$requete = $db->query("SELECT *, Gre_nom FROM kdi_spectacle, kdi_genre WHERE kdi_spectacle.Gre_code = kdi_genre.Gre_code AND Spe_id = $id");
		return $requete;
	}

	if (isset($_GET['Num'])) 
	{		
		$display = json_encode(getDescSpectacles($_GET['Num'])->fetch(PDO::FETCH_ASSOC));
	}
	else
	{
		$display = json_encode(getSpectacles()->fetchAll(PDO::FETCH_ASSOC));
	}
	echo $display;
?>
