var a, b, c, d, e, f;
var controll = true;

if(controll){
    var inter = setInterval(selektuj, 100);
}

function selektuj(){
    let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    if(scrollTop < window.innerHeight){
        $('#selector li').removeClass('selected');
        $('#home').addClass('selected');
    }
    else if(scrollTop > window.innerHeight && scrollTop < 2*window.innerHeight){
        $('#selector li').removeClass('selected');
        $('#featured').addClass('selected');
    }
    else if(scrollTop > 2*window.innerHeight && scrollTop < 3*window.innerHeight){
        $('#selector li').removeClass('selected');
        $('#recent').addClass('selected');
    }
    else if(scrollTop > 3*window.innerHeight){
        $('#selector li').removeClass('selected');
        $('#contact').addClass('selected');
    }
}

function OnLoad(){
    document.getElementById('main-container').style.backgroundImage = "url('images/one.jpg')";
    a = document.getElementById("firstImage").src;
    b = document.getElementById("secondImage").src;
    c = document.getElementById("thirdImage").src;
    d = document.getElementById("fourthImage").src;
    e = document.getElementById("fifthImage").src;
    f = document.getElementById("sixthImage").src;
    document.getElementById("background-name-container1").style.display = "block";
    Draw("first");
    Slider();
}

var br = 0;

function Slider(x){
    br += 1;
    if(br == 1){
        var id = setInterval(slide, 5000);
        var slika;
        var kvadar;

        function slide(){
            var src = document.getElementById('main-container').style.backgroundImage;
            switch(src){
                case 'url("images/one.jpg")': slika = 'url("images/two.jpg")'; kvadar = "second"; 
                document.getElementById('background-name-container1').style.display = "none";
                document.getElementById('background-name-container2').style.display = "block"; 
                document.getElementById('background-name-container3').style.display = "none";
                document.getElementById('background-name-container4').style.display = "none";break;
                case 'url("images/two.jpg")': slika = 'url("images/tree.jpg")'; kvadar = "third";  
                document.getElementById('background-name-container1').style.display = "none";
                document.getElementById('background-name-container3').style.display = "block"; 
                document.getElementById('background-name-container2').style.display = "none";
                document.getElementById('background-name-container4').style.display = "none"; break;
                case 'url("images/tree.jpg")': slika = 'url("images/forth.jpg")'; kvadar = "forth";  
                document.getElementById('background-name-container1').style.display = "none";
                document.getElementById('background-name-container4').style.display = "block"; 
                document.getElementById('background-name-container2').style.display = "none";
                document.getElementById('background-name-container3').style.display = "none"; break;
                case 'url("images/forth.jpg")': slika = 'url("images/one.jpg")'; kvadar = "first"; 
                document.getElementById('background-name-container2').style.display = "none";
                document.getElementById('background-name-container1').style.display = "block"; 
                document.getElementById('background-name-container3').style.display = "none";
                document.getElementById('background-name-container4').style.display = "none"; break;
            }
            document.getElementById('main-container').style.backgroundImage = slika;
            Draw(kvadar);
        }
    }
    var id = x.id;
    var img;

    switch(id){
        case "first": img="images/one.jpg"; kvadar = "first"; break;
        case "second": img="images/two.jpg"; kvadar = "second"; break;
        case "third": img="images/tree.jpg"; kvadar = "third"; break;
        case "forth": img="images/forth.jpg"; kvadar = "forth"; break;
    }
    Draw(kvadar);
    try{
        document.getElementById('main-container').style.backgroundImage = "url(" + img + ")";
    }
    catch(error){}
}

function Draw(x){
    switch(x){
        case "first": document.getElementById("first").style.backgroundColor = "white";
        document.getElementById("second").style.backgroundColor = "transparent";
        document.getElementById("third").style.backgroundColor = "transparent";
        document.getElementById("forth").style.backgroundColor = "transparent";break;  
        
        case "second": document.getElementById("first").style.backgroundColor = "transparent";
        document.getElementById("second").style.backgroundColor = "white";
        document.getElementById("third").style.backgroundColor = "transparent";
        document.getElementById("forth").style.backgroundColor = "transparent"; 
        break; 

        case "third": document.getElementById("first").style.backgroundColor = "transparent";
        document.getElementById("second").style.backgroundColor = "transparent";
        document.getElementById("third").style.backgroundColor = "white";
        document.getElementById("forth").style.backgroundColor = "transparent"; break; 

        case "forth": document.getElementById("first").style.backgroundColor = "transparent";
        document.getElementById("second").style.backgroundColor = "transparent";
        document.getElementById("third").style.backgroundColor = "transparent";
        document.getElementById("forth").style.backgroundColor = "white"; break; 
    }

    document.getElementById("first").style.border = "2px solid white";
    document.getElementById("second").style.border = "2px solid white";
    document.getElementById("third").style.border = "2px solid white";
    document.getElementById("forth").style.border = "2px solid white";
}

