<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\ReservationTenni;
use Illuminate\Support\Facades\Validator;
use Laravel\Lumen\Auth\Authorizable;
use DB;
class ReservationTennisController extends Controller
{
    public function getTennis()
    {
        //
     // $foot = ReservationFoot::all();
      //   $restaurants = Restaurant::all();
       //    $reservations = Reservation::all();

       // echo "$foot";
         // $admins = Admin::all();
     $tennis=DB::table('reservation_tennis')
    ->join('user', 'reservation_tennis.id_user', '=', 'user.id_user')
    ->select(
        'id_res',
        'first_name',
        'last_name',
        'id_horaire',
        'date_res'
    )
    ->get();
            
   // echo "$foot";
     return view('tennispage',['tennis'=>$tennis]);

    }


    public function read($id_res){
        $tennis = ReservationTennis::find($id_res);
        //return $id;
        return view('readtennis',['tennis'=>$tennis]);
        
    }

    public function delete($id_res){
        ReservationTenni::where('id_res',$id_res)
        ->delete();
        return redirect('/Tennis');
        }

     

        public function edit(Request $request, $id_res){
      
            $validator = Validator::make($request->all(),[
                'date_res'=>'required',
                'id_horaire'=>'required']);
    
            $data = array(
                'date_res'=>$request->input('date_res'),
                'id_horaire'=>$request->input('id_horaire'),
          
            );
            ReservationTenni::where('id_res',$id_res)
            ->update($data);
            return redirect('/getTennis');
             
        } 




        public function update($id_res){
            $tennis = ReservationTenni::find($id_res);
            return view('editTennis',['tennis'=>$tennis]);
            /* check 
            echo '<pre>';
            print_r($articles);
            echo "</pre>";
            exit();*/       
        } 
       
    

}