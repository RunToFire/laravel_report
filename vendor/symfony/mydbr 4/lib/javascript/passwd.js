$(document).ready(function(){$(".entryform tbody tr:first-child td").addClass("pad_top_10");$(".entryform tbody tr:last-child td").addClass("pad_bot_10");$(".entryform tbody tr td:first-child").addClass("left");$(".entryform tbody tr td:last-child").addClass("ieright");$(".prefs").each(function(s){$(this).click(prefs)});$(".cancel").each(function(s){$(this).click(PwCancel)});$(".def").each(function(s){$(this).click(prefs_def)});$(".use_login").each(function(){});$("input[name='search_user']").keyup(user_find);$(".reset_impersonate").click(function(){$.ajax({url:"apps_v/impersonate.php",type:"post",data:{reset:1,csrf_token:csrf_token_get()},success:function(data){window.location.reload()}})});$(document).on("click",".use_login a",function(){var td=$(this).closest(".use_login");$.ajax({url:"apps_v/impersonate.php",type:"post",data:{user:td.attr("data-user"),fullname:td.attr("data-fullname"),auth:td.attr("data-auth"),sec:td.attr("data-sec"),csrf_token:csrf_token_get()},success:function(data){window.location.reload()}})})});function PwChange(set_valid){if(document.forms["myform"].p1.value!=document.forms["myform"].p2.value){alert(mydbr_loc["MYDBR_APASSWORD_NOMATCH"]);return false}if(!Pw_RulesCheck(document.forms["myform"].p1.value,$("#pwm").val(),$("#pwl").val(),$("#pwn").val(),$("#pws").val())){return false}if(document.forms["myform"].p1.value==""){alert("Password missing!");return false}if($("#salted_hash").val()=="1"){document.forms["myform"].p.value=document.forms["myform"].p1.value}else{document.forms["myform"].p.value=hex_md5(unescape(encodeURIComponent(document.forms["myform"].p1.value)))}document.forms["myform"].p1.value="";document.forms["myform"].p2.value="";if(set_valid){document.forms["myform"].validationRoutine.value="passwd_v"}return true}function prefs(){document.forms["myform"].validationRoutine.value="prefs_v"}function prefs_def(){if(confirm("Reset to defaults?")){document.forms["myform"].pref_def.value="1";document.forms["myform"].validationRoutine.value="prefs_v";document.forms["myform"].submit()}}function PwCancel(){document.forms["myform"].submit();return true}function PWShowRule(){if(document.getElementById("pwrule").style.display=="")document.getElementById("pwrule").style.display="none";else document.getElementById("pwrule").style.display=""}function user_find(){$.ajax({url:"apps_v/imp_user_find.php",type:"post",data:{search:$(this).val()},success:function(data){$("#impersonate_users").html(data)}});return false}