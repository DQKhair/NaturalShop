var KichThuoc = document.querySelector(".slide-container").clientWidth;
var ChuyenSlide =document.getElementsByClassName("chuyen-slide")[0];
var Img = ChuyenSlide.getElementsByTagName('img');
var Max = KichThuoc * Img.length;
Max -= KichThuoc;

var Chuyen = 0;
function Next() {
    if(Chuyen < Max) Chuyen += KichThuoc;
    else Chuyen = 0;
    ChuyenSlide.style.marginLeft = '-' + Chuyen + 'px';
}

function Back() {
    if(Chuyen == 0) Chuyen = Max;
    else Chuyen -= KichThuoc;
    ChuyenSlide.style.marginLeft = '-' + Chuyen + 'px';
}

setInterval(function() {
    Next();
},4000);

var width_img_length=ChuyenSlide.getElementsByTagName('img').length
for(let i =0; i<width_img_length;i++){
    var width_img=ChuyenSlide.getElementsByTagName('img')[i].style.width=KichThuoc+'px'
}
