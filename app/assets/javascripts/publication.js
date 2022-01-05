$(document).ready(function() {
    let main = $('#main');
    let two = $('#two');
    let three = $('#three');
    let four = $('#four');

    two.click(function() {
        main.attr("src", this.src);
    })

    three.click(function() {
        main.attr("src", this.src);
    })

    four.click(function() {
        main.attr("src", this.src);
    })

    $('.counter1').hide();
    $('.counter1').delay(1000).fadeIn();
    $('.goal1').hide();
    $('.goal1').delay(1000).fadeIn();

    $("select").change(function() {
        let opt = $(this).val();
        if (opt == 1) {
            $(".box").not(".pts1").hide();
            $(".pts1").show();
            $("hr").hide();
        } else if (opt == 2) {
            $(".box").not(".pts2").hide();
            $(".pts2").show();
            $("hr").hide();
        } else if (opt == 3) {
            $(".box").not(".pts3").hide();
            $(".pts3").show();
            $("hr").hide();
        } else if (opt == 4){
            $(".box").not(".pts4").hide();
            $(".pts4").show();
            $("hr").hide();
        }else {
            $('.box').show();
            $("hr").show();
        }
    });


});