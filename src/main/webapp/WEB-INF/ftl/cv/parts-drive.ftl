<#include "../include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<body>
<div id="tab-drive" class="parts-tab">
    <ul>
        <li>原装</li>
        <li>加减装</li>
        <li>可换装</li>
    </ul>
    <div id="content-drive"></div>
    <div id="content-drive-add"></div>
    <div id="content-drive-replace"></div>
</div>
<script type="text/javascript">
    var tabDriveScript = $('#tab-drive').kendoTabStrip({
        animation: {
            close: {
                duration: 100,
                effects: "fadeOut"
            },
            open: {
                duration: 100,
                effects: "fadeIn"
            },scrollable: false

        }
    }).data("kendoTabStrip");
    tabDriveScript.select(0);

    var driveDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/parts/create",
                dataType: "json"
            },
            destroy :{
                url:"/parts/destroy",
                dataType: "json"
            },
            update: {
                url:"/parts/update",
                dataType: "json"
            },
            read :{
                url:"/parts/read",
                dataType: "json"
            },
            param:{
                typeId:6
            }
        },
        page: 1,
        pageSize: 10
    });

    var driveAddDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/parts/add/create",
                dataType: "json"
            },
            destroy :{
                url:"/parts/add/destroy",
                dataType: "json"
            },
            update: {
                url:"/parts/add/update",
                dataType: "json"
            },
            read :{
                url:"/parts/add/read",
                dataType: "json"
            },
            param:{
                typeId:6
            }
        },
        page: 1,
        pageSize: 10
    });

    var driveReplaceDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/parts/replace/create",
                dataType: "json"
            },
            destroy :{
                url:"/parts/replace/destroy",
                dataType: "json"
            },
            update: {
                url:"/parts/replace/update",
                dataType: "json"
            },
            read :{
                url:"/parts/replace/read",
                dataType: "json"
            },
            param:{
                typeId:6
            }
        },
        page: 1,
        pageSize: 10
    });

    var driveArgs = {
        toolBar:true,
        editable:true,
        columns:[
            {
                field:'partsName',
                title:'名称',
                attributes:{
                    style:{
                        'width':'25%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="partsName">'+
                '<span></span>'+
                '</div>'
            },{
                field:'createTime',
                title:'创建时间',
                attributes:{
                    style:{
                        'width':'40%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" placeholder="" value="" name="createTime">'+
                '<span></span>'+
                '</div>'
            },{
                field:'status',
                title:'状态',
                attributes:{
                    style:{
                        'width':'auto',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="status">'+
                '<span></span>'+
                '</div>'
            }
        ],
        dataSource:driveDataSource,
        dataId: 'partsId'
    };

    var driveAddArgs = {
        toolBar:true,
        editable:true,
        columns:[
            {
                field:'addName',
                title:'名称',
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="addName">'+
                '<span></span>'+
                '</div>'
            },{
                field:'unit',
                title:'单位',
                attributes:{
                    style:{
                        'width':'10%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="unit">'+
                '<span></span>'+
                '</div>'
            },{
                field:'taxPrice',
                title:'税前价',
                attributes:{
                    style:{
                        'width':'10%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="taxPrice">'+
                '<span></span>'+
                '</div>'
            },{
                field:'remarks',
                title:'备注',
                attributes:{
                    style:{
                        'width':'25%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="remarks">'+
                '<span></span>'+
                '</div>'
            },{
                field:'createTime',
                title:'创建时间',
                attributes:{
                    style:{
                        'width':'20%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" placeholder="" value="" name="createTime">'+
                '<span></span>'+
                '</div>'
            },{
                field:'status',
                title:'状态',
                attributes:{
                    style:{
                        'width':'auto',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="status">'+
                '<span></span>'+
                '</div>'
            }
        ],
        dataSource:driveAddDataSource,
        dataId: 'addId'
    };

    var driveReplaceArgs = {
        toolBar:true,
        editable:true,
        columns:[
            {
                field:'replaceBefore',
                title:'更换前',
                type:'lov',
                lovOptions:{
                    columns:[
                        {field:'partsId',name:'配件编号'},
                        {field:'partsName',name:'配件名称'}
                    ],
                    url:'/parts/read',
                    param:{
                        typeId:6
                    }
                },
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group lov-div">'+
                    '<input class="form-control" type="hidden" placeholder="" name="replaceBefore">'+
                    '<div class="form-control" type="text">'+
                        '<span class="lov-name"></span>'+
                        '<button class="btn-clear-input" type="button">'+
                        '<i class="fa fa-times" aria-hidden="true"></i>'+
                        '</button>'+
                    '</div>'+
                    '<div class="input-group-btn">'+
                        '<button class="btn btn-default lov-btn" type="button">'+
                        '<i class="fa fa-search" aria-hidden="true"></i>'+
                        '</button>'+
                    '</div>'+
                '</div>'
            },{
                field:'replaceAfter',
                title:'更换后',
                type:'lov',
                lovOptions:{
                    columns:[
                        {field:'partsId',name:'配件编号'},
                        {field:'partsName',name:'配件名称'}
                    ],
                    url:'/parts/read',
                    param:{
                        typeId:6
                    }
                },
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                    '<div class="input-group lov-div">'+
                        '<input class="form-control" type="hidden" placeholder="" name="replaceAfter">'+
                        '<div class="form-control" type="text">'+
                            '<span class="lov-name"></span>'+
                            '<button class="btn-clear-input" type="button">'+
                            '<i class="fa fa-times" aria-hidden="true"></i>'+
                            '</button>'+
                        '</div>'+
                        '<div class="input-group-btn">'+
                            '<button class="btn btn-default lov-btn" type="button">'+
                            '<i class="fa fa-search" aria-hidden="true"></i>'+
                            '</button>'+
                        '</div>'+
                    '</div>'
            },{
                field:'unit',
                title:'单位',
                attributes:{
                    style:{
                        'width':'10%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="unit">'+
                '<span></span>'+
                '</div>'
            },{
                field:'taxPrice',
                title:'税前价',
                attributes:{
                    style:{
                        'width':'10%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="taxPrice">'+
                '<span></span>'+
                '</div>'
            },{
                field:'remarks',
                title:'备注',
                attributes:{
                    style:{
                        'width':'20%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="remarks">'+
                '<span></span>'+
                '</div>'
            },{
                field:'createTime',
                title:'创建时间',
                attributes:{
                    style:{
                        'width':'20%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" placeholder="" value="" name="createTime">'+
                '<span></span>'+
                '</div>'
            },{
                field:'status',
                title:'状态',
                attributes:{
                    style:{
                        'width':'auto',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="status">'+
                '<span></span>'+
                '</div>'
            }
        ],
        dataSource:driveReplaceDataSource,
        dataId: 'replaceId'
    };

    $('#content-drive').dataGrid(driveArgs); //调用jQuery对象方法
    $('#content-drive-add').dataGrid(driveAddArgs);
    $('#content-drive-replace').dataGrid(driveReplaceArgs);



</script>
</body>
