
function formValidation()
{ 
    var uid = document.registration.userid;
    var uvin = document.registration.vin;
    var uname = document.registration.username;
    var uadd = document.registration.address;
    var ucountry = document.registration.country;
    var uzip = document.registration.zip;
    var uemail = document.registration.email;
    var ucity = document.registration.city;


 
    if(allLetter(uname))  
     {  
      if (vin_validation(uvin)) {

          if (ValidateEmail(uemail)) {

          if (alphanumeric(uadd))
          {   
              if (validCity(ucity)) {


                if(countryselect(ucountry))  
                {  
                    if(allnumeric(uzip,uname))  
                    {  
                         
                           
                            }  
                        }   
                    }  
                }   
            }  
        }  
    }  
  
return false;  
  
} function userid_validation(uid,mx,my)  
{  
    var uid_len = uid.value.length;  
    if (uid_len == 0 || uid_len >= my || uid_len < mx)  
    {  
        alert("User Id should not be empty / length be between "+mx+" to "+my);  
        uid.focus();  
        return false;  
    }  
    return true;  
}  
function vin_validation(uvin)  
{  
    var vin_len = uvin.value.length;  
    if (vin_len == 0 )  
    {  
        alert("VIN should not be empty ");  
        uvin.focus();  
        return false;  
    }  
    return true;  
}  
function allLetter(uname)  
{
    var un_len = uname.value.length;
    var letters = /^[A-Za-z]+$/;  
    if(un_len > 0 && uname.value.match(letters) )  
    {  
        return true;  
    }  
    else  
    {  
        alert('Username must have alphabet characters only');  
        uname.focus();  
        return false;  
    }  
}  
function alphanumeric(uadd)  
{
    var add_len = uadd.value.length;
    var letters = /^[\s\-\,0-9a-zA-Z]+$/;  
    if(add_len >0 && uadd.value.match(letters))  
    {  
        return true;  
    }  
    else  
    {  
        alert('User address must not be empty and should have alphanumeric characters only');  
        uadd.focus();  
        return false;  
    }  
}

function validCity(ucity) {

    var city_len = ucity.value.length;
    var letters = /^[a-zA-Z]+$/;
    if (city_len >0 &&  ucity.value.match(letters)) {
        return true;
    }
    else {
        alert('City must not be empty and must be characters only');
        ucity.focus();
        return false;
    }
}
function countryselect(ucountry)  
{  
    if(ucountry.value == "Default")  
    {  
        alert('Select your country from the list');  
        ucountry.focus();  
        return false;  
    }  
    else  
    {  
        return true;  
    }  
}  
function allnumeric(uzip,uname)  
{
    //var zip_len = uzip.value.length;
    var numbers = /^[0-9]+$/;  
    if ( uzip.value.match(numbers))
    {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                alert('Form Succesfully Submitted');
            }
        };
        xhttp.open("POST", "page2.aspx/AddVendor", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("username=Reginald");
       // window.location.reload();
        //var $form = $("<form/>").attr("id", "registration")
        //                    .attr("action", "Page2.aspx")
        //                    .attr("method", "post");
        //$("body").append($form);

        ////Append the values to be send
        //AddParameter($form, "name", uname);
        //AddParameter($form, "technology", uzip);

        ////Send the Form
        //$form[0].submit();


        ////window.location.href = "page2.aspx";
        //Window.Open("page2.aspx");
        //var myObj = { "name": "John"};
        //$.ajax({
        //    type: "POST",
        //    url: "/page2.aspx",
        //    data: JSON.stringify(myObj),
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (msg) {

        //        //window.open("page2.aspx");
        //        window.location("page2.aspx");
        //    }
        //});
        


        //var myObj = { "name": "John", "age": 31, "city": "New York" };
        //var myJSON = JSON.stringify(myObj);
        //window.location("page2.aspx");
        //return true;  
    }  
    else  
    {  
        alert('ZIP code must not be empty and should have numeric characters only');  
        uzip.focus();  
        return false;  
    }  
}  
function ValidateEmail(uemail)  
{  
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
    if(uemail.value.match(mailformat))  
    {

        
        return true;
    }  
    else  
    {  
        alert("You have entered an invalid email address!");  
        uemail.focus();  
        return false;  
    }  
}

function AddParameter(form, name, value) {
    var $input = $("<input />").attr("type", "hidden")
    .attr("name", name)
    .attr("value", value);
    form.append($input);
}