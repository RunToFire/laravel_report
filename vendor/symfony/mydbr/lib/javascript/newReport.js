$(document).ready(function(){$(".entryform tbody tr:first td").addClass("pad_top_10");$(".entryform tr:last td").addClass("pad_bot_10");if($("#rname").length==0){check_proc();$("#procname").bind("keyup",function(){check_proc()})}$(document).on("click",".rep_from_pname",function(){$("#rname").val($('select[name="storedprocedure"]').val().replace(/(sp_DBR)_?/,"").replace(/_/g," ").replace(/\w\S*/g,function(txt){return txt.charAt(0).toUpperCase()+txt.substr(1).toLowerCase()}))})});function check_proc(){$.ajax({url:"apps/proccheck.php",type:"get",data:{proc:$("#procname").val()},success:function(data){$("#proccheck").html(data)}})}function AddNewReport(){if(document.forms["myform"].rname.value!=""&&document.forms["myform"].storedprocedure.value!=""){document.forms["myform"].validationRoutine.value="newReport_v";return true}else{alert("Please enter the report name");return false}}function createnew(m,prefix){var proc;proc=$("#procname").val();if(proc){window.location.href="index.php?a=editor&m="+m+"&proc="+encodeURIComponent(proc)}else{alert("Please enter the procedure name")}}function show_existing(m){window.location.href="index.php?a=editor&m="+m+"&proc="+encodeURIComponent($('select[name="storedprocedure"]').val())}