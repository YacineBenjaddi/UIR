<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Loisir
 * 
 * @property int $id_loisir
 * @property string $nom
 * @property string $description
 * @property string $latitude
 * @property string $longitude
 * @property string $type
 * @property int $capacite
 * 
 * @property Collection|Photo[] $photos
 *
 * @package App\Models
 */
class Loisir extends Model
{
	protected $table = 'loisir';
	protected $primaryKey = 'id_loisir';
	public $timestamps = false;

	protected $casts = [
		'capacite' => 'int'
	];

	protected $fillable = [
		'nom',
		'description',
		'latitude',
		'longitude',
		'type',
		'capacite'
	];

	public function photos()
	{
		return $this->hasMany(Photo::class, 'id_loisir');
	}
}
