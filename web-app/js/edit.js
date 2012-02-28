$(document).ready(function() {

     createAccordion();
     createDatePicker();
     createRiskTabel();
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
            active: false

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
function createRiskTabel()
{
    $('#riskTable').dataTable( {
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "bProcessing": true,
                    "bAutoWidth" : true,
                    "sAjaxSource": "#",
                    "aoColumns": [{"bSearchable": false,"bSortable":false},{"bSearchable": false,"bSortable":false},null,null]

                }).makeEditable({
                                    sUpdateURL: "#",
                                    sAddURL: "#",
                                    sDeleteURL: "#",
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
                                                   null,null,{cssclass:"requried"},{cssclass:"requried"}

                                                             ]
                                        });


}

