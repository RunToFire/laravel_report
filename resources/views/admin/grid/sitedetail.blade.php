<style>
    .w-60{width: 60px;}
    .box{font-size: 12px;}
</style>
<div class="box">
    <div class="box-header">
        <h3 class="box-title"></h3>
        <span style="position: absolute;left: 10px;top: 5px;">
            {{--{!! $grid->renderHeaderTools() !!}--}}
        </span>
        <div class="box-tools">
            {!! $grid->renderFilter() !!}
            {!! $grid->renderExportButton() !!}
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body table-responsive no-padding">
        <table class="table table-hover">
            <tr>
                <th>
                    <div class="w-60">记录<br/>日期</div>

                </th>

                <th ><div class="w-60">工作站</div></th>
                <th>板经</th>
                <th>区经</th>
                <th>阶段</th>
                <th>租约流水</th>
                <th>单量</th>
                <th>合规<br/>单量</th>
                <th>月付<br/>单量</th>
                <th>人数</th>
                <th>入职</th>
                <th>离职</th>
                <th>组长</th>
                <th>明日<br/>之星</th>
                <th>A25 </th>
                <th>A </th>
                <th>B </th>
                <th>C2</th>
                <th>C1</th>
                <th>C0</th>
                <th>DN</th>
                <th>DO</th>
                <th>A+B<br/>均流水</th>
                <th>拍照</th>
                <th>人均<br/>拍照</th>
                <th>来电</th>
                <th>人均<br/>来电</th>
                <th>带看</th>
                <th>人均<br/>带看</th>
                <th>人均<br/>可租房</th>
                <th>可租房</th>
                <th>有图<br/>可租房</th>
                <th>无图<br/>可租房</th>
                <th>新增<br/>机构</th>
                <th>主机<br/>构数</th>
                <th>可租房<br/>主机构</th>
                <th>小区<br/>总数</th>
                <th>有房<br/>小区数</th>
                <th>可租房<br/>小区数</th>
                <th>四周成<br/>交小区</th>
                <th>四周<br/>单量</th>
                <th>重点小<br/>区单量</th>
                <th>重点<br/>小区</th>
                <th>狭义<br/>出房量</th>
                <th>狭义<br/>占有率</th>
                <th>出房<br/>速度</th>
                <th>据点</th>
            </tr>
            @foreach($grid->rows() as $row)
            <tr>
                <td>{!! $row->column('account_date') !!}</td>
                <td>{!! $row->column('work_site') !!}</td>
                <td>{!! $row->column('bankuai_manager') !!}</td>
                <td>{!! $row->column('area_manager') !!}</td>
                <td>{!! $row->column('grade') !!}</td>
                <td>{!! $row->column('account') !!}</td>
                <td>{!! $row->column('rent_house') !!}</td>
                <td>{!! $row->column('qualified_num') !!}</td>
                <td>{!! $row->column('month_contract') !!}</td>
                <td>{!! $row->column('site_people') !!}</td>
                <td>{!! $row->column('cur_entry_num') !!}</td>
                <td>{!! $row->column('cur_leave_num') !!}</td>
                <td>{!! $row->column('leader_people') !!}</td>
                <td>{!! $row->column('star_people') !!}</td>
                <td>{!! $row->column('at_people') !!}</td>
                <td>{!! $row->column('a_people') !!}</td>
                <td>{!! $row->column('b_people') !!}</td>
                <td>{!! $row->column('ct_people') !!}</td>
                <td>{!! $row->column('co_people') !!}</td>
                <td>{!! $row->column('cz_people') !!}</td>
                <td>{!! $row->column('dn_people') !!}</td>
                <td>{!! $row->column('do_people') !!}</td>
                <td>{!! $row->column('ab_account') !!}</td>
                <td>{!! $row->column('picture_num') !!}</td>
                <td>{!! $row->column('arv_picture') !!}</td>
                <td>{!! $row->column('call_num') !!}</td>
                <td>{!! $row->column('arv_call_num') !!}</td>
                <td>{!! $row->column('look_num') !!}</td>
                <td>{!! $row->column('arv_look_num') !!}</td>
                <td>{!! $row->column('per_rate') !!}</td>
                <td>{!! $row->column('house_num') !!}</td>
                <td>{!! $row->column('pic_house_num') !!}</td>
                <td>{!! $row->column('nopic_house_num') !!}</td>
                <td>{!! $row->column('new_agency_num') !!}</td>
                <td>{!! $row->column('main_agency_num') !!}</td>
                <td>{!! $row->column('rentable_agency_num') !!}</td>
                <td>{!! $row->column('subdistrict_num') !!}</td>
                <td>{!! $row->column('house_subdistrict_num') !!}</td>
                <td>{!! $row->column('rentable_subdistrict_num') !!}</td>
                <td>{!! $row->column('deal_subdistrict_num') !!}</td>
                <td>{!! $row->column('deal_house_num') !!}</td>
                <td>{!! $row->column('main_deal_house_num') !!}</td>
                <td>{!! $row->column('main_deal_subdistrict_num') !!}</td>
                <td>{!! $row->column('market_house') !!}</td>
                <td>{!! $row->column('market_house_rate') !!}%</td>
                <td>{!! $row->column('market_speed') !!}</td>
                <td>{!! $row->column('point_num') !!}</td>
            </tr>
            @endforeach
        </table>
    </div>
    <div class="box-footer clearfix">
        {!! $grid->paginator() !!}
    </div>
    <!-- /.box-body -->
</div>