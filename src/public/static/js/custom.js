(function ($) {

  "use strict";

  var debounce = {

    init: function(func, wait, immediate) {
      var timeout;
      return function() {
        var context = this, args = arguments;
        var later = function() {
          timeout = null;
          if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
      };
    }
  };

  var deviceSelector = {

      init: function () {
        this.media = $(".deviceSelector:visible").attr("id");
        $("body")
          .removeClass("isTablet")
          .removeClass("isMobile")
          .removeClass("isDesktop")
        .addClass(this.media);
      },
      getDeviceType: function(){
        return this.media;
      }
  };

  var imageHelper = {

    setNaturalWidth: function() {
      var $images = $('.image img');
      $images.each(function() {
        $(this).calculateNaturalWidth(function(img) {
          $(img).parent('.image').css("max-width",Math.round(img.myNaturalWidth)+"px");
        });
      });
    }
  };

  var videoHelper = {
    setSize: function() {
      var $video = $('[src^="http://www.youtube"], [src^="https://www.youtube"], [src^="http://www.vimeo"], [src^="https://www.vimeo"]');
      $video.each(function(){
        var $this = $(this);
        if ($this.attr("data-ratio")) {
          $this.height(Math.round($this.width()*($this.attr("data-ratio"))));
        }else{
          var ratio = $this.height()/$this.width();
          $this.width("100%").height(Math.round($this.width()*ratio)).attr("data-ratio",ratio);
        }
      });
    }
  };

  var tableHelper = {
    setWrapper: function() {
      $('.content table').wrap('<div class="table-wrap"></div>');
    },
  };

  var viewHelper = {

    scrollToTarget: function() {
      var $anchor = $('a[href^="#"]');
      $anchor.bind("click",function(e) {
        var target = $(this).attr("href");
        $(target).scrollView();
        e.preventDefault();
      });
    },
    scrollIntoView: function($element) {
      var docViewTop = $(window).scrollTop();
      var docViewBottom = docViewTop + $(window).height();
      var elementTop = $element.offset().top;
      var elementBottom = elementTop + $element.height();

      return (((elementTop - ($element.height()/2)) <= docViewTop));
    },
    getSectionPrev: function() {
      var $section = $('[data-id]');
      var $sectionActive;
      var sectionCount = $section.length - 2;
      var sectionActive = 0;
      var sectionPrev = 9999;
      $section.each(function(){
        var $this = $(this);
        if ($this.hasClass('active')) {
          $sectionActive = $this;
          sectionActive = parseInt($sectionActive.attr("data-id"));
        }
      });
      if ((sectionActive > 0) && (sectionActive < sectionCount)) {
        sectionPrev = sectionActive - 1;
      }else if(sectionActive == sectionCount) {
        sectionPrev = sectionActive - 1;
      }else if(sectionActive == 9999) {
        sectionPrev = sectionCount;
      }else if(sectionActive === 0) {
        sectionPrev = 9999;
      }
      return sectionPrev;
    },
    getSectionNext: function() {
      var $section = $('[data-id]');
      var $sectionActive;
      var sectionCount = $section.length - 2;
      var sectionActive = 0;
      var sectionNext = 1;
      $section.each(function(){
        var $this = $(this);
        if ($this.hasClass('active')) {
          $sectionActive = $this;
          sectionActive = parseInt($sectionActive.attr("data-id"));
        }
      });
      if ((sectionActive > 0) && (sectionActive < sectionCount)) {
        sectionNext = sectionActive + 1;
      }else if(sectionActive == sectionCount) {
        sectionNext = 9999;
      }else if(sectionActive == 9999) {
        sectionNext = 0;

      }else if(sectionActive === 0) {
        sectionNext = 1;
      }
      return sectionNext;
    },
    bindKeys: function(e) {
      var $navItems = $("main + nav ol li");
      var currentLocation = window.location.href.split('/')[3];
      var indexLocation = $('link[rel="home"]').attr("href");
      var target = indexLocation;

      switch(e.which) {
        case 38: // up
          $('[data-id="'+this.getSectionPrev()+'"]').scrollView();
        break;

        case 40: // down
          $('[data-id="'+this.getSectionNext()+'"]').scrollView();
        break;

        case 72: // h home
          target = $navItems.first().find("a").attr("href");
          if (target != currentLocation) window.location.href = target;
        break;
        case 39: // n next page
          if (currentLocation == $navItems.last().find("a").attr("href")) {
            target = $navItems.first().find("a").attr("href");
          }else{
            $navItems.each(function(){
              var $this = $(this);
              var $link = $this.find("a");
              if ($this.hasClass("current")) {
                target = $this.next("li").find("a").attr("href");
                return false;
              }
            });
          }
          if (target != currentLocation) window.location.href = target;
        break;

        case 37: // p prev page
          if (currentLocation == indexLocation) {
            target = $navItems.last().find("a").attr("href");
          }else{
            $navItems.each(function(){
              var $this = $(this);
              var $link = $this.find("a");
              if ($this.hasClass("current")) {
                target = $this.prev("li").find("a").attr("href");
                return false;
              }
            });
          }
          if (target != currentLocation) window.location.href = target;
        break;

        default: return; // exit this handler for other keys
      }
      e.preventDefault(); // prevent the default action (scroll / move caret)
    },
    sectionHighlighter: function(){
      var $article = $('[data-id], #toc');
      $.each($article,function() {
        var $this = $(this);
        if (viewHelper.scrollIntoView($this)) {
          if(!$this.hasClass('active')) {
            var thisId = $this.attr("id");
            var $otherSections = $('[data-id], #toc').not('[data-id='+thisId+']');
            $otherSections.removeClass('active');
            $this.addClass('active');
            //console.log($this.attr("data-id"));
          }
        }
      });
    }
  };
  // all functions that could be called multiple times
  var initFunctions = {

    init: function(){

      deviceSelector.init();
      $('[data-id="0"]').addClass("active");
      // images
      imageHelper.setNaturalWidth();
      videoHelper.setSize();
      tableHelper.setWrapper();
      // target/anchor in/to page
      viewHelper.scrollToTarget();
      if(Modernizr.touch){
        $('[href="#top"]')[0].click();
      }
    },
    initOnce: function() {

      var debouncedResizeFunction = debounce.init(function() {
         deviceSelector.init();
         imageHelper.setNaturalWidth();
         videoHelper.setSize();
      }, 250);

      if(Modernizr.touch){
        $(window).on('orientationchange, resize', debouncedResizeFunction);
      }
      else {
        $(window).on('resize', debouncedResizeFunction);
      }
    }

  };


  // bindings
  $(document).ready(function(){

    initFunctions.initOnce();
    initFunctions.init();

  });

  $(document).keydown(function(e) {

    viewHelper.bindKeys(e);

  });

  $(window).scrolled(function () {

    viewHelper.sectionHighlighter();

  });


})(jQuery);
