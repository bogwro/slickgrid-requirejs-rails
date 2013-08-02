((factory) ->
  if define?['amd']?
    define ['jquery', 'slick/slick.grid', 'slick/slick.editors', 'slick/slick.dataview', 'jquery.event/drag', 'jquery.event/drop', 'jqueryui/widget'], factory
  else
    factory jQuery, Slick
) ($, SlickGrid, slickEditors, DataView) ->

  $.widget "dots.spreadsheet",

    options:
      data: []
      columns: []
      gridOptions:
        enableCellNavigation: true
        enableColumnReorder: false
        editable: true
        asyncEditorLoading: false
        autoEdit: false
        fullWidthRows: true
        forceFitColumns: true
      columnTypes: ['country', 'iso2']

    _updatedItems: []
    _deletedItems: []

    _create: () ->
      @el = $(@element)
      @data = @options.data

      @_deletedItems = []
      @_updatedItems = []

      @_preProcessData()
      @_buildColumnTypes()

      @dataView = new DataView()
      @grid = new SlickGrid @el, @dataView, @options.columns, @options.gridOptions

      @grid.onSort.subscribe (e, args) =>
        console.log args.sortCol.field
        comparer = (a, b) ->
          a[args.sortCol.field] > b[args.sortCol.field]

        @dataView.sort comparer, args.sortAsc

      @dataView.onRowCountChanged.subscribe () =>
        @grid.updateRowCount()
        @grid.render()

      @dataView.onRowsChanged.subscribe (e, args) =>
        @grid.invalidateRows args.rows
        @grid.render()

      @grid.onCellChange.subscribe (e, args) =>
        @_updatedItems.push args.item

      @_updateDataView()

    getUpdatedItems: () ->
      @_updatedItems

    getDeletedRows: () ->
      @_deletedItems

    getDataset: () ->
      @dataView.getItems()

    # TODO: deprecated for tests
    deleteRandom: () ->
      rand = Math.floor(Math.random() * @data.length)
      item = @dataView.getItemByIdx rand
      @_deletedItems.push item
      @dataView.deleteItem item.id

    _updateDataView: () ->
      @dataView.beginUpdate()
      @dataView.setItems @data
      @dataView.endUpdate()

    _preProcessData: () ->
      idx = 0
      for i in @data
        i.id = i.id || idx++

    _buildColumnTypes: () ->
      if @options.columns && @options.columns.length
        return @options.columns

      if @data && @data[0]
        data = @data[0]
      else
        return false

      for i of data
        if i != 'id'
          @options.columns.push(
            id: i
            name: i
            field: i
            sortable: true
            editor: slickEditors.Text
          )

    destroy: ->
      $.Widget.prototype.destroy.call(@)