var home=true, featured=true, recent=true, contact=true;
var opened = false;
var scrollLeft;

var startMouse;
var endMouse;

$(document).ready(function(){
    $('#firstImage').on('mousedown touchstart', function(x){
        console.log("start at: " + x.pageX);
        startMouse = x.pageX;
    });
    $('#firstImage').on('mouse touchend', function(x){
        console.log("end at: " + x.pageX);
        endMouse = x.pageX;
        if(endMouse < startMouse-50){
            Desno();
        }
        if(endMouse-50 > startMouse){
            Levo();
        }
    });

    $('#selector li').click(function(){
        $('#selector li').removeClass('selected');
        $(this).addClass('selected');
    });
    $('#menu-icon').click(function(){
        if(!opened){
            document.getElementById('paddiong-menu').style.display = "block";
            opened = true;
        }
        else{
            document.getElementById('paddiong-menu').style.display = "none";
            opened = false;
        }  
    });
    $('#home').click(function(){
        if(home){
            home=false; featured=true; recent=true; contact=true;
            window.scroll({
                top: 0,
                left: 0,
                behavior: 'smooth'
            });
        }
    });
    $('#featured').click(function(){
        if(featured){
            home=true; featured=false; recent=true; contact=true;
            window.scroll({
                top: 1.1*window.innerHeight,
                left: 0,
                behavior: 'smooth'
            });
        }
    });
    $('#recent').click(function(){
        if(recent){
            home=true; featured=true; recent=false; contact=true;
            window.scroll({
                top: 2.2*window.innerHeight,
                left: 0,
                behavior: 'smooth'
            });
        }
    });
    $('#more').click(function(){
        if(recent){
            home=true; featured=true; recent=false; contact=true;
            window.scroll({
                top: 1.1*window.innerHeight,
                left: 0,
                behavior: 'smooth'
            });
        }
    });
    $('.bottom-container').click(function(){
        window.scroll({
            top: 2*window.innerHeight,
            left: 0,
            behavior: 'smooth'
        });
    });
    $('#contact').click(function(){
        if(contact){
            home=true; featured=true; recent=true; contact=false;
            window.scroll({
                top: 3.5*window.innerHeight,
                left: 0,
                behavior: 'smooth'
            });
        }
    });
    $('#home-click').click(function(){
        window.scroll({
            top: 0,
            left: 0,
            behavior: 'smooth'
        });
        this.style.backgroundColor = "white";
        this.style.color = "black";
        document.getElementById("featured-click").style.backgroundColor = "transparent";
        document.getElementById("recent-click").style.backgroundColor = "transparent";
        document.getElementById("contact-click").style.backgroundColor = "transparent";
        document.getElementById("featured-click").style.color = "white";
        document.getElementById("recent-click").style.color = "white";
        document.getElementById("contact-click").style.color = "white";
    });
    $('#featured-click').click(function(){
        window.scroll({
            top: window.innerHeight,
            left: 0,
            behavior: 'smooth'
        });
        this.style.backgroundColor = "white";
        this.style.color = "black";
        document.getElementById("home-click").style.backgroundColor = "transparent";
        document.getElementById("recent-click").style.backgroundColor = "transparent";
        document.getElementById("contact-click").style.backgroundColor = "transparent";
        document.getElementById("home-click").style.color = "white";
        document.getElementById("recent-click").style.color = "white";
        document.getElementById("contact-click").style.color = "white";
    });
    $('#recent-click').click(function(){
        window.scroll({
            top: 2.65*window.innerHeight,
            left: 0,
            behavior: 'smooth'
        });
        this.style.backgroundColor = "white";
        this.style.color = "black";
        document.getElementById("featured-click").style.backgroundColor = "transparent";
        document.getElementById("home-click").style.backgroundColor = "transparent";
        document.getElementById("contact-click").style.backgroundColor = "transparent";
        document.getElementById("featured-click").style.color = "white";
        document.getElementById("home-click").style.color = "white";
        document.getElementById("contact-click").style.color = "white";
    });
    $('#contact-click').click(function(){
        window.scroll({
            top: 6.5*window.innerHeight,
            left: 0,
            behavior: 'smooth'
        });
        this.style.backgroundColor = "white";
        this.style.color = "black";
        document.getElementById("featured-click").style.backgroundColor = "transparent";
        document.getElementById("recent-click").style.backgroundColor = "transparent";
        document.getElementById("home-click").style.backgroundColor = "transparent";
        document.getElementById("featured-click").style.color = "white";
        document.getElementById("recent-click").style.color = "white";
        document.getElementById("home-click").style.color = "white";
    });
});

function slideEnd(event){
    console.log("slide end");
}

function initMap() {
    const uluru = { lat: 44.787197, lng: 20.457273 };

    const map = new google.maps.Map(document.getElementById("map-container"), {
      zoom: 4,
      center: uluru,
    });

    const marker = new google.maps.Marker({
      position: uluru,
      map: map,
    });
  }

