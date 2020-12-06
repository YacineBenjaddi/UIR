@include('inc.header')

  
        <div class="container-xl">
    <div class="table-responsive" id="page">
        <div class="table-wrapper" style="width: 120%;">
            <div class="table-title" >
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Utilisateurs <b></b></h2>
                    </div>
                    <div class="col-sm-6">
 <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Ajouter Utilisateur</span></a>
                    <button class="btn btn-danger delete_all" data-url="{{ url('deleteAllUser') }}"><i class="material-icons">&#xE15C;</i> <span>Supprimer La Selection</span></button>  
                  
                    </div>
                </div>
            </div> 


   <table class="table table-striped table-hover" id="example" width="100%">
              <span style="margin-left: 80%">Search : </span><input id="rechercher" type="text">
  
               
                <thead>
                    <tr>
          <th><input style="  -ms-transform: scale(1.5); 
  -moz-transform: scale(1.5); 
  -webkit-transform: scale(1.5); 
  -o-transform: scale(1.5); 
  transform: scale(1.5);
  padding: 10px;" class="custom-checkbox"  type="checkbox" id="master"></th>
           <th>ID</th>
                        <th>Utilisateur</th>
                        <th>email</th>
                        <th>mdp</th>
                         <th>sexe</th>
                          <th>code</th>
                           <th>branche</th>
                        <th>penalitie</th>
                         <th>bloques</th>
                          <th >debut_bloquage</th>
                           <th>fin_bloquage</th>

                        <th colspan="2">Actions</th>

      </tr>
                </thead>
                <tbody>
        @if($users->count())
            @foreach($users as $key => $user)
                <tr id="tr_{{$user->id_user}}">
                    <td><input type="checkbox" class="sub_chk" data-id="{{$user->id_user}}"></td>
                      <td>{{ $user->id_user }}</td>
                      <td>{{ $user->first_name }}  {{ $user->last_name }} </td>
                      <td>{{ $user->email }}</span></td>
                      <td>{{ $user->password}}</td>
                      <td>{{ $user->gender}}</td>
                      <td>{{ $user->code}}</td>
                      <td>{{ $user->branch}}</td>
                      <td>{{ $user->penalty}}</td>
                      <td>{{ $user->nb_block}}</td>
                      <td >{{ $user->date_debut_block}}</td>
                      <td>{{ $user->date_fin_block}}</td>


            
                  
<td>
                   <a role="button" data-target="#deleteUser-{{ $user->id_user }}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                   <br>
                   </td>
                <td> <a role="button"  href='{{ url("/updateUser/{$user->id_user}") }}' class="Update" ><i class="material-icons " data-toggle="tooltip" title="Update">&#xe003;</i></a>
                  
              </td>

           <div id="deleteUser-{{ $user->id_user }}" class="modal fade" tabIndex="-1">
    <div class="modal-dialog" >
        <div class="modal-content">
            <form>
                <div class="modal-header">                      
                    <h4 class="modal-title">Supprimer Reservation</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">                    
                    <p>Etes vous sure de vouloir supprimer cette reservation?</p>
                    <p class="text-warning"><small>Cette action est irreversible</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Annuler">
                    <a href='{{ url("/deleteUtilisateur/{$user->id_user}") }}'class="btn btn-danger">Delete</a> 
                </div>
            </form>
        </div>
    </div>
</div>
                        </td>
                    </tr>
                        @endforeach
                      @endif
                </tbody>
                   <tfoot>
            <tr>
     
            </tr>
        </tfoot>
            </table>
</div> <!-- container / end -->


<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Row information</h4>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <div id="addEmployeeModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" enctype="multipart/form-data" action="{{ url('/createUser')}} ">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <div class="modal-header">            
          <h4 class="modal-title">Ajouter Utilisateur</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>

        <div class="modal-body">          
          <div class="form-group">
            <label>Nom</label>
            <input type="text" name="last_name" class="form-control" id="last_name" required>
          </div>
           <div class="form-group">
            <label>Prenom</label>
            <input type="text" name="first_name" class="form-control" id="first_name" required>
          </div>
          <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" class="form-control" id="email" required>
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
            <label>Code</label>
            <input type="text" name="code" class="form-control" id="code" required>
          </div>
           <div class="form-group">
            <label>Annee</label>
            <input type="text" name="year" class="form-control" id="year" required>
          </div>
           <div class="form-group">
            <label>branche</label>
            <input type="text" name="branch" class="form-control" id="branch" required>
          </div> 
          <div class="form-group">
             
                <div class="custom-file">
                <label class="custom-file-label">Choose image</label>
                <input type="file" name="photo" class="custom-file-input" required >

              </div>
          </div>
       
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
          <input type="submit" class="btn btn-success" value="Add">
        </div>
      </form>
    </div>
  </div>
