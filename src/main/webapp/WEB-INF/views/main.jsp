<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div>
    <form id="frmMain" action="${pageContext.request.contextPath}/main.do" method="post">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary dib">테스트 테이블</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive overflow-hidden">
                    <table class="table table-bordered table-striped table-hover nowrap w-100" id="dataTable" width="100%" cellspacing="0">
                        <caption>테스트 테이블</caption>
                        <thead>
                            <tr>
                                <th class="text-center"><span>번호</span></th>
                                <th class="text-center"><span>컬럼1</span></th>
                                <th class="text-center"><span>컬럼2</span></th>
                                <th class="text-center"><span>컬럼3</span></th>
                                <th class="text-center"><span>컬럼4</span></th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    var $mainDataTable = (function() {
        var $target = null;
        var $dataTable = null;
        return {
            table: function() {
                return $dataTable;
            },
            create:	function() {
                $("#loading").show();
                $target = $("#dataTable");
                $dataTable = $target.DataTable({
                    scrollX: true,
                    order: [[0, "asc"],],
                    ajax: {
                        type: "POST",
                        dataType: "json",
                        url: contextPath + "/mainTable.do",
                    },
                    search: {
                        regex: true,
                    },
                    createdRow: function(row, data, idx) {
                        $(row).data({
                            no: data.no,
                            col1: data.col1,
                            col2: data.col2,
                            col3: data.col3,
                            col4: data.col4,
                            test1: data.test1,
                            test2: data.test2,
                        });
                    },
                    drawCallback: function(settings) {
                        if (!$("#loading").is(":visible")) {
                            adjustTable($target);
                        }
                    },
                    initComplete: function(settings, json) {
                        // $("#loading").hide();
                        adjustTable($target);
                        // $dataTable = new $.fn.dataTable.Api(settings);

                        // test
                        setTimeout(function () {
                            $("#loading").hide();
                        }, 1000);
                    },
                    columns: [
                        {data: "no", className: "text-center va-middle",},
                        {data: "col1", className: "text-center va-middle",},
                        {
                            data: "col2",
                            className: "text-center va-middle",
                            render: function(data, type, row, meta) {
                                var temp = "";
                                if (data == "col2") {
                                    temp = "컬럼2";
                                }
                                return temp;
                            },
                        },
                        {data: "col3", className: "text-center va-middle",},
                        {data: "col4", className: "text-center va-middle",},
                    ],
                });
            },
            destroy: function() {
                $dataTable.destroy();
            },
            reload: function() {
                $mainDataTable.destroy();
                $mainDataTable.create();
            },
        };
    })();

    $(function() {
        $mainDataTable.create();
    });
</script>