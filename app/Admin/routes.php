<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    //站点基准数据-根据id筛选
    $router->get('score/site','ScoreGradeController@site');
    $router->get('score/plate','ScoreGradeController@plate');
    $router->get('score/area','ScoreGradeController@area');
    //站点基准数据-根据名称筛选
    $router->get('score/sitename','ScoreGradeController@sitename');
    $router->get('score/platename','ScoreGradeController@platename');
    $router->get('score/areaname','ScoreGradeController@areaname');
    //站点情况
    $router->get('sitedetail/index','SiteDetailController@index');
    $router->get('sitedetail/siteday','SiteDetailController@siteday');
    //人员情况
    $router->get('personal/index','PersonalAccountController@index');

    $router->resources([
        'sitedetail'=>SiteDetailController::class,
        'personal'=>PersonalAccountController::class,
        'score'=>ScoreGradeController::class
    ]);


});
