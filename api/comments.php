<?php

include 'db.php';

// NECESSARY WHEN VUEJS RUNS IN DEV MODE
if(isset($_GET['session_id'])) {
    $session_id = $_GET['session_id'];
    session_id($session_id);
}

session_start();

// GET COMMENTS
if($_SERVER['REQUEST_METHOD'] == 'GET') {


		// ligação à base de dados
		$db = dbconnect($hostname,$db_name,$db_user,$db_passwd);
		if($db) {
			// criar query numa string
			$query  = "select u.name as user_name, c.* from comments as c inner join (users as u) on (u.id=c.user_id)";
		
			// executar a query
			if(!($result = @ mysqli_query($db, $query)))
				showerror($db);


			// vai buscar o resultado da query

			$nrows  = mysqli_num_rows($result);
			$comments = [];
			for($i=0; $i<$nrows; $i++)
				$comments[$i] = mysqli_fetch_assoc($result);


			// fechar a ligaçãbase de dados
			mysqli_close($db);

			
			// convert to JSON
			$json = json_encode($comments);

			// allow cross-origin requests (CORS)
			header('Access-Control-Allow-Origin: *');
			header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
			header("Access-Control-Allow-Headers: Authorization, Origin, User-Token, X-Requested-With, Content-Type");

			echo $json; 



		} // end if

}

// ADD A NEW COMMENT 
if($_SERVER['REQUEST_METHOD'] == 'POST') {

	if(isset($_SESSION['user_id']) && isset($_GET['micropost_id'])) {

		$json=file_get_contents('php://input');

		$data = json_decode($json, true);

		// ligacao `a base de dados
		$db = dbconnect($hostname,$db_name,$db_user,$db_passwd);
		if($db) {
			// criar query numa string
			$present_date = date("Y-m-d H:i:s");
			$query  = "INSERT INTO comments (user_id, content,created_at, micropost_id)
			VALUES('" . $_SESSION['user_id'] . "','" . mysqli_real_escape_string($db,$data['content']) . "','" . $present_date . "','". $_GET['micropost_id'] . "')";
		
			// executar a query
			if(!($result = @ mysqli_query($db, $query)))
				showerror($db);

			// criar query para receber id
			$query  = "SELECT * FROM comments order by id desc limit 1";

			// executar a query
			if(!($result = @ mysqli_query($db, $query)))
					showerror($db);

			$comment = mysqli_fetch_assoc($result);

			$json=json_encode($comment);

			// fechar a ligaço base de dados
			mysqli_close($db);

		} // end if

	}
	// allow cross-origin requests (CORS)
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
	header("Access-Control-Allow-Headers: Authorization, Origin, User-Token, X-Requested-With, Content-Type");
	echo $json;
}




// allow cross-origin requests (CORS)
if($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
	header('Access-Control-Allow-Origin: *');
	header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
	header("Access-Control-Allow-Headers: Authorization, Origin, User-Token, X-Requested-With, Content-Type");	
}
?>