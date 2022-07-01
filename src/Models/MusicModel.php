<?php
namespace App\Models;

class MusicModel extends Model
{
    public function __construct() {
        $this->table = "music";
        $this->fields= [
            'music_title',
            'music_artist',
            'music_link'
        ];
        $this->pk = 'music_id';
    }
}