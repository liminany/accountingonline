/*******/// COUNTDOWN /*******/
$(function () {
    var newYear = new Date();
    newYear = new Date(2013, 9 , 1);
    $('.defaultCountdown').countdown({ until: newYear, format: 'DHMS' });
});


function validateEmail(email) {
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}


 $(document).ready(function () {
            var invalidMailError = "الرجاء إدخال البريد الالكتروني بالشكل الصحيح";
            var duplicateMailError = "لقد تم تسجيل البريد الالكتروني مسبقا";
            var systemError = "هناك خطأ في النظام الرجاء المحاولة فيما بعد";
            var successMessage = "لقد تم إضافة البريد الالكتروني بنجاح";

            $(".resultText").hide();
            $(".loader").hide();

            $('form#newsletterForm').bind('submit', function (e) {
                $(".resultText").hide();
                $(".loader").show();
                var email = $('input#email').val();
                e.preventDefault();
                if (email == "") {
                    $("#div_UserMesasge").css("color", "#e22e2e");
                    $("#div_UserMesasge").html("الرجاء إدخال البريد الالكتروني الخاص بك");
                }
                else {
                    if (!validateEmail(email)) {
                        $("#div_UserMesasge").html(invalidMailError);
                    }
                    else {
                        $.ajax({
                            type: 'POST',
                            url: 'ComingSoon.ashx?email=' + email,
                            data: '',
                            success: function (theResponse) {
                                $(".resultText").fadeIn("slow");
                                $(".resultText").animate({ opacity: 1.0 }, 3000);
                                $(".resultText").fadeOut(1500);

                                if (theResponse == 1) {
                                    $("#div_UserMesasge").css("color", "#4bb748");
                                    $("#div_UserMesasge").html(successMessage);
                                }
                                if (theResponse == 2) {
                                    $("#div_UserMesasge").css("color", "#e22e2e");
                                    $("#div_UserMesasge").html(invalidMailError);
                                }
                                if (theResponse == 3) {
                                    $("#div_UserMesasge").css("color", "#e22e2e");
                                    $("#div_UserMesasge").html(duplicateMailError);
                                }
                                $(".loader").hide();
                            },
                            error: function () {
                                $("#div_UserMesasge").html(systemError);
                                $(".loader").hide();
                            }
                        });
                    }
                }
            });

        });
 