</div>
    <!-- container-scroller -->

    <!-- plugins:js -->
    <script src="dash/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="./dash/vendors/chart.js/Chart.min.js"></script>
    <script src="./dash/vendors/moment/moment.min.js"></script>
    <script src="./dash/vendors/daterangepicker/daterangepicker.js"></script>
    <script src="./dash/vendors/chartist/chartist.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="dash/js/off-canvas.js"></script>
    <script src="dash/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="./dash/js/dashboard.js"></script>
    <!-- End custom js for this page -->
    <!-- Edit Modal HTML -->

<script type="text/javascript">
    $(document).ready(function () {


        $('#master').on('click', function(e) {
         if($(this).is(':checked',true))  
         {
            $(".sub_chk").prop('checked', true);  
         } else {  
            $(".sub_chk").prop('checked',false);  
         }  
        });


        $('.delete_all').on('click', function(e) {


            var allVals = [];  
            $(".sub_chk:checked").each(function() {  
                allVals.push($(this).attr('data-id'));
            });  


            if(allVals.length <=0)  
            {  
                alert("Please select row.");  
            }  else {  


                var check = confirm("Are you sure you want to delete this row?");  
                if(check == true){  


                    var join_selected_values = allVals.join(","); 


                    $.ajax({
                        url: $(this).data('url'),
                        type: 'GET',
                        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        data: 'ids='+join_selected_values,
                        success: function (data) {
                            if (data['success']) {
                                $(".sub_chk:checked").each(function() {  
                                    $(this).parents("tr").remove();
                                });
                                alert(data['success']);
                            } else if (data['error']) {
                                alert(data['error']);
                            } else {
                                alert('Whoops Something went wrong!!');
                            }
                        },
                        error: function (data) {
                            alert(data.responseText);
                        }
                    });


                  $.each(allVals, function( index, value ) {
                      $('table tr').filter("[data-row-id='" + value + "']").remove();
                  });
                }  
            }  
        });


        $('[data-toggle=confirmation]').confirmation({
            rootSelector: '[data-toggle=confirmation]',
            onConfirm: function (event, element) {
                element.trigger('confirm');
            }
        });


        $(document).on('confirm', function (e) {
            var ele = e.target;
            e.preventDefault();


            $.ajax({
                url: ele.href,
                type: 'GET',
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                success: function (data) {
                    if (data['success']) {
                        $("#" + data['tr']).slideUp("slow");
                        alert(data['success']);
                    } else if (data['error']) {
                        alert(data['error']);
                    } else {
                        alert('Whoops Something went wrong!!');
                    }
                },
                error: function (data) {
                    alert(data.responseText);
                }
            });


            return false;
        });
    });


</script>
<script>
$(document).ready(function(){
    // Activate tooltip
    $('[data-toggle="tooltip"]').tooltip();
    
    // Select/Deselect checkboxes
    var checkbox = $('table tbody input[type="checkbox"]');
    $("#selectAll").click(function(){
        if(this.checked){
            checkbox.each(function(){
                this.checked = true;                        
            });
        } else{
            checkbox.each(function(){
                this.checked = false;                        
            });
        } 
    });
    checkbox.click(function(){
        if(!this.checked){
            $("#selectAll").prop("checked", false);
        }
    });
});


$(document).ready(function() {
  //Only needed for the filename of export files.
  //Normally set in the title tag of your page.
  document.title='Simple DataTable';
  // DataTable initialisation
  $('#example').DataTable(
    {
     "paging":   true,
     "lengthMenu": [5, 10, 15, 20,30,40,50],
      "columnDefs": [
        { "targets": [0,5] , "orderable": false }
        ],

 "sDom": '<"row view-filter"<"col-sm-12"<"clearfix">>>t<"bottom"fl><"col-sm-5"p>',
    });


  $('#rechercher').on('keyup', function () {
    $('#example').DataTable().search( this.value ).draw();
} );
});

</script>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script src='https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js'></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js'></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.colVis.min.js'></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js'></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js'></script>
<script src='https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js'></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js'></script>
<script src='https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js'></script>
<script src='https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js'></script>

  </body>
</html>