<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Loisir;

use DB;
class loisirController extends Controller
{
   
 public function loisir()
    {
        //
      $loisir = Loisir::all();
  
     return view('loisirpage',['loisir'=>$loisir]);

    }


      public function deleteLoisir($id_loisir){
    Loisir::where('id_loisir',$id_loisir)
    ->delete();
    return redirect('Terrain');
    }


        public function destroyAllLoisir(Request $request)
    {
        $ids = $request->ids;
        DB::table("loisir")->whereIn('id_loisir',explode(",",$ids))->delete();
        return response()->json(['success'=>"Reservation Deleted successfully."]);
    }

public function createLoisir(Request $request){


    $loisir=new Loisir();
    $loisir->nom=$request->input('nom');
    $loisir->description=$request->input('description');
    $loisir->latitude=$request->input('latitude');
     $loisir->longitude=$request->input('longitude');
     $loisir->capacite=$request->input('capacite');
     $loisir->type=$request->input('type');

    
//echo $user;


    $loisir->save();

    //unset($admin->password);

    return redirect('Terrain');

  }


 public function updateLoisir($id_loisir){
   //  $users=DB::table('user')
   //  ->where('user.id_user','=',$id_user)
    //->get();
    $loisir = Loisir::find($id_loisir);
        return view('editLoisir',['loisir'=>$loisir]);
 //echo $users ;
     //  return view('editUser',['users'=>$users]);
        /* check 
        echo '<pre>';
        print_r($articles);
        echo "</pre>";
        exit();*/    


    } 

     public function editLoisir(Request $request, $id_loisir){
      
        $loisir = Loisir::find($id_loisir);

      
       $loisir->nom=$request->input('nom');
    $loisir->description=$request->input('description');
    $loisir->latitude=$request->input('latitude');
     $loisir->longitude=$request->input('longitude');
     $loisir->capacite=$request->input('capacite');
     $loisir->type=$request->input('type');

        
        $loisir->save();
        return redirect('Terrain');
         
    } 




}
