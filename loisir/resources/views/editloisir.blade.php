@include('inc.header')
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form class="form-horizontal" enctype="multipart/form-data" method="POST" action="{{ url('/editLoisir',array($loisir->id_loisir)) }}">
					<input type="hidden" name="_token" value="{{ csrf_token() }}">
				  <fieldset>
				    
				    <div class="form-group">
				      <label  class="col-lg-2 control-label">nom</label>
				      <div class="col-lg-10">
				      	<input type="text" name="nom" class="form-control" id="nom" placeholder="nom" value="<?php echo $loisir->nom; ?>">
				      </div>
				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">description</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="description" class="form-control" placeholder="description" id="description" value="<?php echo $loisir->description; ?>">
				      </div>
				 	</div>
				
				 	 
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">latitude</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="latitude" class="form-control" placeholder="latitude"  id="latitude" value="<?php echo $loisir->latitude; ?>">
				      </div>
				 	</div>
				 		<div class="form-group">
				      <label  class="col-lg-2 control-label">longitude</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="longitude" class="form-control" placeholder="longitude" id="longitude" value="<?php echo $loisir->longitude; ?>">
				      </div>
				 	</div>

				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">capacite</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="capacite" class="form-control" placeholder="capacite" id="capacite" value="<?php echo $loisir->capacite; ?>">
				      </div>
				 	</div>

<div class="form-group">
      <fieldset data-role="controlgroup">
      <label>Type :</label>
      <br>
      <input type="radio" name="type" id="type" value="foot" checked>
        <label for="foot">Foot</label>
        
         <br>
             <input type="radio" name="type" id="type" value="basket">
        <label for="basket">Basket</label>
    
         <br>
            <input type="radio" name="type" id="type" value="tennis">
        <label for="tennis">Tennis</label>
     
         <br>
           <input type="radio" name="type" id="type" value="piscine">
        <label for="piscine">Piscine</label>
      
         <br>
           <input type="radio" name="type" id="type" value="musc">
        <label for="musc">Musculation</label>
      
      </fieldset>
          </div> 				 	
				 

				 
				 	 	

				 	<div class="form-group">
				 		<div class="col-lg-10 col-lg-offset-2">
				 			<button type="submit" class="btn btn-primary">Update</button>


				 			<a href="{{ url('/Terrain')}}" class="btn btn-primary">Back</a>
				 		</div>
				 	</div>
				  </fieldset>
				</form>
			</div>
		</div>
	</div>
@include('inc.footer')