function Next(){
    var mainSrc = document.getElementById("modal-photo").src;

    switch(mainSrc){
        case Url('album1'):
            document.getElementById("modal-photo").src = Url("album2");
            break;
        case Url('album2'):
            document.getElementById("modal-photo").src = Url("album3");
            break;
        case Url('album3'):
            document.getElementById("modal-photo").src = Url("album4");
            break;
        case Url('album4'):
            document.getElementById("modal-photo").src = Url("album5");
            break;
        case Url('album5'):
            document.getElementById("modal-photo").src = Url("album1");
            break;
    }
}

function Previous(){
    var mainSrc = document.getElementById("modal-photo").src;

    switch(mainSrc){
        case Url('album1'):
            document.getElementById("modal-photo").src = Url("album5");
            break;
        case Url('album2'):
            document.getElementById("modal-photo").src = Url("album1");
            break;
        case Url('album3'):
            document.getElementById("modal-photo").src = Url("album2");
            break;
        case Url('album4'):
            document.getElementById("modal-photo").src = Url("album3");
            break;
        case Url('album5'):
            document.getElementById("modal-photo").src = Url("album4");
            break;
    }
}


function Prikazi(x){
    document.getElementById('modal-container').style.display = "block";
    document.getElementById('modal-photo').style.display = "block";
    document.getElementById('next').style.display = "block";
    document.getElementById('previous').style.display = "block";

    switch(x){
        case "a":
            document.getElementById('modal-photo').src = Url('album1');
            break;
        case "b":
            document.getElementById('modal-photo').src = Url('album2');
            break;
        case "c":
            document.getElementById('modal-photo').src = Url('album3');
            break;
        case "d":
            document.getElementById('modal-photo').src = Url('album4');
            break;
        case "e":
            document.getElementById('modal-photo').src = Url('album5');
            break;
    }
}

function Url(x){
    var img = document.getElementById(x),
    style = img.currentStyle || window.getComputedStyle(img, false),
    bi = style.backgroundImage.slice(4, -1).replace(/"/g, "");
    return bi;
}

function Gasi(){
    document.getElementById('modal-container').style.display = "none";
    document.getElementById('modal-photo').style.display = "none";
    document.getElementById('next').style.display = "none";
    document.getElementById('previous').style.display = "none";
}

function Desno(){
    var current = document.getElementById('firstImage').src;

    switch(current){
        case a:
            document.getElementById('firstImage').src = b;
            document.getElementById('secondImage').src = c;
            document.getElementById('thirdImage').src = d;
            break;
        case b:
            document.getElementById('firstImage').src = c;
            document.getElementById('secondImage').src = d;
            document.getElementById('thirdImage').src = e;
            break;
        case c:
            document.getElementById('firstImage').src = d;
            document.getElementById('secondImage').src = e;
            document.getElementById('thirdImage').src = f;
            break;
        case d:
            document.getElementById('firstImage').src = e;
            document.getElementById('secondImage').src = f;
            document.getElementById('thirdImage').src = a;
            break;
        case e:
            document.getElementById('firstImage').src = f;
            document.getElementById('secondImage').src = a;
            document.getElementById('thirdImage').src = b;
            break;
        case f:
            document.getElementById('firstImage').src = a;
            document.getElementById('secondImage').src = b;
            document.getElementById('thirdImage').src = c;
            break;
    }
}

function Levo(){
    var current = document.getElementById('firstImage').src;

    switch(current){
        case a:
            document.getElementById('firstImage').src = f;
            document.getElementById('secondImage').src = a;
            document.getElementById('thirdImage').src = b;
            break;
        case b:
            document.getElementById('firstImage').src = a;
            document.getElementById('secondImage').src = b;
            document.getElementById('thirdImage').src = c;
            break;
        case c:
            document.getElementById('firstImage').src = b;
            document.getElementById('secondImage').src = c;
            document.getElementById('thirdImage').src = d;
            break;
        case d:
            document.getElementById('firstImage').src = c;
            document.getElementById('secondImage').src = d;
            document.getElementById('thirdImage').src = e;
            break;
        case e:
            document.getElementById('firstImage').src = d;
            document.getElementById('secondImage').src = e;
            document.getElementById('thirdImage').src = f;
            break;
        case f:
            document.getElementById('firstImage').src = e;
            document.getElementById('secondImage').src = f;
            document.getElementById('thirdImage').src = a;
            break;
    }
}
var topPos = 0;

window.addEventListener('scroll', () => {
    var scroll = window.pageYOffset || document.documentElement.scrollTop;
    if(scroll > topPos){
        topPos = scroll;
        document.getElementById('menu-container').style.top = -60 + "px";
        document.getElementById('paddiong-menu').style.top = 0 + "px";
    }
    if(scroll < topPos){
        topPos = scroll;
        document.getElementById('menu-container').style.top = 0 + "px";
        document.getElementById('paddiong-menu').style.top = 60 + "px";
    }
});