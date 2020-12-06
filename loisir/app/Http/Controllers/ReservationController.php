<?php

namespace App\Http\Controllers;

use App\Models\ReservationSalleMusculation;
use App\Models\User;
use App\Models\Horaire;
use Illuminate\Http\Request;
use Illuminate\Hashing\BcryptHasher;
use Illuminate\Support\Facades\Validator;
use DB;
class ReservationController extends Controller
{
   
/*
    public function index()  // main dashbaord part
    {
        $data['reservations'] = ReservationSalleMusculation::all();
        /*$data1['users'] = User::all();
         $data2['horaires'] = Horaire::all();
        return view('test2',$data);
    }
 */
  

 public function show()
    {
        
     $reservations=DB::table('reservation_musc')
    ->join('user', 'reservation_musc.id_user', '=', 'user.id_user')
    ->select(
        'id_res',
        'first_name',
        'last_name',
        'id_horaire',
        'date_res'
    )->orderBy('date_res', 'DESC')
    ->get();
            
    // echo "$piscine";
     return view('musculation',['reservations'=>$reservations]);
    }



   public function readA($id_salle){
        $reservations = ReservationSalleMusculation::find($id_salle);
        //return $id_res;
        return view('read',['reservations'=>$reservations]);
        
    }
     public function create(Request $request){
    $validator = Validator::make($request->all(),[
       'id_user'=>'required',
       'id_horaire'=>'required',
       'date_res'=>'required',
       'type'=>'required']);
    
    if ($validator->fails()) {
        return array(
         'error'=>true,
         'message'=>$validator->errors()->all()
        );
    }

    $reservation=new ReservationSalleMusculation();
    $reservation->id_user=$request->input('id_user');
    $reservation->id_horaire=$request->input('id_horaire');
    $reservation->date_res=$request->input('date_res');
    $reservation->type=$request->input('type');

    echo "Resssssssssssssssssssssss$reservation";

    $reservation->save();

    return redirect('/table');

  }



        public function destroyAll(Request $request)
    {
        $ids = $request->ids;
        DB::table("reservation_musc")->whereIn('id_res',explode(",",$ids))->delete();
        return response()->json(['success'=>"Reservation Deleted successfully."]);
    }


public function deleteR($id_res){
    ReservationSalleMusculation::where('id_res',$id_res)
    ->delete();
    return redirect('/');
    }

 public function editU(Request $request, $id_user){
      
        $validator = Validator::make($request->all(),[
       'last_name'=>'required',
       'first_name'=>'required',
       'email'=>'required|unique:user',
       'password'=>'required|min:6',
       'profile'=>'required']);

        $data = array(
       'last_name'=>$request->input('last_name'),
       'first_name'=>$request->input('first_name'),
       'email'=>$request->input('email'),
       'password'=>$request->input('password'),
       'profile'=>$request->input('profile'),
        );
        User::where('id_user',$id_user)
        ->update($data);
        return redirect('/dash');
         
    } 

 public function updateU($id_user){
        $users = User::find($id_user);
        return view('editUser',['users'=>$users]);
        /* check 
        echo '<pre>';
        print_r($articles);
        echo "</pre>";
        exit();*/       
    } 
   
    
}
