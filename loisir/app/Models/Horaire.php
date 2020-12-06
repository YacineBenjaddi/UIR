<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Horaire
 * 
 * @property int $id_horaire
 * @property string|null $creneau
 * 
 * @property Collection|ReservationBasket[] $reservation_baskets
 * @property Collection|ReservationFoot[] $reservation_feet
 * @property Collection|ReservationTenni[] $reservation_tennis
 *
 * @package App\Models
 */
class Horaire extends Model
{
	protected $table = 'horaire';
	protected $primaryKey = 'id_horaire';
	public $timestamps = false;

	protected $fillable = [
		'creneau'
	];

	public function reservation_baskets()
	{
		return $this->hasMany(ReservationBasket::class, 'id_horaire');
	}

	public function reservation_feet()
	{
		return $this->hasMany(ReservationFoot::class, 'id_horaire');
	}

	public function reservation_tennis()
	{
		return $this->hasMany(ReservationTenni::class, 'id_horaire');
	}
}
