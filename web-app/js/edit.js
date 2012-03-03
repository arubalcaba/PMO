$(document).ready(function() {

     createAccordion();
     createDatePicker();
     createRiskTabel();
     createImpedimentTable();
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
}
function createImpedimentTable(){
     $('#impedimentTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "sAjaxSource": "/PMO_Dashboard/impediment/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [{"bVisible": false,"bSearchable": false,"bSortable":false},{"bVisible": false,"bSearchable": false,"bSortable":false},{"bSortable":false},{"bSortable":false}]

                }).makeEditable({
                                    sUpdateURL: "/PMO_Dashboard/impediment/update.json",
                                    sAddURL: "/PMO_Dashboard/impediment/save.json",
                                    sDeleteURL: "/PMO_Dashboard/impediment/delete.json",
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
                                    oAddNewRowFormOptions: {    title: 'Add a new Risk - form',
                                                    show: "blind",
                                                    hide: "explode"
                                    }
                                        });
    
}
function createRiskTabel()
{
    $('#riskTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : false,
                    "sAjaxSource": "/PMO_Dashboard/risk/dataTablesSource?projectInfoId=" + $('#projectInfo').val(),
                    "aoColumns": [
                    {"bVisible": false,"bSearchable": false,"bSortable":false},
                    {"bVisible": false,"bSearchable": false,"bSortable":false},
                    {"bSortable":false},
                    {"bSortable":false}
                    ]

                }).makeEditable({
                                    sUpdateURL: "/PMO_Dashboard/risk/update.json",
                                    sAddURL: "/PMO_Dashboard/risk/save.json",
                                    sDeleteURL: "/PMO_Dashboard/risk/delete.json",
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
                                    }
                                        });


}

