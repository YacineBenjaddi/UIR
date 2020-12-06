<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Photo
 * 
 * @property int $id_photo
 * @property string $nom
 * @property int $id_loisir
 * 
 * @property Loisir $loisir
 *
 * @package App\Models
 */
class Photo extends Model
{
	protected $table = 'photos';
	protected $primaryKey = 'id_photo';
	public $timestamps = false;

	protected $casts = [
		'id_loisir' => 'int'
	];

	protected $fillable = [
		'nom',
		'id_loisir'
	];

	public function loisir()
	{
		return $this->belongsTo(Loisir::class, 'id_loisir');
	}
}
