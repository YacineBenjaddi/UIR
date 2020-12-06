<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * 
 * @property int $id_user
 * @property string $first_name
 * @property string $last_name
 * @property string $email
 * @property string $password
 * @property int $penalty
 * @property string $gender
 * @property string $profile
 * @property int $reset
 * @property string $code
 * @property string $year
 * @property string $branch
 * @property int $nb_block
 * @property Carbon $date_debut_block
 * @property Carbon $date_fin_block
 * @property string $photo
 * 
 * @property Collection|ReservationBasket[] $reservation_baskets
 * @property Collection|ReservationFoot[] $reservation_feet
 * @property Collection|ReservationPiscine[] $reservation_piscines
 * @property Collection|ReservationTenni[] $reservation_tennis
 *
 * @package App\Models
 */
class User extends Model
{
	protected $table = 'user';
	protected $primaryKey = 'id_user';
	public $timestamps = false;

	protected $casts = [
		'penalty' => 'int',
		'reset' => 'int',
		'nb_block' => 'int'
	];

	protected $dates = [
		'date_debut_block',
		'date_fin_block'
	];

	protected $hidden = [
		'password'
	];

	protected $fillable = [
		'first_name',
		'last_name',
		'email',
		'password',
		'penalty',
		'gender',
		'profile',
		'reset',
		'code',
		'year',
		'branch',
		'nb_block',
		'date_debut_block',
		'date_fin_block',
		'photo'
	];

	public function reservation_baskets()
	{
		return $this->hasMany(ReservationBasket::class, 'id_user');
	}

	public function reservation_feet()
	{
		return $this->hasMany(ReservationFoot::class, 'id_user');
	}

	public function reservation_piscines()
	{
		return $this->hasMany(ReservationPiscine::class, 'id_user');
	}

	public function reservation_tennis()
	{
		return $this->hasMany(ReservationTenni::class, 'id_user');
	}
}
