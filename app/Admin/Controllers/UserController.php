<?php

namespace App\Admin\Controllers;

use App\Model\User;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Facades\DB;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;



class UserController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
//        return Admin::content(function (Content $content) {
//            $content->header('用户管理');
//            $content->descripti on('用户列表');
//
//            $content->body($this->grid());
//        });

    }
    function  test(){
        $users = DB::select('select * from personal_account where id = ?', [1]);
        var_dump($users);die;
        return view('personal.test', ['users' => $users]);
    }
    /**
     * Index interface.
     *
     * @return Content
     */
    public function thelist()
    {
        return Admin::content(function (Content $content) {
            $content->header('用户管理');
            $content->description('用户列表');
            $content->body($this->grid());
        });
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('编辑');
            $content->description('编辑用户');
            $content->body($this->form()->edit($id));

        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {

        return Admin::content(function (Content $content) {

            $content->header('添加');
            $content->description('新增用户');
            $content->body($this->form());
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(User::class, function (Grid $grid) {

            // 第一列显示id字段，并将这一列设置为可排序列
            $grid->id('ID')->sortable();

            // 第二列显示title字段，由于title字段名和Grid对象的title方法冲突，所以用Grid的column()方法代替
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');
            $grid->column('city');


            // 第四列显示为describe字段
            $grid->bankuai();
            $grid->bankuai();
            $grid->bankuai();
            $grid->bankuai();
            $grid->bankuai();
            $grid->bankuai();
            $grid->bankuai();
            $grid->bankuai();
            $grid->bankuai();
            $grid->bankuai();
            $grid->bankuai();

            // 第五列显示为rate字段
            $grid->work_site();

            // 第六列显示released字段，通过display($callback)方法来格式化显示输出
            $grid->is_points('合格')->display(function ($is_points) {
                return $is_points==1 ? '是' : '否';
            });

            // 下面为三个时间字段的列显示
            $grid->create_date();
            $grid->account_date();
            $grid->create_time();

            // filter($callback)方法用来设置表格的简单搜索框
            $grid->filter(function ($filter) {
                // 设置created_at字段的范围查询
                $filter->between('account_date', '记录日期')->datetime();
            });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(User::class, function (Form $form) {
            $form->text('city', '城市');
            $form->text('bankuai', '板块');
        });
    }
}
