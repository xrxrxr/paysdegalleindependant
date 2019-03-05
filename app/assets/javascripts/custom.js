console.log('custom.js')

function indexProducts() {
$(document).ready(function() {
    console.log('script indexProduct');
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
        x += 3;
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
  lens.addEventListener("mousemove", moveLens);
  img.addEventListener("mousemove", moveLens);
  /* And also for touch screens: */
  lens.addEventListener("touchmove", moveLens);
  img.addEventListener("touchmove", moveLens);
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