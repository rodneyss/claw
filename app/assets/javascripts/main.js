var glowOn;

$(document).ready(function() {

    claw();

    var pollCoin = {};

    pollCoin.checkCoin = function() {
        setTimeout(pollCoin.pollServer, 300000);
    };

    pollCoin.pollServer = function() {

        $.ajax({
            url: '/users/1.json',
            method: 'GET'

        }).done(function(data) {
            pollCoin.updateCoin(data.coins);
            pollCoin.checkCoin();
        });

    }

    pollCoin.updateCoin = function(newCoin) {
        var pluralcoin;
        var winLoss = "You just won ";
        var oldCoin = parseInt($('#coinForUser').html().split(' ')[0]);

        var whatWord = function(coin){
            if (coin === 1) {
                pluralcoin = 'coin'
            } else {
                pluralcoin = 'coins'
            }
        }

            if( newCoin > oldCoin){
                whatWord(newCoin - oldCoin)
                winLoss = 'You just won ' + (newCoin - oldCoin) + " " + pluralcoin + '!!!!!'
                glowButton();

                $('.tlt').textillate({ in : {
                    effect: 'bounce',
                    sync: true
                }})

            }else{
                winLoss = "Play games to earn coins "  
            }

            whatWord(newCoin);


            $('#coinDisplay').html('<h5 id="coinForUser" class="tlt">' + newCoin + ' ' + pluralcoin + '</h5>')

            UpdateMarq(winLoss, "springgreen", "alternate")
              
    }

    var clawHere = $('#moveClawGrab');

    if (clawHere.length) {
        if (parseInt($('#coinForUser').html().split(' ')[0])) {
            glowButton()
        };

        pollCoin.checkCoin();
    }

});

var stopClaw = function() {
    clearInterval(clawTrace)
    clawReturn = TweenMax.to('#theClaw', 4, {
        left: '45%',
        top: '20px'
    })
    clearInterval(drawLine)

}

var followClaw = function() {
    var $mouseX = 0,
        $mouseY = 0;
    var $xp = 0,
        $yp = 0;

    $(document).mousemove(function(e) {
        $mouseX = e.pageX - 50;
        $mouseY = e.pageY - 140;
    });

    clawTrace = setInterval(function() {
        // change 12 to alter damping higher is slower
        drawLine()
        $xp += (($mouseX - $xp) / 30);
        $yp += (($mouseY - $yp) / 30);
        $("#theClaw").css({
            left: $xp + 'px',
            top: $yp + 'px'
        });
    }, 30);
}
