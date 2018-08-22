<?php

namespace App\Admin\Controllers;
use App\Models\ScoreGrade;
use App\Models\SiteDetail;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ScoreGradeController extends Controller
{
    use ModelForm;

    /**
     * get area options
     *
     * @return array
     */
    public function area(Request $request)
    {
        $cityId = $request->get('q');
        return ScoreGrade::area()->where('city_id', $cityId)->get(['area_id as id', DB::raw('area as text')]);
    }
    public function areaname(Request $request)
    {
        $city = $request->get('q');
        return ScoreGrade::area()->where('city', $city)->get(['area',DB::raw('area as text')]);
    }
    /**
     * get Plate options
     * @return array
     */
    public function plate(Request $request)
    {
        $areaId = $request->get('q');
        $arr = ScoreGrade::plate()->where('area_id', $areaId)->get(['bankuai_id as id', DB::raw('bankuai as text')]);
        return $arr;
    }
    public function platename(Request $request)
    {
        $area = $request->get('q');
        $arr = ScoreGrade::plate()->where('area', $area)->get(['bankuai', DB::raw('bankuai as text')]);
        return $arr;
    }
    /**
     * get Plate options
     *
     * @return array
     */
    public function site(Request $request)
    {
        $bankuai_id = $request->get('q');
        return ScoreGrade::site()->where('bankuai_id', $bankuai_id)->get(['work_site_id as id', DB::raw('work_site as text')]);
    }
    public function sitename(Request $request)
    {
        $bankuai = $request->get('q');
        return ScoreGrade::site()->where('bankuai', $bankuai)->get(['work_site', DB::raw('work_site as text')]);
    }

}
