<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProfileController extends Controller
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
         if ('User'==$admin->profile) {
        //return redirect('/dashboardadmin');
     //   return array('error'=>false,'admin'=>$admin);
        return redirect('/');}else  if ('SuperUser'==$admin->profile) {
        //return redirect('/dashboardadmin');
     //   return array('error'=>false,'admin'=>$admin);
        return redirect('/');}
        else{return array('error'=>true,'message'=>'profil not allowed');}
    }
    else{

        return array('error'=>true,'message'=>'invalid password');
    }
}else{
    return array('error'=>true,'message'=>'User not found');
}

}
}
