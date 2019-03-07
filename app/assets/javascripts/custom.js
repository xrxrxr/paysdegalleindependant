function indexProducts() {
$(document).ready(function() {
// ------------------------ SHOW MORE -------------------
    let btn = $('#load-more');
    let cardsBoxes = $('.col-lg-4.col-md-6');
    
    $(cardsBoxes).hide();
    let x = 12
    showXFirsts(x)

    function showXFirsts (x) {
        for(let i = 0; i < x; i++) {
            $(cardsBoxes[i]).show();
        };
    };

    $(btn).click(function(){
        x += 6;
        showXFirsts(x)
    });
// ------------------------ SHOW MORE -------------------
// ----------------------- CHECKBOXES -------------------

    // function unckeckAll() {
    //     for(let i = 0; i < allCheckboxes.length; i++) {
    //         $(allCheckboxes)[i].checked = false;
    //     };
    // };

    function hideAll() {
        $(cardsBoxes).fadeOut(500);
    }

    function showAll() {
        $(cardsBoxes).fadeIn(500);
    }

    let allCheckboxes = $('input[type="radio"]');
    let checkboxAll = $('#checkbox27');
    let checkboxCat1 = $('#checkbox28-1');
    let checkboxCat2 = $('#checkbox28-2');
    let checkboxCat3 = $('#checkbox28-3');
    let bntRefresh = $('.btn-refresh');

    // unckeckAll()
    // Check first radio button at refresh
    $(allCheckboxes)[0].checked = true; 


    $(bntRefresh).click(function() {
        $(allCheckboxes)[0].checked = true; 
        showAll();
    });

    $(checkboxAll).click(function() {
        if($(allCheckboxes)[0].checked) {
            showAll();
        }
    });

    $(checkboxCat1).click(function() {
        if($(allCheckboxes)[1].checked) {
            hideAll();
            $('.cat-1').fadeIn(500);
        }
    });

    $(checkboxCat2).click(function() {
        if($(allCheckboxes)[2].checked) {
            hideAll();
            $('.cat-2').fadeIn(500);
        }
    });

    $(checkboxCat3).click(function() {
        if($(allCheckboxes)[3].checked) {
            hideAll();
            $('.cat-3').fadeIn(500);
        }
    });
});         
};       



function imageZoom(imgID, resultID) {
  var img, lens, result, cx, cy;
  img = document.getElementById(imgID);
  result = document.getElementById(resultID);
  cont = document.getElementById('img-float-container');
  /* Create lens: */
  lens = document.createElement("DIV");
  lens.setAttribute("class", "img-zoom-lens");
  /* Insert lens: */
  img.parentElement.insertBefore(lens, img);
  /* Calculate the ratio between result DIV and lens: */
  cx = result.offsetWidth / lens.offsetWidth;
  cy = result.offsetHeight / lens.offsetHeight;
  /* Set background properties for the result DIV */
  result.style.backgroundImage = "url('" + img.src + "')";
  result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";
  /* Execute a function when someone moves the cursor over the image, or the lens: */
  // img.addEventListener('mouseover', appear, false);
  // img.addEventListener("mouseout", disappear);
  lens.addEventListener("mousemove", moveLens);
  img.addEventListener("mousemove", moveLens);
  /* And also for touch screens: */
  lens.addEventListener("touchmove", moveLens);
  img.addEventListener("touchmove", moveLens);

  // $(`#${imgID}`).mouseenter(function() {
  //   $(`#${resultID}`).show(500);
  // });
  // // $(`#${imgID}`).mouseleave(function() {
  // //   $(`#${resultID}`).hide(500);
  // // });


  // function appear(){
  //   result.style.display = block;
  // }
  // function disappear(){
  //   result.style.display = 'none';
  // }

  function moveLens(e) {
    var pos, x, y;
    /* Prevent any other actions that may occur when moving over the image */
    e.preventDefault();
    /* Get the cursor's x and y positions: */
    pos = getCursorPos(e);
    /* Calculate the position of the lens: */
    x = pos.x - (lens.offsetWidth / 2);
    y = pos.y - (lens.offsetHeight / 2);
    /* Prevent the lens from being positioned outside the image: */
    if (x > img.width - lens.offsetWidth) {x = img.width - lens.offsetWidth;}
    if (x < 0) {x = 0;}
    if (y > img.height - lens.offsetHeight) {y = img.height - lens.offsetHeight;}
    if (y < 0) {y = 0;}
    /* Set the position of the lens: */
    lens.style.left = x + "px";
    lens.style.top = y + "px";
    /* Display what the lens "sees": */
    result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
  }

  function getCursorPos(e) {
    var a, x = 0, y = 0;
    e = e || window.event;
    /* Get the x and y positions of the image: */
    a = img.getBoundingClientRect();
    /* Calculate the cursor's x and y coordinates, relative to the image: */
    x = e.pageX - a.left;
    y = e.pageY - a.top;
    /* Consider any page scrolling: */
    x = x - window.pageXOffset;
    y = y - window.pageYOffset;
    return {x : x, y : y};
  }
} 

