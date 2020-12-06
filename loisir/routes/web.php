<?php
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('indextest');
});
Route::get('index', function () {
    return view('indextest');
});
Route::get('dashboard', function () {
    return view('dashboard');
});
Route::get('/login', function () {
    return view('loginpage');
});
//login && dashboard
Route::post('adminlogin','UserController@login');
//foot
Route::get('Foot','reservationfootController@getFoot');
Route::get('/deleteFoot/{id_res}','reservationfootController@delete');
//tennis
Route::get('Tennis','reservationTennisController@getTennis');
Route::get('/deleteTennis/{id_res}','ReservationTennisController@delete');
//user
Route::get('Utilisateur','UserController@user');
Route::get('/deleteUtilisateur/{id_user}','UserController@deleteUser');
Route::get('/deleteAllUser','UserController@destroyAllUser');
Route::post('/createUser','UserController@createUser');
Route::get('/updateUser/{id_user}','UserController@updateUser');
Route::post('/editUser/{id_user}','UserController@editUser');

//loisir
Route::get('Terrain','loisirController@loisir');
Route::get('/deleteLoisir/{id_loisir}','loisirController@deleteLoisir');
Route::get('/deleteAllLoisir','loisirController@destroyAllLoisir');
Route::post('/createLoisir','loisirController@createLoisir');
Route::get('/updateLoisir/{id_loisir}','loisirController@updateLoisir');
Route::post('/editLoisir/{id_loisir}','loisirController@editLoisir');
//musculation
Route::get('/Musculation', 'ReservationController@show');
Route::get('/deleteAllSalle', 'ReservationController@destroyAll');
Route::get('/deleteR/{id_salle}','ReservationController@deleteR');
//piscine

Route::get('/Piscine','reservationpiscineController@show');
Route::get('/deletePiscine/{id_res}','reservationpiscineController@destroy');
Route::get('/deleteAllPiscine','reservationpiscineController@destroyAll');

//basket

Route::get('/Basket','Reservation_basketController@index');
Route::get('/deleteBasket/{id_res}','Reservation_basketController@destroy');
Route::get('/deleteAllBasket','Reservation_basketController@destroyAll');

