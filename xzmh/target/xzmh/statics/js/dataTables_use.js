//dataTables 调用


function dataTableProcess(object){
	$(""+object+"").DataTable({
		responsive : true,
		"processing" : true, //开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
		"bLengthChange" : true, //默认true，开启一页显示多少条数据的下拉菜单，允许用户从下拉框(10、25、50和100)，注意需要分页(bPaginate：true)。
		"oLanguage" : {
			"sLengthMenu" : "每页显示 _MENU_ 条记录",
			"sZeroRecords" : "抱歉， 没有找到",
			"sInfo" : "当前第 _START_ 至 _END_ 项记录 /共 _TOTAL_ 项数据",
			"sInfoEmpty" : "没有数据",
			"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
			"sZeroRecords" : "没有检索到数据",
			"sSearch" : "查询:",
			"oPaginate" : {
				"sFirst" : "首页",
				"sPrevious" : "前一页",
				"sNext" : "后一页",
				"sLast" : "尾页"
			}
		}
	});
}
	


