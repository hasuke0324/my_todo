$(function(){
  $('.task_delete_btn').on('click', function(){
    $('<div class = "task">').remove();
  });
});