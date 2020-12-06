@include('inc.header')


<div class="container-xl">
    <div class="table-responsive" id="page">
        <div class="table-wrapper" style="width: 100%;">
            <div class="table-title" >
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Reservations <b>Basket</b></h2>
                    </div>
                    <div class="col-sm-6">

                    <button class="btn btn-danger delete_all" data-url="{{ url('deleteAllBasket') }}"><i class="material-icons">&#xE15C;</i> <span>Supprimer La Selection</span></button>  
                  
                    </div>
                </div>
            </div> 

   <table class="table table-striped table-hover" id="example" width="180%">

              <span style="margin-left: 79%">Search : </span><input id="rechercher" type="text">
  
               
                <thead>
                    <tr>
          <th><input style="  -ms-transform: scale(1.5); 
  -moz-transform: scale(1.5); 
  -webkit-transform: scale(1.5); 
  -o-transform: scale(1.5); 
  transform: scale(1.5);
  padding: 10px;" class="custom-checkbox"  type="checkbox" id="master"></th>
           <th>ID</th>
                        <th>User</th>
                        <th>Horaire</th>
                        <th>Date</th>
                        <th>Actions</th>
      </tr>
                </thead>
                <tbody>
        @if($basket->count())
            @foreach($basket as $key => $basket)
                <tr id="tr_{{$basket->id_res}}">
                    <td><input type="checkbox" class="sub_chk" data-id="{{$basket->id_res}}"></td>
                      <td>{{ $basket->id_res }}</td>
                      <td>{{ $basket->first_name }}  {{ $basket->last_name }} </td>
                      <td>{{ $basket->id_horaire }}:00</span></td>
                      <td>{{ $basket->date_res }}</td>

            
                  
<td>
                   <a role="button" data-target="#deleteEmployeeModal-{{ $basket->id_res }}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>

           <div id="deleteEmployeeModal-{{ $basket->id_res }}" class="modal fade" tabIndex="-1">
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
                    <a href='{{ url("/deleteBasket/{$basket->id_res}") }}'class="btn btn-danger">Delete</a> 
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
<div id="addEmployeeModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <form>
        <div class="modal-header">            
          <h4 class="modal-title">Add Employee</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">          
          <div class="form-group">
            <label>Name</label>
            <input type="text" class="form-control" required>
          </div>
          <div class="form-group">
            <label>Email</label>
            <input type="email" class="form-control" required>
          </div>
          <div class="form-group">
            <label>Address</label>
            <textarea class="form-control" required></textarea>
          </div>
          <div class="form-group">
            <label>Phone</label>
            <input type="text" class="form-control" required>
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
