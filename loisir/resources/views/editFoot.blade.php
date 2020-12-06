@include('inc.header')
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form class="form-horizontal" method="POST" action="{{ url('/editFoot',array($foot->id_res)) }}">
					<input type="hidden" name="_token" value="{{ csrf_token() }}">
				  <fieldset>
				    
				    <div class="form-group">
				      <label  class="col-lg-2 control-label">Horaire: </label>
				      <div class="col-lg-10">
				      	<input type="text" name="id_horaire" class="form-control" id="id_horaire" placeholder="horiare" value="<?php echo $foot->id_horaire; ?>">
				      </div>
				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">date </label>
				      <div class="col-lg-10">
				      	
				      	<input type="date" name="date_res" class="form-control" placeholder="date" id="date_res" value="<?php echo $foot->date_res; ?>">
				      </div>
				 	</div>
				
				 	
				 	
				 	
				 

				 	

				 	<div class="form-group">
				 		<div class="col-lg-10 col-lg-offset-2">
				 			<button type="submit" class="btn btn-primary">Update</button>


				 			<a href="{{ url('/dashboardadmin')}}" class="btn btn-primary">Back</a>
				 		</div>
				 	</div>
				  </fieldset>
				</form>
			</div>
		</div>
	</div>
@include('inc.footer')