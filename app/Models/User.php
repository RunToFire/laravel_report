<?php

namespace App\Model;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\DB;
class User extends Authenticatable
{
    //数据库
    protected $connection = 'mysql_database';
    //对应表
    protected $table = "personal_account";
    use Notifiable;
    public $sortable = [
        'order_column_name' => 'order',
        'sort_when_creating' => true,
    ];

}
