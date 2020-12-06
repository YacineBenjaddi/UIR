<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Loisir Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="dash/vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="dash/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="dash/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="./dash/vendors/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="./dash/vendors/chartist/chartist.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="./dash/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="./dash/images/favicon.png" />
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>


   






  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 d-flex flex-row">
        <div class="navbar-brand-wrapper d-flex align-items-center">
          <a class="navbar-brand brand-logo" href="index.html">
            <img src="assets/img/logo.jpg"  />
          </a>
        
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center flex-grow-1">
          <h5 class="mb-0 font-weight-medium d-none d-lg-flex">Welcome to dashboard!</h5>
         
         
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
             <li class="nav-item">
              <a class="nav-link" href="dashboard">
                <span class="menu-title">Dashboard</span>
                <i class="icon-screen-desktop menu-icon"></i>
              </a>
            </li>
            <li class="nav-item nav-category">
              <span class="nav-link">Information</span>
            </li>
           
            <li class="nav-item">
              <a class="nav-link" href="Terrain">
                <span class="menu-title">Gestion Terrain</span>
                <i class="fas fa-cogs menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Utilisateur">
                <span class="menu-title">Gestion Utilisateur</span>
                <i class="fas fa-user-cog menu-icon"></i>
              </a>
            </li>
            <li class="nav-item nav-category"><span class="nav-link">Reservation Tables</span></li>
            <li class="nav-item">
              <a class="nav-link" href="Foot">
                <span class="menu-title">Gestion Foot</span>
                <i class=' fas fa-futbol menu-icon'></i>
            
              </a>
             
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Basket">
                <span class="menu-title">Gestion Basket</span>
        <i class='fas fa-basketball-ball menu-icon'></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Tennis">
                <span class="menu-title">Gestion Tennis</span>
  <i class=' fas fa-baseball-ball menu-icon'></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Piscine">
                <span class="menu-title">Gestion Piscine</span>
            <i class=' fas fa-swimmer menu-icon'></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Musculation">
                <span class="menu-title">Gestion Musculation</span>
             <i class='fas fa-dumbbell menu-icon'></i>

              </a>
            </li>
             <li class="nav-item nav-category">
              <span class="nav-link">Compte</span>
            </li>
           
            <li class="nav-item">
              <a class="nav-link" href="index">
                <span class="menu-title">Se deconnecter</span>
                <i class="fas fa-power-off menu-icon"></i>
              </a>
          
         
            
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="row purchace-popup">
          
            </div>
            <div class="row">
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Sessions by channel</h4>
                    <div class="aligner-wrapper">
                      <canvas id="sessionsDoughnutChart" height="210"></canvas>
                      <div class="wrapper d-flex flex-column justify-content-center absolute absolute-center">
                        <h2 class="text-center mb-0 font-weight-bold">8.234</h2>
                        <small class="d-block text-center text-muted  font-weight-semibold mb-0">Total Leads</small>
                      </div>
                    </div>
                    <div class="wrapper mt-4 d-flex flex-wrap align-items-cente">
                      <div class="d-flex">
                        <span class="square-indicator bg-danger ml-2"></span>
                        <p class="mb-0 ml-2">Assigned</p>
                      </div>
                      <div class="d-flex">
                        <span class="square-indicator bg-success ml-2"></span>
                        <p class="mb-0 ml-2">Not Assigned</p>
                      </div>
                      <div class="d-flex">
                        <span class="square-indicator bg-warning ml-2"></span>
                        <p class="mb-0 ml-2">Reassigned</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-8 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body performane-indicator-card">
                    <div class="d-sm-flex">
                      <h4 class="card-title flex-shrink-1">Performance Indicator</h4>
                      <p class="m-sm-0 ml-sm-auto flex-shrink-0">
                        <span class="data-time-range ml-0">7d</span>
                        <span class="data-time-range active">2w</span>
                        <span class="data-time-range">1m</span>
                        <span class="data-time-range">3m</span>
                        <span class="data-time-range">6m</span>
                      </p>
                    </div>
                    <div class="d-sm-flex flex-wrap">
                      <div class="d-flex align-items-center">
                        <span class="dot-indicator bg-primary ml-2"></span>
                        <p class="mb-0 ml-2 text-muted font-weight-semibold">Complaints (2098)</p>
                      </div>
                      <div class="d-flex align-items-center">
                        <span class="dot-indicator bg-info ml-2"></span>
                        <p class="mb-0 ml-2 text-muted font-weight-semibold"> Task Done (1123)</p>
                      </div>
                      <div class="d-flex align-items-center">
                        <span class="dot-indicator bg-danger ml-2"></span>
                        <p class="mb-0 ml-2 text-muted font-weight-semibold">Attends (876)</p>
                      </div>
                    </div>
                    <div id="performance-indicator-chart" class="ct-chart mt-4"></div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Quick Action Toolbar Starts-->
           
            <!-- Quick Action Toolbar Ends-->
            <div class="row">
              <div class="col-md-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="d-sm-flex align-items-baseline report-summary-header">
                          <h5 class="font-weight-semibold">Report Summary</h5> <span class="ml-auto">Updated Report</span> <button class="btn btn-icons border-0 p-2"><i class="icon-refresh"></i></button>
                        </div>
                      </div>
                    </div>
                    <div class="row report-inner-cards-wrapper">
                      <div class=" col-md -6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">EXPENSE</span>
                          <h4>$32123</h4>
                          <span class="report-count"> 2 Reports</span>
                        </div>
                        <div class="inner-card-icon bg-success">
                          <i class="icon-rocket"></i>
                        </div>
                      </div>
                      <div class="col-md-6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">PURCHASE</span>
                          <h4>95,458</h4>
                          <span class="report-count"> 3 Reports</span>
                        </div>
                        <div class="inner-card-icon bg-danger">
                          <i class="icon-briefcase"></i>
                        </div>
                      </div>
                      <div class="col-md-6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">QUANTITY</span>
                          <h4>2650</h4>
                          <span class="report-count"> 5 Reports</span>
                        </div>
                        <div class="inner-card-icon bg-warning">
                          <i class="icon-globe-alt"></i>
                        </div>
                      </div>
                      <div class="col-md-6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">RETURN</span>
                          <h4>25,542</h4>
                          <span class="report-count"> 9 Reports</span>
                        </div>
                        <div class="inner-card-icon bg-primary">
                          <i class="icon-diamond"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <div class="row income-expense-summary-chart-text">
                      <div class="col-xl-4">
                        <h5>Income And Expenses Summary</h5>
                        <p class="small text-muted">A comparison of people who mark themselves of their ineterest from the date range given above. Learn more.</p>
                      </div>
                      <div class=" col-md-3 col-xl-2">
                        <p class="income-expense-summary-chart-legend"> <span style="border-color: #6469df"></span> Total Income </p>
                        <h3>$ 1,766.00</h3>
                      </div>
                      <div class="col-md-3 col-xl-2">
                        <p class="income-expense-summary-chart-legend"> <span style="border-color: #37ca32"></span> Total Expense </p>
                        <h3>$ 5,698.30</h3>
                      </div>
                      <div class="col-md-6 col-xl-4 d-flex align-items-center">
                        <div class="input-group" id="income-expense-summary-chart-daterange">
                          <div class="inpu-group-prepend input-group-text"><i class="icon-calendar"></i></div>
                          <input type="text" class="form-control">
                          <div class="input-group-prepend input-group-text"><i class="icon-arrow-down"></i></div>
                        </div>
                      </div>
                    </div>
                    <div class="row income-expense-summary-chart mt-3">
                      <div class="col-md-12">
                        <div class="ct-chart" id="income-expense-summary-chart"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           
          </div>

          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin templates</a> from Bootstrapdash.com</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
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