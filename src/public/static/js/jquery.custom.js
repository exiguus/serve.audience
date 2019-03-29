// extend jQuery
$.fn.scrollView = function () {
    return this.each(function () {
        $('html, body').animate({
            scrollTop: $(this).offset().top
        }, 250);
    });
}
$.fn.calculateNaturalWidth = function(onNaturalWidthDefined) {
    var img = this[0];
    var naturalWidth = img.naturalWidth;
    if (naturalWidth) {
        onNaturalWidthDefined(img);
        img.myNaturalWidth = img.naturalWidth;
    } else { //No naturalWidth attribute in IE<9 - calculate it manually.
        var newImg = new Image();
        newImg.src = img.src;
        //Wait for image to load
        if (newImg.complete) {
            img.myNaturalWidth = newImg.width;
            onNaturalWidthDefined(img);
        } else {
            $(newImg).load(function() {img.myNaturalWidth=newImg.width; onNaturalWidthDefined(img)});
        }
    }
};
var uniqueCntr = 0;
$.fn.scrolled = function (waitTime, fn) {
    if (typeof waitTime === "function") {
        fn = waitTime;
        waitTime = 250;
    }
    var tag = "scrollTimer" + uniqueCntr++;
    this.scroll(function () {
        var self = $(this);
        var timer = self.data(tag);
        if (timer) {
            clearTimeout(timer);
        }
        timer = setTimeout(function () {
            self.removeData(tag);
            fn.call(self[0]);
        }, waitTime);
        self.data(tag, timer);
    });
};
