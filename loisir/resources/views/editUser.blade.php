@include('inc.header')
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form class="form-horizontal" enctype="multipart/form-data" method="POST" action="{{ url('/editUser',array($users->id_user)) }}">
					<input type="hidden" name="_token" value="{{ csrf_token() }}">
				  <fieldset>
				    
				    <div class="form-group">
				      <label  class="col-lg-2 control-label">nom</label>
				      <div class="col-lg-10">
				      	<input type="text" name="last_name" class="form-control" id="last_name" placeholder="last_name" value="<?php echo $users->last_name; ?>">
				      </div>
				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">prenom</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="first_name" class="form-control" placeholder="first_name" id="first_name" value="<?php echo $users->first_name; ?>">
				      </div>
				 	</div>
				
				 	 
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">email</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="email" class="form-control" placeholder="email"  id="email" value="<?php echo $users->email; ?>">
				      </div>
				 	</div>
				 		<div class="form-group">
				      <label  class="col-lg-2 control-label">mot de passe</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="password" class="form-control" placeholder="password" id="password" value="<?php echo $users->password; ?>">
				      </div>
				 	</div>

<div class="form-group">
           <fieldset data-role="controlgroup">
      <label>Sexe :</label>
        <label for="male">Homme</label>
        <input type="radio" name="gender" id="gender" value="male" checked>
        <label for="female">Femme</label>
        <input type="radio" name="gender" id="gender" value="female">
      </fieldset>
          </div> 				 	
				 

				 

				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">Code</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="code" class="form-control" placeholder="code" id="code" value="<?php echo $users->code; ?>">
				      </div>
				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">Annee</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="year" class="form-control" placeholder="annee" id="year" value="<?php echo $users->year; ?>">
				      </div>
				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">Branche</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="branch" class="form-control" placeholder="branch" id="code" value="<?php echo $users->branch; ?>">
				      </div>
				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">Penalitie</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="penalty" class="form-control" placeholder="penalty" id="code" value="<?php echo $users->penalty; ?>">
				      </div>
				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">Nombre des bloques</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="nb_block" class="form-control" placeholder="nb_block" id="code" value="<?php echo $users->nb_block; ?>">
				      </div>

				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">Debut bloque</label>
				      <div class="col-lg-10">
				      	
				      	<input type="date" name="date_debut_block" class="form-control" placeholder="date_debut_block" id="code" value="<?php $test=strtotime($users->date_debut_block); echo date('Y-m-d',$test);  ?>">
				      </div>
				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">Fin bloque</label>
				      <div class="col-lg-10">
				      	
				      	<input type="date" name="date_fin_block" class="form-control" placeholder="date_fin_block" id="code" value="<?php $test=strtotime($users->date_fin_block); echo date('Y-m-d',$test);?>">
				      </div>
				 	</div>
<div class="form-group">
				 		 <label  class="col-lg-2 control-label">image</label>
				      <div class="col-lg-10">
				 	<img src="{{ asset($users->photo) }}" width= "100px" height="100px" alt="Image"><br>
				 	 </div>
				 	</div>
				 	 	<div class="form-group">
				     
				        <div class="col-lg-6 custom-file">
				      	<label class="custom-file-label">Choose image</label>
               	<input type="file" name="photo" class="custom-file-input" >

				      </div>
				 	</div>

				 	<div class="form-group">
				 		<div class="col-lg-10 col-lg-offset-2">
				 			<button type="submit" class="btn btn-primary">Update</button>


				 			<a href="{{ url('/Utilisateur')}}" class="btn btn-primary">Back</a>
				 		</div>
				 	</div>
				  </fieldset>
				</form>
			</div>
		</div>
	</div>
@include('inc.footer')