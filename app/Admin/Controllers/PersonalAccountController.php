<?php

namespace App\admin\Controllers;

use Illuminate\Http\Request;

use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;
use App\Models\PersonalAccount;
use App\Models\ScoreGrade;
use Encore\Admin\Grid;

use App\Admin\Extensions\ExcelExpoter;


class PersonalAccountController extends Controller
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
            $content->header('人员管理');
            $content->description('人员流水情况');
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
        return Admin::grid(PersonalAccount::class, function (Grid $grid) {

            $grid->id('ID')->sortable()->orderby('ASC');
            $grid->account_date('记录日期');
            $grid->filter(function (Grid\Filter $filter){
                $filter->disableIdFilter();
                $filter->between('account_date', trans('记录日期'))->datetime();
                $filter->equal('city', '城市')
                    ->select(ScoreGrade::city()->pluck('city', 'city'))
                    ->load('area', '/admin/score/areaname');

                $filter->equal('area', '区域')->select()
                    ->load('bankuai', '/admin/score/platename');

                $filter->equal('bankuai', '板块')->select()
                    ->load('work_site','/admin/score/sitename');

                $filter->equal('work_site', '工作站')->select();
            });
            $grid->exporter(new ExcelExpoter(1));
            $grid->setView('admin.grid.personalaccount');

        });
    }

}
