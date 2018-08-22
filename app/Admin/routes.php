<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    //站点数据
    $router->get('score/site','ScoreGradeController@site');
    $router->get('score/plate','ScoreGradeController@plate');
    $router->get('score/area','ScoreGradeController@area');

    $router->get('score/sitename','ScoreGradeController@sitename');
    $router->get('score/platename','ScoreGradeController@platename');
    $router->get('score/areaname','ScoreGradeController@areaname');
    //站点情况
    $router->get('sitedetail/index','SiteDetailController@index');
    //人员情况
    $router->get('personal/index','PersonalAccountController@index');

    $router->resources([
        'sitedetail'=>SiteDetailController::class,
        'personal'=>PersonalAccountController::class,
        'score'=>ScoreGradeController::class
    ]);


});
