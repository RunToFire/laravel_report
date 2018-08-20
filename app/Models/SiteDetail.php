<?php
/**
 * Created by PhpStorm.
 * User: zj
 * Date: 2018/8/13
 * Time: 10:50
 */
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class SiteDetail extends Model
{
    //数据库
    protected $connection = 'mysql_database';
    //对应表
    protected $table = "site_detail";



}
