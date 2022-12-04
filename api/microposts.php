<?php

include 'db.php';

// NECESSARY WHEN VUEJS RUNS IN DEV MODE
if(isset($_GET['session_id'])) {
    $session_id = $_GET['session_id'];
    session_id($session_id);
}

session_start();

// GET MICROPOSTS
if($_SERVER['REQUEST_METHOD'] == 'GET') {


		// ligação à base de dados
		$db = dbconnect($hostname,$db_name,$db_user,$db_passwd);
		if($db) {
			// criar query numa string
			$query  = "select u.name, m.* from microposts as m inner join (users as u) on (u.id=m.user_id) order by m.updated_at desc";
		
			// executar a query
			if(!($result = @ mysqli_query($db, $query)))
				showerror($db);


			// vai buscar o resultado da query

			$nrows  = mysqli_num_rows($result);
			$posts = [];
			for($i=0; $i<$nrows; $i++)
				$posts[$i] = mysqli_fetch_assoc($result);


			// fechar a ligaçãbase de dados
			mysqli_close($db);

			
			// convert to JSON
			$json = json_encode($posts);

			// allow cross-origin requests (CORS)
			header('Access-Control-Allow-Origin: *');
			header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
			header("Access-Control-Allow-Headers: Authorization, Origin, User-Token, X-Requested-With, Content-Type");

			echo $json; 



		} // end if

}

// ADD A NEW POST 
if($_SERVER['REQUEST_METHOD'] == 'POST') {

	if(isset($_SESSION['user_id'])) {

		$json=file_get_contents('php://input');

		$data = json_decode($json, true);

		// ligacao base de dados
		$db = dbconnect($hostname,$db_name,$db_user,$db_passwd);
		if($db) {
			// criar query numa string
			$present_date = date("Y-m-d H:i:s");
			$query  = "INSERT INTO microposts (user_id, content,created_at, updated_at)
			VALUES('" . $_SESSION['user_id'] . "','" . mysqli_real_escape_string($db,$data['content']) . "','" . $present_date . "','". $present_date . "')";
		
			// executar a query
			if(!($result = @ mysqli_query($db, $query)))
				showerror($db);

			// criar query para receber id
			$query  = "SELECT * FROM microposts order by id desc limit 1";

			// executar a query
			if(!($result = @ mysqli_query($db, $query)))
					showerror($db);

			$micropost = mysqli_fetch_assoc($result);

			$jsonMicropost=json_encode($micropost);

			// fechar a ligaço base de dados
			mysqli_close($db);

		} // end if

	}
	// allow cross-origin requests (CORS)
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
	header("Access-Control-Allow-Headers: Authorization, Origin, User-Token, X-Requested-With, Content-Type");
	echo $jsonMicropost;
}


// UPDATE POST
if($_SERVER['REQUEST_METHOD'] == 'PUT') {

	$json=file_get_contents('php://input');

	$data = json_decode($json, true);

	if(isset($_SESSION['user_id']) && isset($_GET['micropost_id'])) {

		// ligação à base de dados
		$db = dbconnect($hostname,$db_name,$db_user,$db_passwd);
		if($db) {
			// criar query numa string
			$query  = "UPDATE microposts SET content='" . mysqli_real_escape_string($db,$data['content']) . "' , updated_at=NOW() WHERE id='" . mysqli_real_escape_string($db,$_GET['micropost_id']) . "' AND user_id='"  . $_SESSION['user_id'] . "'";
		
			// executar a query
			if(!($result = @ mysqli_query($db, $query)))
				showerror($db);
			
			// criar query para receber updated micropost
			$query  = "SELECT * FROM microposts WHERE id='" . mysqli_real_escape_string($db,$_GET['micropost_id']) . "'";

			// executar a query
			if(!($result = @ mysqli_query($db, $query)))
					showerror($db);

			$micropost = mysqli_fetch_assoc($result);
			$jsonMicropost=json_encode($micropost);			

			// fechar a ligação à base de dados
			mysqli_close($db);

		} // end if
	}

	// allow cross-origin requests (CORS)
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
	header("Access-Control-Allow-Headers: Authorization, Origin, User-Token, X-Requested-With, Content-Type");

	echo $jsonMicropost;

}

// DELETE POST
if($_SERVER['REQUEST_METHOD'] == 'DELETE') {

	if(isset($_SESSION['user_id']) && isset($_GET['micropost_id'])) {

		// ligaçãbase de dados
		$db = dbconnect($hostname,$db_name,$db_user,$db_passwd);
		if($db) {
			// criar query numa string
			$query  = "DELETE FROM microposts WHERE id='" . $_GET['micropost_id'] . "' AND user_id='" . $_SESSION['user_id'] . "'";
		
			// executar a query
			if(!($result = @ mysqli_query($db, $query)))
				showerror($db);

			// fechar a ligação à base de dados
			mysqli_close($db);

		} // end if
	}
	// allow cross-origin requests (CORS)
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
	header("Access-Control-Allow-Headers: Authorization, Origin, User-Token, X-Requested-With, Content-Type");
}

// allow cross-origin requests (CORS)
if($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
	header("Access-Control-Allow-Headers: Authorization, Origin, User-Token, X-Requested-With, Content-Type");	
}
?>