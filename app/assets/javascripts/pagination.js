var surosSite = surosSite || {};

surosSite.pageDisplayControl = function(){
    var control = {};
    var arrayOfItems = ko.observableArray([]);
    var wasInitialized = false;

    var urlToGetItems = function(){
        return $('#page-display-area').attr('data-url');
    };

    control.getPage = function(pageNumber){
        init();
        var url = urlToGetItems() + "?page=" + pageNumber;
        $.ajax({
            url: url,
            type: "GET",
            dataType: 'json',
            success : function(data, textStatus, jqXHR ){
                arrayOfItems.removeAll();
                $.each(data,function(index,item){
                    arrayOfItems.push(item);
                });
            }
        });
    };

    var init = function(){
        if(!wasInitialized){
            ko.applyBindings({
                items:arrayOfItems
            });
        }
    };

    return control;
}();


surosSite.paginationControl = {};

surosSite.paginationControl.view = function(){
  var nextButton = function(){
    return $('#next_page_button');
  };

  var previousButton = function(){
    return $('#previous_page_button');
  };

  var paginationControl = function(){
    return $('#pagination-control');
  };

  var currentPageButton = function(){
    return $('#current-page');
  };

  var view = {};

  var onClickNextHandler = function(){
  };

  var onClickPreviousHandler = function(){
  };

  view.setHandlerToOnClickNext = function(handler){
    onClickNextHandler = handler;
  };

  view.setHandlerToOnClickPrevious = function(handler){
    onClickPreviousHandler = handler;
  };

  view.currentPageNumber = function(){
    return parseInt(currentPageButton().html());
  };

  view.lastPageNumber = function(){
      return parseInt(paginationControl().attr('data-total-pages'));
  };


  view.init = function(){
    nextButton().click(function(){
        onClickNextHandler();
    });
    previousButton().click(function(){
        onClickPreviousHandler();
    });
  };

  return view;

}();

surosSite.paginationControl.controller = function(){
    var controller = {};
    var view = surosSite.paginationControl.view;

    var onGetPrevious  = function(e){
        if(view.currentPageNumber() == 1) {
            return;
        }
        surosSite.pageDisplayControl.getPage(view.currentPageNumber() - 1);
    };

    var onGetNext  = function(e){
        if(view.currentPageNumber() == view.lastPageNumber()) {
            return;
        }
        surosSite.pageDisplayControl.getPage(view.currentPageNumber() + 1);
    };

    controller.init = function(){
        view.setHandlerToOnClickNext(onGetNext);
        view.setHandlerToOnClickPrevious(onGetPrevious);
    };

    return controller;
}();

$(document).ready(function(){
    surosSite.paginationControl.view.init();
    surosSite.paginationControl.controller.init();
});
