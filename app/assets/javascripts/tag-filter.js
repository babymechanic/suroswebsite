var surosSite = surosSite || {};

surosSite.tagFilter = function(){
    var filter = {};
    var widget;

    var tagFilter = function(){
      return $('#tags-to-filter-by');
    };

    var getFieldToSortBy = function(){
        return tagFilter().attr('data-sort-order');
    };

    var getDisplayField = function(){
        return tagFilter().attr('data-display-field');
    };

    var getSelectedData = function(){
        return $.parseJSON(tagFilter().attr('data-value'));
    };

    var getReferenceData = function(){
        return $.parseJSON(tagFilter().attr('data-reference-data'));
    };

    filter.selectionChangedHandler = function(eventSource,selectedItems){
        surosSite.paginationControl.controller.reset();
    };

    filter.init = function(){
        widget = tagFilter().magicSuggest({
            width: 830,
            sortOrder: getFieldToSortBy(),
            displayField: getDisplayField(),
            value: getSelectedData(),
            data: getReferenceData()
        });
        $(widget).on('selectionchange',filter.selectionChangedHandler);
    };

    filter.getSelectedItems = function(){
        var selectedIds = [];
        $.each(widget.getSelectedItems(),function(index,item){
            selectedIds.push(item.id)
        });
        return selectedIds.join();
    };

    return filter;
}();

$(document).ready(function(){
    surosSite.tagFilter.init();
});
