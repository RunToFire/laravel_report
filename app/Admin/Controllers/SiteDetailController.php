<?php

namespace App\Admin\Controllers;
use App\Models\ScoreGrade;
use App\Models\SiteDetail;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
//use Encore\Admin\Facades\DB;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

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
                $filter->between('account_date', trans('记录日期'))->datetime();
                $filter->equal('city_id', '城市')
                    ->select(ScoreGrade::city()->pluck('city', 'city_id'))
                    ->load('area_id', '/admin/score/area');

                $filter->equal('area_id', '区域')->select()
                    ->load('bankuai_id', '/admin/score/plate');

                $filter->equal('bankuai_id', '板块')->select()
                    ->load('work_site_id','/admin/score/site');

                $filter->equal('work_site_id', '工作站')->select();
            });
            $grid->setView('admin.grid.sitedetail');

        });
    }
}
