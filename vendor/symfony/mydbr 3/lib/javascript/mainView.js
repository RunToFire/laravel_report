$(document).ready(function(){$(".app_info").click(function(){var url,dialog;url="index.php?a=about&hdr=0";dialog=$("#dialog");if($("#dialog").length==0){dialog=$('<div id="dialog" style="display:hidden"></div>').appendTo("body")}dialog.load(url,{},function(responseText,textStatus,XMLHttpRequest){dialog.dialog({resizable:false,width:"auto",modal:true})});return false});var drag_z=3;$(".draggable").draggable({revert:true,revertDuration:200,start:function(event,ui){$(this).css("z-index",drag_z++)}});$(".group:not(.favgroup) h1").droppable({classes:{"ui-droppable-hover":"drop_highlight_group"},tolerance:"pointer",drop:function(event,ui){if(ui.draggable.closest(".group").data("id")==$(this).parent().data("id")){return false}ui.draggable.css({left:0,top:0});var $cat=$(this).parent();$.ajax({url:"apps_v/category_change_v.php",type:"post",data:{move:ui.draggable.data("id"),type:ui.draggable.hasClass("report")?"report":"folder",category:$cat.data("id"),csrf_token:csrf_token_get()},success:function(data){if(data=="OK"){var m=ui.draggable.detach();$cat.find("ul").prepend(m);m.effect("highlight",{color:"#5FC41B"},100)}else{alert(data)}}})}});$(".droppable").droppable({classes:{"ui-droppable-hover":"drop_highlight"},tolerance:"pointer",drop:function(event,ui){$.ajax({url:"apps_v/move_v.php",type:"post",data:{move:ui.draggable.data("id"),type:ui.draggable.hasClass("report")?"report":"folder",to:$(this).data("id"),csrf_token:csrf_token_get()},success:function(data){if(data!="OK"){alert(data)}else{ui.draggable.remove()}}})}});$(".reports h1.toggle").click(function(evt){if(evt.altKey){var disp=$(this).parent().find(".ringrp").css("display");if(disp=="none"){$(".reports").find(".ringrp").slideDown(200,function(){$(this).parent().find("h1").removeClass("closed_rgrp")})}else{$(".reports").parent().find(".ringrp").slideUp(200,function(){$(this).parent().find("h1").addClass("closed_rgrp")})}}else{$(this).parent().find(".ringrp").slideToggle(200,function(){$(this).parent().find("h1").toggleClass("closed_rgrp")})}return false});if($(".mobileadmin").length){$("#admintools").hide();$("#admintoggle").click(function(){$("#admintools").slideToggle(400);return false})}if($(".notiftoggle").length){$("#notif_side").hide();$(".notiftoggle").click(function(){$("#notif_side").slideToggle(400);return false})}$(".make_fav").each(function(){$(this).click(function(){var r_obj=$(this),rid=r_obj.children().first().text();if(rid==""){return}$.ajax({url:"apps_v/favourite_v.php",type:"post",data:{favid:"",url:r_obj.parent().children().first().attr("href"),reportid:rid,curr_url:"",csrf_token:csrf_token_get()},success:function(set){if(set!=""){var ret,is_fav;ret=eval("("+set+")");is_fav=ret.isset=="set";$('.report[data-id="'+rid+'"]').find(".make_fav").toggleClass("no_fav",!is_fav);$('.report[data-id="'+rid+'"]').find(".make_fav").toggleClass("is_fav",is_fav);$("#favmenu").html(ret.menu);hovermenu_init("",1)}}})})});if($(".sidebar>.admin").length==0){$(".app_info").attr("style","display: inline !important");$(".nsl").attr("style","display: inline !important")}var $r,report_id=gup(window.location.href,"highlight");if(report_id){$r=$(".report[data-id='"+report_id+"']");if(!$r.visible(true)){$.scrollTo($r,800,{easing:"easeInOutCubic"})}for(var i=0;i<3;i++){$(".report[data-id='"+report_id+"']").effect("highlight",{color:"#5FC41B"},500)}}});function ShowReport(href){window.location.href=href}function DeleteFolder(folderID,name){if(confirm(sprintf(mydbr_loc["MYDBR_AMAIN_REM_FOLDER"],unescapeHTML(name)))){$.ajax({url:"apps_v/deleteFolder_v.php",type:"post",data:{folderID:folderID,csrf_token:csrf_token_get()},success:function(data){if(data!=""){alert(data)}else{window.location.reload()}}})}}function DeleteReport(reportID,name){if(confirm(sprintf(mydbr_loc["MYDBR_AMAIN_REM_REPORT"],unescapeHTML(name)))){$.ajax({url:"apps_v/deleteReport.php",type:"post",data:{reportID:reportID,csrf_token:csrf_token_get()},success:function(data){if(data!=""){alert(data)}else{window.location.reload()}}})}}function unescapeHTML(html){var htmlNode=document.createElement("DIV");htmlNode.innerHTML=html;if(htmlNode.innerText)return htmlNode.innerText;return htmlNode.textContent}function MoveIt(move,type,to){$.ajax({url:"apps_v/move_v.php",type:"post",data:{move:move,type:type,to:to,csrf_token:csrf_token_get()},success:function(data){if(data!="OK"){alert(data)}else{window.location.href="index.php?m="+to}}})}function embed_url(url,async){if(typeof async=="undefined"){async=true}$.ajax({url:url,type:"get",async:async,success:function(data){$("#topbanner").html("<br>"+data);init_report_elements("#topbanner")}})}function embed_url2(url,async){if(typeof async=="undefined"){async=true}$.ajax({url:"apps/get_url.php",type:"post",async:async,data:{url:url},success:function(data){$("#topbanner").html("<br>"+data);init_report_elements("#topbanner")}})}