// ------------------------ REPARATION NAVBAR RESPONSIVE ---------------------
$(document).ready(function() {
    $('#navbar-btn').click(function () {
        $('.collapse').show(500);
    });
});


/*  @preserve
 *  Project: jQuery plugin Watermark
 *  Description: Add watermark on images use HTML5 and Javascript.
 *  Author: Zzbaivong (devs.forumvi.com)
 *  Version: 0.2
 *  License: MIT
 */
!function(t,e,i){"use strict";function a(e,i){this.element=e,this.settings=t.extend({},r,i),this._defaults=r,this._name=n,this.init()}var n="watermark",r={path:"watermark.png",text:"",textWidth:130,textSize:13,textColor:"white",textBg:"rgba(0, 0, 0, 0.4)",gravity:"se",opacity:.7,margin:10,outputWidth:"auto",outputHeight:"auto",outputType:"jpeg",done:function(t){this.src=t},fail:function(){},always:function(){}};t.extend(a.prototype,{init:function(){var e=this,i=e.element,a=e.settings,n={imgurl:a.path,type:"png",cross:!0},r={imgurl:i.src,cross:!0,type:a.outputType,width:a.outputWidth,height:a.outputHeight};0===a.path.search(/data:image\/(png|jpg|jpeg|gif);base64,/)&&(n.cross=!1),0===i.src.search(/data:image\/(png|jpg|jpeg|gif);base64,/)&&(r.cross=!1);var h=t.Deferred();t.when(h).done(function(t){r.wmObj=t,e.imgurltodata(r,function(t){a.done.call(i,t),a.always.call(i,t)})}),""!==a.text&&(n.imgurl=e.textwatermark(),n.cross=!1),e.imgurltodata(n,function(t){h.resolve(t)})},textwatermark:function(){var t=this,e=t.settings,a=i.createElement("CANVAS"),n=a.getContext("2d"),r=e.textWidth,h=e.textSize+8;return a.width=r,a.height=h,n.fillStyle=e.textBg,n.fillRect(0,0,r,h),n.fillStyle=e.textColor,n.textAlign="center",n.font="500 "+e.textSize+"px Sans-serif",n.fillText(e.text,r/2,e.textSize+2),a.toDataURL()},imgurltodata:function(t,e){var a=this,n=a.settings,r=a.element,h=new Image;t.cross&&(h.crossOrigin="Anonymous"),h.onload=function(){var a,r=i.createElement("CANVAS"),h=r.getContext("2d"),s=this.width,o=this.height;if(t.wmObj&&("auto"!==t.width&&"auto"===t.height&&t.width<s?(o=o/s*t.width,s=t.width):"auto"===t.width&&"auto"!==t.height&&t.height<o?(s=s/o*t.height,o=t.height):"auto"!==t.width&&"auto"!==t.height&&t.width<s&&t.height<o&&(s=t.width,o=t.height)),"w"!==n.gravity&&"e"!==n.gravity||t.wmObj?(r.width=s,r.height=o,a=0):(r.width=o,r.height=s,a=-o,h.rotate(90*Math.PI/180)),"jpeg"===t.type&&(h.fillStyle="#ffffff",h.fillRect(0,0,s,o)),h.drawImage(this,0,a,s,o),t.wmObj){var g=n.opacity;g>0&&1>g&&(h.globalAlpha=n.opacity);var c,l,u=t.wmObj.width,w=t.wmObj.height,f=n.margin;switch(n.gravity){case"nw":c=f,l=f;break;case"n":c=s/2-u/2,l=f;break;case"ne":c=s-u-f,l=f;break;case"w":c=f,l=o/2-w/2;break;case"e":c=s-u-f,l=o/2-w/2;break;case"sw":c=f,l=o-w-f;break;case"s":c=s/2-u/2,l=o-w-f;break;default:c=s-u-f,l=o-w-f}h.drawImage(t.wmObj,c,l,u,w)}var d=r.toDataURL("image/"+t.type);if("function"==typeof e)if(t.wmObj)e(d);else{var m=new Image;m.src=d,e(m)}r=null},h.onerror=function(){return n.fail.call(this,this.src),n.always.call(r,this.src),!1},h.src=t.imgurl}}),t.fn[n]=function(e){return this.each(function(){t.data(this,"plugin_"+n)||t.data(this,"plugin_"+n,new a(this,e))})}}(jQuery,window,document);