<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Loisir;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Hashing\BcryptHasher;
use Illuminate\Support\Facades\Validator;
Use DB;
class UserController extends Controller
{
    //
    public function login(Request $request){

$validator = Validator::make($request->all(),[
       
       'email'=>'required',
       'password'=>'required',]);
    
    if ($validator->fails()) {
        return array(
         'error'=>true,
         'message'=>$validator->errors()->all()
        );
    }

$admin = User::where('email',$request->input('email'))->first();
if(count((array)$admin)){

    if (($request->input('password')==$admin->password)) {

        unset($admin->password);
         if ('Admin'==$admin->profile ) {
        //return redirect('/dashboardadmin');
     //   return array('error'=>false,'admin'=>$admin);
        return redirect('dashboard');}
        else{return array('error'=>true,'message'=>'profil not allowed');}
    }
    else{

        return array('error'=>true,'message'=>'invalid password');
    }
}else{
    return array('error'=>true,'message'=>'User not found');
}

}

 public function user()
    {
        //
      $users=DB::table('user')
    ->get();

  
     return view('userpage',['users'=>$users]);

    }



    public function deleteUser($id_user){
    User::where('id_user',$id_user)
    ->delete();
    return redirect('Utilisateur');
    }


        public function destroyAllUser(Request $request)
    {
        $ids = $request->ids;
        DB::table("user")->whereIn('id_user',explode(",",$ids))->delete();
        return response()->json(['success'=>"Reservation Deleted successfully."]);
    }

    public function createUser(Request $request){


    $user=new User();
    $user->last_name=$request->input('last_name');
    $user->first_name=$request->input('first_name');
    $user->email=$request->input('email');
     $user->gender=$request->input('gender');
     $user->code=$request->input('code');
     $user->year=$request->input('year');
     $user->branch=$request->input('branch');
      if ($request->hasFile('photo')) {
    $filename = $request->file('photo')->getClientOriginalName();
    $user->photo="$filename";
        }
//echo $user;


    $user->save();

    //unset($admin->password);

    return redirect('Utilisateur');

  }

   public function updateUser($id_user){
   //  $users=DB::table('user')
   //  ->where('user.id_user','=',$id_user)
    //->get();
    $users = User::find($id_user);
        return view('editUser',['users'=>$users]);
 //echo $users ;
     //  return view('editUser',['users'=>$users]);
        /* check 
        echo '<pre>';
        print_r($articles);
        echo "</pre>";
        exit();*/    


    } 

     public function editUser(Request $request, $id_user){
      
        $user = User::find($id_user);

      
       $user->last_name=$request->input('last_name');
    $user->first_name=$request->input('first_name');
    $user->email=$request->input('email');
    $user->password=$request->input('password');
     $user->gender=$request->input('gender');
     $user->code=$request->input('code');
     $user->year=$request->input('year');

     $user->branch=$request->input('branch');
     $user->penalty=$request->input('penalty');
     $user->nb_block=$request->input('nb_block');
     $user->date_debut_block=$request->input('date_debut_block');
     $user->date_fin_block=$request->input('date_fin_block');
      if ($request->hasFile('photo')) {
    $filename = $request->file('photo')->getClientOriginalName();
    $user->photo="$filename";}
        
        $user->save();
        return redirect('Utilisateur');
         
    } 


}
