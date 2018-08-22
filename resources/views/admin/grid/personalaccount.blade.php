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
                <th>城市</th>
                <th>区域</th>
                <th>区域经理</th>
                <th>板块</th>
                <th>板块经理</th>
                <th>站长</th>
                <th ><div class="w-60">工作站</div></th>
                <th>姓名</th>
                <th>工号</th>
                <th>小组</th>
                <th>组长</th>
                <th>职位</th>
                <th>入职时间</th>
                <th>入职周</th>
                <th>离职日期</th>
                <th>考勤天数</th>
                <th>入职天数</th>
                <th>入职周数</th>
                <th>是否离职</th>
                <th>本周成单数</th>
                <th>合规单量数</th>
                <th>平均租约流水</th>
                <th>本周租约流水</th>
                <th>上周租约流水</th>
                <th>上2周租约流水</th>
                <th>上3周租约流水</th>
                <th>导客收入</th>
                <th>月付单量数</th>
                <th>月付收入</th>
                <th>自建客来电</th>
                <th>自媒体来电客</th>
                <th>400来电</th>
                <th>自媒体预约来电</th>
                <th>发帖来电</th>
                <th>离职转让</th>
                <th>抢单</th>
                <th>客源总量</th>
                <th>推送量</th>
                <th>推房源量</th>
                <th>打开量</th>
                <th>带看客源量</th>
                <th>带看房源量</th>
                <th>新增图招</th>
                <th>本周问题</th>
                <th>获客分数</th>
                <th>获客是否合格</th>
                <th>带看分数</th>
                <th>带看是否合格</th>
                <th>动作是否合格</th>
                <th>员工分类</th>
                <th>上周类别</th>
                <th>上2周类别</th>
                <th>上三周类别</th>
            </tr>
            @foreach($grid->rows() as $row)
            <tr>
                <td>{!! $row->column('account_date') !!}</td>
                <td>{!! $row->column('city') !!}</td>
                <td>{!! $row->column('area') !!}</td>
                <td>{!! $row->column('area_manager') !!}</td>
                <td>{!! $row->column('bankuai') !!}</td>
                <td>{!! $row->column('bankuai_manager') !!}</td>
                <td>{!! $row->column('site_name') !!}</td>
                <td>{!! $row->column('work_site') !!}</td>
                <td>{!! $row->column('tuoke') !!}</td>
                <td>{!! $row->column('tuoke_id') !!}</td>
                <td>{!! $row->column('group_name') !!}</td>
                <td>{!! $row->column('group_manager') !!}</td>
                <td>{!! $row->column('tuoke_position') !!}</td>
                <td>{!! $row->column('entry_date') !!}</td>
                <td>{!! $row->column('entry_data_week') !!}</td>
                <td>{!! $row->column('leave_date') !!}</td>
                <td>{!! $row->column('attendance_days') !!}</td>
                <td>{!! $row->column('entry_days') !!}</td>
                <td>{!! $row->column('entry_weeks') !!}</td>
                @if($row->column('is_leave') == 1 || $row->column('is_leave') == 4 )
                    <td>在职</td>
                @else
                    <td>离职</td>
                @endif
                {{--<td>{!! $row->column('is_leave') !!}</td>--}}
                <td>{!! $row->column('new_contract') !!}</td>
                <td>{!! $row->column('qualified_num') !!}</td>
                <td>{!! $row->column('average_contract_account') !!}</td>
                <td>{!! $row->column('new_contract_account') !!}</td>
                <td>{!! $row->column('after_one_account') !!}</td>
                <td>{!! $row->column('after_two_account') !!}</td>
                <td>{!! $row->column('after_three_account') !!}</td>
                <td>{!! $row->column('daoke_fee') !!}</td>
                <td>{!! $row->column('month_contract') !!}</td>
                <td>{!! $row->column('month_fee') !!}</td>
                <td>{!! $row->column('z_call') !!}</td>
                <td>{!! $row->column('zm_call') !!}</td>
                <td>{!! $row->column('s_call') !!}</td>
                <td>{!! $row->column('y_call') !!}</td>
                <td>{!! $row->column('f_call') !!}</td>
                <td>{!! $row->column('l_call') !!}</td>
                <td>{!! $row->column('q_call') !!}</td>
                <td>{!! $row->column('call_num') !!}</td>
                <td>{!! $row->column('recommend_num') !!}</td>
                <td>{!! $row->column('commend_house_num') !!}</td>
                <td>{!! $row->column('open_num') !!}</td>
                <td>{!! $row->column('look_num') !!}</td>
                <td>{!! $row->column('look_house_num') !!}</td>
                <td>{!! $row->column('picture_num') !!}</td>
                <td>{!! $row->column('questions') !!}</td>
                <td>{!! $row->column('points_score') !!}</td>
                <td>{!! $row->column('is_points') !!}</td>
                <td>{!! $row->column('look_score') !!}</td>
                <td>{!! $row->column('is_look') !!}</td>
                <td>{!! $row->column('is_action') !!}</td>
                <td>{!! $row->column('opr_grade') !!}</td>
                <td>{!! $row->column('after_one_grade') !!}</td>
                <td>{!! $row->column('after_two_grade') !!}</td>
                <td>{!! $row->column('after_three_grade') !!}</td>
            </tr>
            @endforeach
        </table>
    </div>
    <div class="box-footer clearfix">
        {!! $grid->paginator() !!}
    </div>
    <!-- /.box-body -->
</div>