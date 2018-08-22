<?php
/**
 * Created by PhpStorm.
 * User: zj
 * Date: 2018/8/21
 * Time: 18:29
 */

namespace App\Admin\Extensions;

use Encore\Admin\Grid\Exporters\AbstractExporter;
use Maatwebsite\Excel\Facades\Excel;

class ExcelExpoter extends AbstractExporter
{
    protected $type;
    public function __construct($type){
        $this->type = $type;
    }
    public function export()
    {
        if($this->type == 1 ) {
            Excel::create('人员流水情况表', function ($excel) {
                $excel->sheet('Sheetname', function ($sheet) {
                    $sheet->appendRow(['城市', '日期']);
                    foreach ($this->getData() as $k => $v) {
                        $sheet->appendRow([$v['city'], $v['account_date']]);
                    }
                });
            })->export('xls');
        }
        if($this->type == 2){
            Excel::create('人员流水情况表', function ($excel) {
                $excel->sheet('Sheetname', function ($sheet) {
                    $sheet->appendRow(['城市']);
                    foreach ($this->getData() as $k => $v) {
                        $sheet->appendRow([$v['city']]);
                    }
                });
            })->export('xls');
        }
    }
}