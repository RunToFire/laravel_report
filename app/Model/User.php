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
    protected $connection = 'mysql_database';
    protected $table = "personal_account";
    use Notifiable;
    public static function test(){
        return 'test';
    }
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
    //原生写法一
//    public function paginate()
//    {
//        $perPage = Request::get('per_page', 10);
//
//        $page = Request::get('page', 1);
//
//        $total = ($page-1)*$perPage;
//
//        // 运行sql获取数据数组
//        $sql = 'select * from personal_account limit 100';
//
//        $result = DB::connection('mysql_database')->select($sql);
//
//        $movies = static::hydrate($result);
//
//        $paginator = new LengthAwarePaginator($movies, $total, $perPage);
//
//        $paginator->setPath(url()->current());
//
//        return $paginator;
//    }
}
