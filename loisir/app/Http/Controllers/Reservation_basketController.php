<?php

namespace App\Http\Controllers;

use App\Models\ReservationBasket;
use Illuminate\Http\Request;
use DB;

class Reservation_basketController extends Controller
{
    /**
    * Display a listing of the resource.
    *
    * @return \Illuminate\Http\Response
    */
    public function index(){
        
     $basket=DB::table('reservation_basket')
    ->join('user', 'reservation_basket.id_user', '=', 'user.id_user')
    ->select(
        'id_res',
        'reservation_basket.id_user',
        'first_name',
        'last_name',
        'id_horaire',
        'date_res'
    )->orderBy('date_res', 'DESC')
    ->get();
            
    // echo "$piscine";
     return view('basketpage',['basket'=>$basket]);
    }
    /**
    * Show the form for creating a new resource.
    *
    * @return \Illuminate\Http\Response
    */
    public function create(){
    $reservations_basket = ReservationBasket::all() ;
        return view('reservation_basket',['reservations_basket'=>$reservations_basket,'layout'=>'create']);
    }

    /**
    * store a newly created ressource in storage.
    *
    * @param \Illuminate\Http\Request $request
    * @return \Illuminate\Http\Response
    */
   public function store(Request $request){

    $reservation_basket = new ReservationBasket() ;
    $reservation_basket->id_res = $request->input('id_res') ;
    $reservation_basket->id_user = $request->input('id_user') ;
    $reservation_basket->id_horaire = $request->input('id_horaire') ;
    $reservation_basket->date_res = $request->input('date_res') ;
    $reservation_basket->type = $request->input('type') ;
    $reservation_basket->save() ;
    return redirect('/') ;
    }

    /**
    * Display the specified resource.
    *
    * @param int $id_res
    * @return \Illuminate\Http\Response
    */
    public function show($id_res){
    $reservation_basket = ReservationBasket::find($id_res);
    $reservations_basket = ReservationBasket::all();
    return view('reservation_basket',['reservations_basket'=>$reservations_basket,'reservation_basket'=>$reservation_basket,'layout'=>'show']);
    }

    /**
    * show the form to edit the specified resource.
    *
    * @param int $id_res
    * @return \Illuminate\Http\Response
    */

    public function edit($id_res){

        $reservation_basket = ReservationBasket::find($id_res);
        $reservations_basket = ReservationBasket::all();
        return view('reservation_basket',['reservations_basket'=>$reservations_basket,'reservation_basket'=>$reservation_basket,'layout'=>'edit']);

    }

     /**
     * update the specified resource from storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id_res
     * @return \Illuminate\Http\Response
     */

    public function update(Request $request, $id_res){

    $reservation_basket = ReservationBasket::find($id_res);
        $reservation_basket->id_res = $request->input('id_res') ;
        $reservation_basket->id_user = $request->input('id_user') ;
        $reservation_basket->id_horaire = $request->input('id_horaire') ;
        $reservation_basket->date_res = $request->input('date_res') ;
        $reservation_basket->type = $request->input('type') ;
        $reservation_basket->save() ;
        return redirect('/') ;

    }
    /**
    * Remove the specified resource from storage.
    *
    * @param int $id_res
    * @return \Illuminate\Http\Response
    */
      public function destroy($id_res)
    {
    ReservationBasket::where('id_res',$id_res)
    ->delete();
    return redirect('Basket');
    }


        public function destroyAll(Request $request)
    {
        $ids = $request->ids;
        DB::table("reservation_basket")->whereIn('id_res',explode(",",$ids))->delete();
        return response()->json(['success'=>"Reservation Deleted successfully."]);
    }


}
