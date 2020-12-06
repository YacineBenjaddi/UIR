
@include('inc.header')


	 <table class="table m-0">
                    <thead>
                   <tr>
                       <th>ID</th>
                      <th>User </th>
                      <th>horaire</th>
                      <th>date</th>
                    </tr>
                    </thead>
                    <tbody>
                     <tr>
                      <td>{{ $foot->id_res }}</td>
                      <td>{{ $foot->first_name }}  {{ $foot->last_name }} </td>
                      <td>{{ $foot->id_horaire }}:00</span></td>
          
                        <td>{{ $foot->date_res }}</td>
                     
                 
                    </tr>
                    
                    </tbody>
                  </table>
@include('inc.footer')
