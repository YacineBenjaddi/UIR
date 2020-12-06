<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\ReservationPiscine;
use Illuminate\Http\Request;
use DB;
use DataTables;
use Illuminate\Support\Facades\Validator;
use Laravel\Lumen\Auth\Authorizable;

class reservationpiscineController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request){

            $request->validate([
        'id_user'=> 'required',
        'date_res'=>'required',
       'id_horaire'=>'required']);

       
            $data = $request->input();
            try{
                $respiscine = new ReservationPiscine;
                $respiscine->id_user = $data['id_user'];
                $respiscine->id_horaire = $data['id_horaire'];
                $respiscine->date_res = $data['date_res'];
                $respiscine->type = 'piscine';
                $respiscine->save();
                return redirect('getPiscine')->with('status',"Insert successfully");
            }
            catch(Exception $e){
                return redirect('Piscine')->with('failed',"operation failed");
            }
        
    }
    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        
     $piscine=DB::table('reservation_piscine')
    ->join('user', 'reservation_piscine.id_user', '=', 'user.id_user')
    ->select(
        'id_res',
        'reservation_piscine.id_user',
        'first_name',
        'last_name',
        'id_horaire',
        'date_res'
    )->orderBy('date_res', 'DESC')
    ->get();
            
    // echo "$piscine";
     return view('piscinepage',['piscine'=>$piscine]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id_res)
    {
      $request->validate([
        
        'date_res'=>'required',
       'id_horaire'=>'required']);

      //  $data = array(
       //'date_res'=>$request->input('date_res'),
       //'id_horaire'=>$request->input('id_horaire'),
        //);
        ReservationPiscine::where('id_res',$id_res)->update($request->all());
        return redirect('Piscine')->back()->with('success','Update Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id_res)
    {
    ReservationPiscine::where('id_res',$id_res)
    ->delete();
    return redirect('Piscine');
    }


        public function destroyAll(Request $request)
    {
        $ids = $request->ids;
        DB::table("reservation_piscine")->whereIn('id_res',explode(",",$ids))->delete();
        return response()->json(['success'=>"Reservation Deleted successfully."]);
    }
}
