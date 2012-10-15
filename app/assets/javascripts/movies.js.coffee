jQuery ->
        $('#movies').dataTable
          sDom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
          sWrapper: "dataTables_wrapper form-inline"
          sPaginationType: "bootstrap"
          iDisplayLength: 10
          bJQueryUI: false
          bProcessing: true
          bServerSide: true
          bCaseInsensitive: false
          sAjaxSource: $('#movies').data('source') 
          aoColumnDefs: [bSortable: false, aTargets: [6, 7]]
          aoColumns: [{ sWidth: '38%' }, { sWidth: '5%' }, { sWidth: '4%' }, { sWidth: '6%' }, null, { sWidth: '11%' }, { sWidth: '3%' }, { sWidth: '9%' }]
          aaSorting: [[0, "asc"]]
          oLanguage:
            sLengthMenu: "_MENU_ records per page"
