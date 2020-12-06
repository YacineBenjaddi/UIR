<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ReservationSalleMusculation
 * 
 * @property int $id_res
 * @property int $id_user
 * @property int $id_horaire
 * @property Carbon $date_res
 * @property string $type
 * 
 * @property ReservationSalleMusculation $reservation_musc
 * @property Collection|ReservationSalleMusculation[] $reservation_salle_musculations
 *
 * @package App\Models
 */
class ReservationSalleMusculation extends Model
{
	protected $table = 'reservation_musc';
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

	public function reservation_salle_musculation()
	{
		return $this->belongsTo(ReservationSalleMusculation::class, 'id_horaire');
	}

	public function reservation_salle_musculations()
	{
		return $this->hasMany(ReservationSalleMusculation::class, 'id_horaire');
	}
}
