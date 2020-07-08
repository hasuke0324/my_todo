$(function(){
  function buildHTML(task){
    var html = `<li class = "task">
    <div class = "task_delete_btn">
      <a data-remote="true" rel="nofollow" data-method="delete" href="/tasks/${task.id}">○</a>
    </div>
    <div class = "task_content">
      <a href =/tasks/${task.id}>${task.content}</a>
    </div>
    <div class = "task_deadline">
      期限:
    </div>
    <div class = "task_priority">
      ${task.priority}
    </div>
  </li>`
    return html;
  }
  $('.task_form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.task_list').append(html);
      $('.add_task_box').val('');
    })
    .fail(function() {
      alert('error');
    })
  });
});