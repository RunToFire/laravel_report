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
                $filter->equal('city_id', '城市')
                    ->select(ScoreGrade::city()->pluck('city', 'city_id'))
                    ->load('area_id', '/admin/sitedetail/area');

                $filter->equal('area_id', '区域')->select()
                    ->load('bankuai_id', '/admin/sitedetail/plate');

                $filter->equal('bankuai_id', '板块')->select()
                    ->load('work_site_id','/admin/sitedetail/site');

                $filter->equal('work_site_id', '工作站')->select();
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
    /**
     * get area options.
     *
     * @return array
     */
    public function area(Request $request)
    {
        $cityId = $request->get('q');
        return ScoreGrade::area()->where('city_id', $cityId)->get(['area_id as id', DB::raw('area as text')]);
    }
    /**
     * get Plate options.
     *
     * @return array
     */
    public function plate(Request $request)
    {
        $areaId = $request->get('q');
        return ScoreGrade::plate()->where('area_id', $areaId)->get(['bankuai_id as id', DB::raw('bankuai as text')]);
    }

    /**
     * get Plate options.
     *
     * @return array
     */
    public function site(Request $request)
    {
        $bankuai_id = $request->get('q');
        return ScoreGrade::site()->where('bankuai_id', $bankuai_id)->get(['work_site_id as id', DB::raw('work_site as text')]);
    }

}
