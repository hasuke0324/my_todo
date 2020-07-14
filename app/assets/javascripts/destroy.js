$(function(){
  $('task_delete_btn').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('action');

    $.ajax({
      url: "/tasks/" + TaskID,
      type: "POST",
      data: {"id":TaskID,"_method": "DELETE"}
    })
  });
});
