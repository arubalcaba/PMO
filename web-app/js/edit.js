var context;

$(document).ready(function() {

	context=$('#context').val();
    createAccordion();
    createDatePicker();
    createInvoiceSelect();
    createMilestoneSelect();
    createRiskTabel();
    createImpedimentTable();
    createQualityTargetTable();
    createChangeOrderTable();
    createMilestoneTabel();
    createInvoiceTabel();


});

function createAccordion()
{

 var icons = {
            header: "ui-icon-circle-arrow-e",
            headerSelected: "ui-icon-circle-arrow-s"
        };
        $( "#accordion" ).accordion({
            icons: icons,
            collapsible: true,
            active: false,
            autoHeight: false

        });
        $( "#toggle" ).button().toggle(function() {
            $( "#accordion" ).accordion( "option", "icons", false );
        }, function() {
            $( "#accordion" ).accordion( "option", "icons", icons );
        });
}
function createDatePicker ()
{
      $( "#plannedReleaseDate" ).datepicker();
      $( "#supportDocDelivered" ).datepicker();
      $( "#thirtyDayReview" ).datepicker();
      $( "#sixtyDayReview" ).datepicker();
      $( "#handOffComplete" ).datepicker();
      $( "#milestoneDate").datepicker();
      $( "#clientRequestedDate").datepicker();


}
function createInvoiceSelect()
{
        $.ajax({
            url : context + '/invoiceStatus/selectjson',
            type : 'GET',
            dataType : 'json',
            async : true,
            cache : false,
            success : function(data) {
                            if(typeof(console) !== 'undefined' && console != null) {
                                console.log("invoiceSelectJson " + JSON.stringify(data));
                                }
                var select =getOptionsHtml(data);
                $('#invoiceStatus').empty().html(select).addClass("required");
            }
        });
}
function createMilestoneSelect()
{
        $.ajax({
            url : context + '/milestone/selectjson',
            type : 'GET',
            dataType : 'json',
            async : true,
            cache : false,
            success : function(data) {
                            if(typeof(console) !== 'undefined' && console != null) {
                                console.log("invoiceSelectJson " + JSON.stringify(data));
                                }
                var select =getOptionsHtml(data);
                $('#milestone').empty().html(select).addClass("required");
            }
        });
}
function getOptionsHtml(data)
{
    retStr = " ";

    for(var i =0; i<data.option.length; i++)
    {
        retStr += '<option value="' + data.option[i][0]+'">'+ data.option[i][1] + '</option>';
        retStr +=" ";
    }
    if(typeof(console) !== 'undefined' && console != null) {
                                console.log("select " +retStr);
                                }
    return retStr;

}

