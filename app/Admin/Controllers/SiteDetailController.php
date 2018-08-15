<?php

namespace App\Admin\Controllers;
use App\Models\SiteDetail;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
//use Encore\Admin\Facades\DB;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;
use Illuminate\Support\Facades\DB;

class SiteDetailController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {
            $content->header('数据管理');
            $content->description('站点详情');
            $content->body($this->grid());
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(SiteDetail::class, function (Grid $grid) {

            $grid->id('IDs')->sortable();
            $grid->filter(function (Grid\Filter $filter) {
                $filter->disableIdFilter();
                $filter->equal('city_id', '城市')
                    ->select(SiteDetail::city()->pluck('city', 'city_id'))
                    ->load('area_id', '/admin/sitedetail/area');

                $filter->equal('area_id', '区域')->select();
                    ->load('bankuai_id', '/admin/sitedetail/bankuai');
//
                $filter->equal('bankuai_id', '板块')->select();
            });
            $grid->setView('admin.grid.sitedetail');

        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(SiteDetail::class, function (Form $form) {
            $form->display('id', 'ID');
            $form->display('created_at', 'Created At');
            $form->display('updated_at', 'Updated At');
        });
    }
    public function area()
    {
//        var_dump(11);die;
        $city_id = $_GET['q'];
//        var_dump($city_id);die;
        return SiteDetail::area()->where('city_id', $city_id)->get(['area_id as id', DB::raw('area as text')]);
    }

}
