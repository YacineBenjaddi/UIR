<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ReservationTenni
 * 
 * @property int $id_res
 * @property int|null $id_user
 * @property int|null $id_horaire
 * @property Carbon|null $date_res
 * @property string $type
 * 
 * @property Horaire|null $horaire
 * @property User|null $user
 *
 * @package App\Models
 */
class ReservationTenni extends Model
{
	protected $table = 'reservation_tennis';
	protected $primaryKey = 'id_res';
	public $timestamps = false;

	protected $casts = [
		'id_user' => 'int',
		'id_horaire' => 'int'
	];

	protected $dates = [
		'date_res'
	];

	protected $fillable = [
		'id_user',
		'id_horaire',
		'date_res',
		'type'
	];

	public function horaire()
	{
		return $this->belongsTo(Horaire::class, 'id_horaire');
	}

	public function user()
	{
		return $this->belongsTo(User::class, 'id_user');
	}
}