function createQualityTargetTable(){
     $('#qualityTargetTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "bFilter": false,
                    "bLengthChange": false,
                    "bSort": false,
                    "sAjaxSource": context + "/qualityTarget/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [{"bVisible": false},{"bVisible": false}, null,null,null]

                }).makeEditable({
                                    sUpdateURL:context + "/qualityTarget/edit.json",
                                    sAddURL: context + "/qualityTarget/create.json",
                                    sDeleteURL: context + "/qualityTarget/delete.json",
                                    sAddNewRowFormId: "formAddQualityTarget",
                                    sAddNewRowButtonId: "btnAddQualityTarget",
                                    sDeleteRowButtonId: "btnDelQualityTarget",
                                    sAddNewRowOkButtonId: "btnAddQualityTargetOk",
                                    sAddNewRowCancelButtonId: "btnAddQualityTargetCancel",
                                    oAddNewRowButtonOptions: {  label: "Add New Quality Target",
                                                    icons: {primary:'ui-icon-plus'}
                                    },
                                    oDeleteRowButtonOptions: {  label: "Delete Quality Target",
                                                    icons: {primary:'ui-icon-trash'}
                                    },
                                    oAddNewRowOkButtonOptions: {    label: "Confirm",
                                                    icons: {primary:'ui-icon-check'},
                                                    name:"action",
                                                    value:"add-new"
                                    },
                                    oAddNewRowCancelButtonOptions: { label: "Cancel",
                                                     "class": "back-class",
                                                     name:"action",
                                                     value:"cancel-add",
                                                     icons: {primary:'ui-icon-close'}
                                    },
                                    oAddNewRowFormOptions: {    title: 'Add a new Quality Target',
                                                    show: "blind",
                                                    hide: "explode"
                                    },
                                    "aoColumns": [
                                                   {cssclass:"required",tooltip: 'Double Click to edit'},
                                                  {
                                                    cssclass:"required",
                                                    type:   'textarea',
                                                    cancel: 'Cancel',
                                                    submit: 'OK',
                                                    tooltip: 'Double Click to edit',
                                                    maxlength: 200
                                                },
                                        {
                                            type:   'checkbox',
                                            cancel: 'Cancel',
                                            submit: 'OK',
                                            checkbox: { trueValue: 'Yes', falseValue: 'No' },
                                            tooltip: 'Click to disable',
                                            sSuccessResponse: "IGNORE"
                                        }
                                                 ]

                                        });

}
function createChangeOrderTable(){
     $('#changeOrderTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "bFilter": false,
                    "bLengthChange": false,
                    "bSort": false,
                    "sAjaxSource": context + "/changeOrder/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [{"bVisible": false},{"bVisible": false}, null,null,null,null]

                }).makeEditable({
                                    sUpdateURL: context + "/changeOrder/edit.json",
                                    sAddURL: context + "/changeOrder/create.json",
                                    sDeleteURL: context + "/changeOrder/delete.json",
                                    sAddNewRowFormId: "formAddChangeOrder",
                                    sAddNewRowButtonId: "btnAddChangeOrder",
                                    sDeleteRowButtonId: "btnDelChangeOrder",
                                    sAddNewRowOkButtonId: "btnAddChangeOrderOk",
                                    sAddNewRowCancelButtonId: "btnAddChangeOrderCancel",
                                    oAddNewRowButtonOptions: {  label: "Add New Change Order",
                                                    icons: {primary:'ui-icon-plus'}
                                    },
                                    oDeleteRowButtonOptions: {  label: "Delete Change Order",
                                                    icons: {primary:'ui-icon-trash'}
                                    },
                                    oAddNewRowOkButtonOptions: {    label: "Confirm",
                                                    icons: {primary:'ui-icon-check'},
                                                    name:"action",
                                                    value:"add-new"
                                    },
                                    oAddNewRowCancelButtonOptions: { label: "Cancel",
                                                     "class": "back-class",
                                                     name:"action",
                                                     value:"cancel-add",
                                                     icons: {primary:'ui-icon-close'}
                                    },
                                    oAddNewRowFormOptions: {    title: 'Add a new Change Order',
                                                    show: "blind",
                                                    hide: "explode"
                                    },
                                    "aoColumns": [
                                                   {cssclass:"required",tooltip: 'Double Click to edit'},
                                                   {cssclass:"required number",tooltip: 'Double Click to edit'},
                                                   {cssclass:"required",tooltip: 'Double Click to edit'},
                                        {
                                            cssclass:"required",
                                            type:   'textarea',
                                            cancel: 'Cancel',
                                            submit: 'OK',
                                            tooltip: 'Double Click to edit',
                                            maxlength: 1000
                                        }
                                                 ]
                                        });

}
function createImpedimentTable(){
     $('#impedimentTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "bFilter": false,
                    "bLengthChange": false,
                    "bSort": false,
                    "sAjaxSource": context + "/impediment/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [{"bVisible": false},{"bVisible": false}, null,null]

                }).makeEditable({
                                    sUpdateURL: context + "/impediment/edit.json",
                                    sAddURL: context + "/impediment/create.json",
                                    sDeleteURL: context + "/impediment/delete.json",
                                    sAddNewRowFormId: "formAddImpediment",
                                    sAddNewRowButtonId: "btnAddImpediment",
                                    sDeleteRowButtonId: "btnDelImpediment",
                                    sAddNewRowOkButtonId: "btnAddImpedimentOk",
                                    sAddNewRowCancelButtonId: "btnAddImpedimentCancel",
                                    oAddNewRowButtonOptions: {  label: "Add New Impediment",
                                                    icons: {primary:'ui-icon-plus'}
                                    },
                                    oDeleteRowButtonOptions: {  label: "Delete Impediment",
                                                    icons: {primary:'ui-icon-trash'}
                                    },
                                    oAddNewRowOkButtonOptions: {    label: "Confirm",
                                                    icons: {primary:'ui-icon-check'},
                                                    name:"action",
                                                    value:"add-new"
                                    },
                                    oAddNewRowCancelButtonOptions: { label: "Cancel",
                                                     "class": "back-class",
                                                     name:"action",
                                                     value:"cancel-add",
                                                     icons: {primary:'ui-icon-close'}
                                    },
                                    oAddNewRowFormOptions: {    title: 'Add a new Impediment',
                                                    show: "blind",
                                                    hide: "explode"
                                    },
                                    "aoColumns": [
                                                   {cssclass:"required",tooltip: 'Double Click to edit'},
                                                  {
                                                    cssclass:"required",
                                                    type:   'textarea',
                                                    cancel: 'Cancel',
                                                    submit: 'OK',
                                                    tooltip: 'Double Click to edit',
                                                    maxlength: 120
                                                }
                                                 ]
                                        });

}
function createRiskTabel()
{
    $('#riskTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "bFilter": false,
                    "bLengthChange": false,
                    "bSort": false,
                    "sAjaxSource": context + "/risk/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [{"bVisible": false},{"bVisible": false}, null,null]

                }).makeEditable({
                                    sUpdateURL: context +  "/risk/edit.json",
                                    sAddURL: context + "/risk/create.json",
                                    sDeleteURL: context + "/risk/delete.json",
                                    sAddNewRowFormId: "formAddRisk",
                                    sAddNewRowButtonId: "btnAddRisk",
                                    sDeleteRowButtonId: "btnDelRisk",
                                    sAddNewRowOkButtonId: "btnAddRiskOk",
                                    sAddNewRowCancelButtonId: "btnAddRiskCancel",
                                    oAddNewRowButtonOptions: {  label: "Add New Risk",
                                                    icons: {primary:'ui-icon-plus'}
                                    },
                                    oDeleteRowButtonOptions: {  label: "Delete Risk",
                                                    icons: {primary:'ui-icon-trash'}
                                    },
                                    oAddNewRowOkButtonOptions: {    label: "Confirm",
                                                    icons: {primary:'ui-icon-check'},
                                                    name:"action",
                                                    value:"add-new"
                                    },
                                    oAddNewRowCancelButtonOptions: { label: "Cancel",
                                                     "class": "back-class",
                                                     name:"action",
                                                     value:"cancel-add",
                                                     icons: {primary:'ui-icon-close'}
                                    },
                                    oAddNewRowFormOptions: {    title: 'Add a new Risk',
                                                    show: "blind",
                                                    hide: "explode"
                                    },
                                    "aoColumns": [
                                                   {cssclass:"required",tooltip: 'Double Click to edit'},
                                                  {
                                                    cssclass:"required",
                                                    type:   'textarea',
                                                    cancel: 'Cancel',
                                                    submit: 'OK',
                                                    tooltip: 'Double Click to edit',
                                                    maxlength: 120
                                                }
                                                 ]
                                        });


}
function createMilestoneTabel()
{
    $('#milestoneTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "bFilter": false,
                    "bLengthChange": false,
                    "bSort": false,
                    "sAjaxSource": context + "/projectMilestone/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [{"bVisible": false},{"bVisible": false}, null,null,null,null]

                }).makeEditable({
                                    sUpdateURL: context +  "/projectMilestone/edit.json",
                                    sAddURL: context + "/projectMilestone/create.json",
                                    sDeleteURL: context + "/projectMilestone/delete.json",
                                    sAddNewRowFormId: "formAddMilestone",
                                    sAddNewRowButtonId: "btnAddMilestone",
                                    sDeleteRowButtonId: "btnDelMilestone",
                                    sAddNewRowOkButtonId: "btnAddMilestoneOk",
                                    sAddNewRowCancelButtonId: "btnAddMilestoneCancel",
                                    oAddNewRowButtonOptions: {  label: "Add New Milestone",
                                                    icons: {primary:'ui-icon-plus'}
                                    },
                                    oDeleteRowButtonOptions: {  label: "Delete Milestone",
                                                    icons: {primary:'ui-icon-trash'}
                                    },
                                    oAddNewRowOkButtonOptions: {    label: "Confirm",
                                                    icons: {primary:'ui-icon-check'},
                                                    name:"action",
                                                    value:"add-new"
                                    },
                                    oAddNewRowCancelButtonOptions: { label: "Cancel",
                                                     "class": "back-class",
                                                     name:"action",
                                                     value:"cancel-add",
                                                     icons: {primary:'ui-icon-close'}
                                    },
                                    oAddNewRowFormOptions: {    title: 'Add New Milestone',
                                                    show: "blind",
                                                    hide: "explode"
                                    },
                                    "aoColumns": [
                                                   {
                                                      tooltip: 'Click to select milestone',
                                                      loadtext: 'loading...',
                                                      type: 'select',
                                                      onblur: 'cancel',
                                                      submit: 'Ok',
                                                      loadurl: context + '/milestone/listjson',
                                                      loadtype: 'GET',
                                                      cssclass:"required"
                                                  },
                                                   {
                                                     type:   'checkbox',
                                                     cancel: 'Cancel',
                                                     submit: 'OK',
                                                     checkbox: { trueValue: 'Yes', falseValue: 'No' },
                                                     tooltip: 'Click to disable',
                                                     sSuccessResponse: "IGNORE"
                                                  },
                                                   {
                                                     type:   'datepicker',
                                                     cssclass:"required",
                                                     tooltip: 'Click to disable',
                                                     sSuccessResponse: "IGNORE"
                                                  },
                                                  {
                                                    type:   'textarea',
                                                    cancel: 'Cancel',
                                                    submit: 'OK',
                                                    tooltip: 'Double Click to edit',
                                                    maxlength: 120
                                                }
                                                 ]
                                        });


}
function createInvoiceTabel()
{
    $('#invoiceTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "bFilter": false,
                    "bSort": false,
                    "bLengthChange": false,
                    "sAjaxSource": context + "/projectInvoice/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                     "aoColumns": [{"bVisible": false},{"bVisible": false}, null,null,null]


                }).makeEditable({
                                    sUpdateURL: context +  "/projectInvoice/edit.json",
                                    sAddURL: context + "/projectInvoice/create.json",
                                    sDeleteURL: context + "/projectInvoice/delete.json",
                                    sAddNewRowFormId: "formAddInvoice",
                                    sAddNewRowButtonId: "btnAddInvoice",
                                    sDeleteRowButtonId: "btnDelInvoice",
                                    sAddNewRowOkButtonId: "btnAddInvoiceOk",
                                    sAddNewRowCancelButtonId: "btnAddInvoiceCancel",
                                    oAddNewRowButtonOptions: {  label: "Add New Invoice",
                                                    icons: {primary:'ui-icon-plus'}
                                    },
                                    oDeleteRowButtonOptions: {  label: "Delete Invoice",
                                                    icons: {primary:'ui-icon-trash'}
                                    },
                                    oAddNewRowOkButtonOptions: {    label: "Confirm",
                                                    icons: {primary:'ui-icon-check'},
                                                    name:"action",
                                                    value:"add-new"
                                    },
                                    oAddNewRowCancelButtonOptions: { label: "Cancel",
                                                     "class": "back-class",
                                                     name:"action",
                                                     value:"cancel-add",
                                                     icons: {primary:'ui-icon-close'}
                                    },
                                    oAddNewRowFormOptions: {    title: 'Add new Invoice',
                                                    show: "blind",
                                                    hide: "explode"
                                    },
                                   "aoColumns": [
                                                   {cssclass:"required number",tooltip: 'Double Click to edit'},
                                                   {
                                                      tooltip: 'Click to select status',
                                                      loadtext: 'loading...',
                                                      type: 'select',
                                                      onblur: 'cancel',
                                                      submit: 'Ok',
                                                      loadurl: context + '/invoiceStatus/listjson',
                                                      loadtype: 'GET',
                                                      cssclass:"required"
                                                  },
                                                  {
                                                    type:   'textarea',
                                                    cancel: 'Cancel',
                                                    submit: 'OK',
                                                    tooltip: 'Double Click to edit',
                                                    maxlength: 120
                                                }
                                                 ]
                                        });


}



