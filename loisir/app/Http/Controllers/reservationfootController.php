<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\ReservationFoot;
use App\Models\User;
use Illuminate\Http\Request;
use Laravel\Lumen\Auth\Authorizable;
use DB;
use Illuminate\Support\Facades\Validator;

class reservationfootController extends Controller
{
   
     public function getFoot()
    
    {
        //
     // $foot = ReservationFoot::all();
      //   $restaurants = Restaurant::all();
       //    $reservations = Reservation::all();

       // echo "$foot";
         // $admins = Admin::all();
     $foot=DB::table('reservation_foot')
    ->join('user', 'reservation_foot.id_user', '=', 'user.id_user')
    ->select(
        'id_res',
        'first_name',
        'last_name',
        'id_horaire',
        'date_res'
    )
    ->get();
            
   // echo "$foot";
     return view('footpage',['foot'=>$foot]);

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
   
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
  
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
   

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
     public function read($id_res){
        $foot = ReservationFoot::find($id_res);
        //return $id;
        return view('readFoot',['foot'=>$foot]);
        
    }

     public function delete($id_res){
    ReservationFoot::where('id_res',$id_res)
    ->delete();
    return redirect('getFoot');
    }

 public function edit(Request $request, $id_res){
      
        $validator = Validator::make($request->all(),[
        
        'date_res'=>'required',
       'id_horaire'=>'required']);

        $data = array(
       'date_res'=>$request->input('date_res'),
       'id_horaire'=>$request->input('id_horaire'),
        );
        ReservationFoot::where('id_res',$id_res)
        ->update($data);
        return redirect('getFoot');
         
    } 

 public function update($id_res){
        $foot = ReservationFoot::find($id_res);
        return view('editFoot',['foot'=>$foot]);
        /* check 
        echo '<pre>';
        print_r($articles);
        echo "</pre>";
        exit();*/       
    } 


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
  

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
  }
