$(document).ready(function() {

    createAccordion();
     createDatePicker();
    createRiskTabel();
    createImpedimentTable();
    createQualityTargetTable();
    createChangeOrderTable();
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
}
function createQualityTargetTable(){
     $('#qualityTargetTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "sAjaxSource": "/qualityTarget/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [{"bVisible": false,"bSearchable": false,"bSortable":false},{"bVisible": false,"bSearchable": false,"bSortable":false},{"bSortable":false},{"bSortable":false}]

                }).makeEditable({
                                    sUpdateURL: "/qualityTarget/edit.json",
                                    sAddURL: "/qualityTarget/save.json",
                                    sDeleteURL: "/qualityTarget/delete.json",
                                    sAddNewRowFormId: "formAddQualityTarget",
                                    sAddNewRowButtonId: "btnAddQualityTarget",
                                    sDeleteRowButtonId: "btnDelQualityTarget",
                                    sAddNewRowOkButtonId: "btnAddQualityTargetOk",
                                    sAddNewRowCancelButtonId: "btnAddQualityTargetCancel",
                                    oAddNewRowButtonOptions: {  label: "Add...",
                                                    icons: {primary:'ui-icon-plus'}
                                    },
                                    oDeleteRowButtonOptions: {  label: "Remove",
                                                    icons: {primary:'ui-icon-trash'}
                                    },
                                    oAddNewRowOkButtonOptions: {    label: "Confirm",
                                                    icons: {primary:'ui-icon-check'},
                                                    name:"action",
                                                    value:"add-new"
                                    },
                                    oAddNewRowCancelButtonOptions: { label: "Close",
                                                     "class": "back-class",
                                                     name:"action",
                                                     value:"cancel-add",
                                                     icons: {primary:'ui-icon-close'}
                                    },
                                    oAddNewRowFormOptions: {    title: 'Add a new Quality Target - form',
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
function createChangeOrderTable(){
     $('#changeOrderTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "sAjaxSource": "/changeOrder/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [{"bVisible": false,"bSearchable": false,"bSortable":false},{"bVisible": false,"bSearchable": false,"bSortable":false},{"bSortable":false},{"bSortable":false}]

                }).makeEditable({
                                    sUpdateURL: "/changeOrder/edit.json",
                                    sAddURL: "/changeOrder/create.json",
                                    sDeleteURL: "/changeOrder/delete.json",
                                    sAddNewRowFormId: "formAddChangeOrder",
                                    sAddNewRowButtonId: "btnAddChangeOrder",
                                    sDeleteRowButtonId: "btnDelChangeOrder",
                                    sAddNewRowOkButtonId: "btnAddChangeOrderOk",
                                    sAddNewRowCancelButtonId: "btnAddChangeOrderCancel",
                                    oAddNewRowButtonOptions: {  label: "Add...",
                                                    icons: {primary:'ui-icon-plus'}
                                    },
                                    oDeleteRowButtonOptions: {  label: "Remove",
                                                    icons: {primary:'ui-icon-trash'}
                                    },
                                    oAddNewRowOkButtonOptions: {    label: "Confirm",
                                                    icons: {primary:'ui-icon-check'},
                                                    name:"action",
                                                    value:"add-new"
                                    },
                                    oAddNewRowCancelButtonOptions: { label: "Close",
                                                     "class": "back-class",
                                                     name:"action",
                                                     value:"cancel-add",
                                                     icons: {primary:'ui-icon-close'}
                                    },
                                    oAddNewRowFormOptions: {    title: 'Add a new Change Order - form',
                                                    show: "blind",
                                                    hide: "explode"
                                    },
                                    "aoColumns": [
                                                   {cssclass:"required",tooltip: 'Double Click to edit'},
                                                  {cssclass:"required",tooltip: 'Double Click to edit', maxlength: 120}
                                                 ]
                                        });

}
function createImpedimentTable(){
     $('#impedimentTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "sAjaxSource": "/impediment/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [{"bVisible": false,"bSearchable": false,"bSortable":false},{"bVisible": false,"bSearchable": false,"bSortable":false},{"bSortable":false},{"bSortable":false}]

                }).makeEditable({
                                    sUpdateURL: "/impediment/edit.json",
                                    sAddURL: "/impediment/create.json",
                                    sDeleteURL: "/impediment/delete.json",
                                    sAddNewRowFormId: "formAddImpediment",
                                    sAddNewRowButtonId: "btnAddImpediment",
                                    sDeleteRowButtonId: "btnDelImpediment",
                                    sAddNewRowOkButtonId: "btnAddImpedimentOk",
                                    sAddNewRowCancelButtonId: "btnAddImpedimentCancel",
                                    oAddNewRowButtonOptions: {  label: "Add...",
                                                    icons: {primary:'ui-icon-plus'}
                                    },
                                    oDeleteRowButtonOptions: {  label: "Remove",
                                                    icons: {primary:'ui-icon-trash'}
                                    },
                                    oAddNewRowOkButtonOptions: {    label: "Confirm",
                                                    icons: {primary:'ui-icon-check'},
                                                    name:"action",
                                                    value:"add-new"
                                    },
                                    oAddNewRowCancelButtonOptions: { label: "Close",
                                                     "class": "back-class",
                                                     name:"action",
                                                     value:"cancel-add",
                                                     icons: {primary:'ui-icon-close'}
                                    },
                                    oAddNewRowFormOptions: {    title: 'Add a new Impediment - form',
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
                    "sAjaxSource": "/risk/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [
                    {"bVisible": false,"bSearchable": false,"bSortable":false},
                    {"bVisible": false,"bSearchable": false,"bSortable":false},
                    {"bSortable":false},
                    {"bSortable":false}
                    ]

                }).makeEditable({
                                    sUpdateURL: "/risk/edit.json",
                                    sAddURL: "/risk/create.json",
                                    sDeleteURL: "/risk/delete.json",
                                    sAddNewRowFormId: "formAddRisk",
                                    sAddNewRowButtonId: "btnAddRisk",
                                    sDeleteRowButtonId: "btnDelRisk",
                                    sAddNewRowOkButtonId: "btnAddRiskOk",
                                    sAddNewRowCancelButtonId: "btnAddRiskCancel",
                                    oAddNewRowButtonOptions: {  label: "Add...",
                                                    icons: {primary:'ui-icon-plus'}
                                    },
                                    oDeleteRowButtonOptions: {  label: "Remove",
                                                    icons: {primary:'ui-icon-trash'}
                                    },
                                    oAddNewRowOkButtonOptions: {    label: "Confirm",
                                                    icons: {primary:'ui-icon-check'},
                                                    name:"action",
                                                    value:"add-new"
                                    },
                                    oAddNewRowCancelButtonOptions: { label: "Close",
                                                     "class": "back-class",
                                                     name:"action",
                                                     value:"cancel-add",
                                                     icons: {primary:'ui-icon-close'}
                                    },
                                    oAddNewRowFormOptions: {    title: 'Add a new Risk - form',
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

