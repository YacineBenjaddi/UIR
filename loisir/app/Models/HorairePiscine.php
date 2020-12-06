<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class HorairePiscine
 * 
 * @property int $id_horaire
 * @property string|null $creneau
 * 
 * @property Collection|ReservationPiscine[] $reservation_piscines
 *
 * @package App\Models
 */
class HorairePiscine extends Model
{
	protected $table = 'horaire_piscine';
	protected $primaryKey = 'id_horaire';
	public $timestamps = false;

	protected $fillable = [
		'creneau'
	];

	public function reservation_piscines()
	{
		return $this->hasMany(ReservationPiscine::class, 'id_horaire');
	}
}
