function validateField(){
    var textFields = document.getElementsByTagName("input");
        for(var i=0; i < textFields.length; i++){
        if(textFields[i].type == "text" && textFields[i].value == "")
        {
            textFields[i].style.backgroundColor = "#90EE90";
        }
        else if (textFields[i].type == "number" && textFields[i].value == "" || textFields[i].value >= 200)
        {
        	textFields[i].style.backgroundColor = "	#90EE90";
        }
        else {
            textFields[i].style.backgroundColor = "white";
        }
    }
}

$("tr[data-link]").click(function() {
  window.location = $(this).data("link")
})

