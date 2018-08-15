<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->get('sitedetail/area','SiteDetailController@area');
    $router->get('sitedetail/index','SiteDetailController@index');

    $router->resources([
        'sitedetail'=>SiteDetailController::class,
    ]);


});
