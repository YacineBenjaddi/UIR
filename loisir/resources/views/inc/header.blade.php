<!DOCTYPE html>
<html>
<head>
	<title>Laravel Homepage</title>
	<link rel="stylesheet" type="text/css" href="{{ url('css/bootstrap.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ url('css/style.css')}}">
	<script type="text/javascript" src="{{url('js/jquery-3.3.1.js')}}"></script>
	<script type="text/javascript" src="{{url('js/bootstrap.js')}}"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="color: rgb(30098B);">
	  <a class="navbar-brand" >UIR LOISIR</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse" >
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active ">
	        <a class="nav-link" href="{{ url('/dashboard')}}">Dashboard <span class="sr-only">(current)</span></a>
	      </li>
	      
	       
           
            <li class="nav-item active">
              <a class="nav-link" href="Terrain">
                <span class="menu-title">Gestion Terrain</span>
                <i class="icon-screen-desktop menu-icon"></i>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="Utilisateur">
                <span class="menu-title">Gestion Utilisateur</span>
                <i class="icon-screen-desktop menu-icon"></i>
              </a>
            </li>
            
            <li class="nav-item active">
              <a class="nav-link" href="Foot">
                <span class="menu-title">Gestion Foot</span>
                <i class=' fas fa-futbol menu-icon'></i>
            
              </a>
             
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="Basket">
                <span class="menu-title">Gestion Basket</span>
        <i class='fas fa-basketball-ball menu-icon'></i>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="Tennis">
                <span class="menu-title">Gestion Tennis</span>
  <i class=' fas fa-baseball-ball menu-icon'></i>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="Piscine">
                <span class="menu-title">Gestion Piscine</span>
            <i class=' fas fa-swimmer menu-icon'></i>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="Musculation">
                <span class="menu-title">Gestion Musculation</span>
             <i class='fas fa-dumbbell menu-icon'></i>

              </a>
            </li>
          

	    </ul>

	  </div>
	</nav>

  <meta charset="UTF-8">
  <title>CodePen - dataTables custom row buttons</title>
  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css'>
<link rel='stylesheet' href='https://cdn.datatables.net/buttons/1.2.2/css/buttons.bootstrap.min.css'><link rel="stylesheet" href="./style.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src= "https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script  src="./script.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-confirmation/1.0.5/bootstrap-confirmation.min.js"></script>
    <meta name="csrf-token" content="{{ csrf_token() }}">


<style>
body {
    color: #566787;
    background: #f5f5f5;
    font-family: 'Varela Round', sans-serif;
    font-size: 13px;
}
.table-responsive {
    margin: 30px 0;
}
.table-wrapper {
    background: #fff;
    padding: 20px 25px;
    border-radius: 3px;
    min-width: 1000px;
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {        
    padding-bottom: 15px;
    background: #435d7d;
    color: #fff;
    padding: 16px 30px;
    min-width: 100%;
    margin: -20px -25px 10px;
    border-radius: 3px 3px 0 0;
}
.table-title h2 {
    margin: 5px 0 0;
    font-size: 24px;
}
.table-title .btn-group {
    float: right;
}
.table-title .btn {
    color: #fff;
    float: right;
    font-size: 13px;
    border: none;
    min-width: 50px;
    border-radius: 2px;
    border: none;
    outline: none !important;
    margin-left: 10px;
}
.table-title .btn i {
    float: left;
    font-size: 21px;
    margin-right: 5px;
}
.table-title .btn span {
    float: left;
    margin-top: 2px;
}
table.table tr th, table.table tr td {
    border-color: #e9e9e9;
    padding: 12px 15px;
    vertical-align: middle;
}
table.table tr th:first-child {
    width: auto;
}
table.table tr th:last-child {
    width: auto;
}
table.table-striped tbody tr:nth-of-type(odd) {
    background-color: #fcfcfc;
}
table.table-striped.table-hover tbody tr:hover {
    background: #f5f5f5;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}   
table.table td:last-child i {
    opacity: 0.9;
    font-size: 22px;
    margin: 0 5px;
}
table.table td a {
    font-weight: bold;
    color: #566787;
    display: inline-block;
    text-decoration: none;
    outline: none !important;
}
table.table td a:hover {
    color: #2196F3;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #F44336;
}
table.table td i {
    font-size: 19px;
}
table.table .avatar {
    border-radius: 50%;
    vertical-align: middle;
    margin-right: 10px;
}
.hint-text {
    float: left;
    margin-top: 10px;
    font-size: 13px;
}    
/* Custom checkbox */
/* Modal styles */
.modal .modal-dialog {
    max-width: 400px;
}
.modal .modal-header, .modal .modal-body, .modal .modal-footer {
    padding: 20px 30px;
}
.modal .modal-content {
    border-radius: 3px;
    font-size: 14px;
}
.modal .modal-footer {
    background: #ecf0f1;
    border-radius: 0 0 3px 3px;
}
.modal .modal-title {
    display: inline-block;
}
.modal .form-control {
    border-radius: 2px;
    box-shadow: none;
    border-color: #dddddd;
}
.modal textarea.form-control {
    resize: vertical;
}
.modal .btn {
    border-radius: 2px;
    min-width: 100px;
}   
.modal form label {
    font-weight: normal;
}   

.dataTables_filter { display: none; }
</style>

</head>