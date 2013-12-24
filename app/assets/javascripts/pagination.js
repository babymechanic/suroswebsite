var surosSite = surosSite || {};

surosSite.pageDisplayControl = function(){
    var control = {};
    var arrayOfItems = ko.observableArray([]);
    var wasInitialized = false;

    var pageDisplayArea = function(){
        return $('#page-display-area');
    };

    var urlToGetItems = function(){
        return pageDisplayArea().attr('data-url');
    };

    var showOverLay = function(){
        $('#overlay').fadeIn('slow');
    };

    var hideOverLay = function(){
        $('#overlay').fadeOut('slow');
    };

    var getJsonDataFromTag = function(){
        return $.parseJSON(pageDisplayArea().attr('data-items'));
    };

    control.getPage = function(pageNumber,onNewPageDisplayed){
        showOverLay();
        var url = urlToGetItems() + '?page=' + pageNumber + '&tags=' + surosSite.tagFilter.getSelectedItems();
        $.ajax({
            url: url,
            type: "GET",
            dataType: 'json',
            success : function(data, textStatus, jqXHR ){
                arrayOfItems.removeAll();
                $.each(data,function(index,item){
                    arrayOfItems.push(item);
                });
                onNewPageDisplayed();
                hideOverLay();
            }
        });
    };

    control.init = function(){
        if(!wasInitialized){
            $.each(getJsonDataFromTag(),function(index,item){
                arrayOfItems.push(item);
            });
            ko.applyBindings({
                items: arrayOfItems
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

  view.updatePaginationControls = function(newPageNumber){
      if(newPageNumber == view.lastPageNumber()) {
          nextButton().addClass('disabled');
      }else{
          nextButton().removeClass('disabled');
      }
      if(newPageNumber == 1) {
          previousButton().addClass('disabled');
      }else{
          previousButton().removeClass('disabled');
      }
      currentPageButton().html(newPageNumber);
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

    var afterDisplayingNewPage = function(newPageNumber){
        view.updatePaginationControls(newPageNumber);
    };

    var onGetPrevious  = function(e){
        if(view.currentPageNumber() == 1) {
            return;
        }
        var pageToDisplay = view.currentPageNumber() - 1;
        surosSite.pageDisplayControl.getPage(pageToDisplay,function(){
            afterDisplayingNewPage(pageToDisplay);
        });
    };

    var onGetNext  = function(e){
        if(view.currentPageNumber() == view.lastPageNumber() || view.lastPageNumber() == 0 ) {
            return;
        }
        var pageToDisplay = view.currentPageNumber() + 1;
        surosSite.pageDisplayControl.getPage(pageToDisplay,function(){
            afterDisplayingNewPage(pageToDisplay);
        });
    };

    controller.init = function(){
        view.setHandlerToOnClickNext(onGetNext);
        view.setHandlerToOnClickPrevious(onGetPrevious);
    };

    controller.reset = function(){
        surosSite.pageDisplayControl.getPage(1,function(){
            afterDisplayingNewPage(1);
        });
    };

    controller.refresh = function (){
        var dsi = "";
        $.each(surosSite.tagFilter.getSelectedItems(),function(index,item){
            dsi = dsi + ":" +item
        });
        alert(dsi);
    };

    return controller;
}();

$(document).ready(function(){
    surosSite.paginationControl.view.init();
    surosSite.paginationControl.controller.init();
    surosSite.pageDisplayControl.init();
});
