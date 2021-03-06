// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import $ from 'jquery'
import Rails from 'rails-ujs'
Rails.start()
require("jquery")
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

$(document).ready(function() {
    console.log("called")
    //password-field 
    $("").change(
        function(event) {
            if(this.value.length > 6){
               //do nothing
            }else{
               //error!

            }
        }
    )

    





    //E-mail field 
    $("#patient_email").change(function(event){
        let regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
        if(regex.test(this.value)){
            console.log("correct")
        $('#form-id-email').html("");    
        Rails.ajax({
            url: "check_validation_email", 
            type: "post",
            data: "email="+this.value.toString(),
            success(data) {
                console.log(data)
                if(data.alert == 200) {
                    $('#form-id-email').html("");
                }else{
                    $('#form-id-email').html(data.message);
                    $("#form-id-email").css({
                        "color": "red",
                    })
                }
                   
            },
            error(data) {
                console.log("called");
                return false;
            }    
        })}else{
            $('#form-id-email').html("The email format is not correct!");
            $("#form-id-email").css({
                "color": "red",
            })
        }
    })
})






// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
