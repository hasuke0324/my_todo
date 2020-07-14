// $(function (){
//   var InlineEdit;
//   var values = {id: "", content: "",}

//   $('.task_content').on('click', function (e) {
//     e.preventDefault();
//     if(!$(this).hasClass('on')){
//       $(this).addClass('on');
//       var content = $(this).text();
//       $(this).html(`<input type="text" value=${content}>`);
//       $('.task_content > input').focus().blur(function(){
//         var url = location.href + "tasks/" + task.id;
//         var inputVal = $(this).val();
//         $.ajax({
//           url: url,
//           type: 'POST',
//           data: { 'id': task.id,'content': inputVal, '_method': 'PATCH'},
//           dataType: 'json',
//           processData: false,
//           contentType: false
//         })
//         if(inputVal===''){
//           inputVal = this.defaultValue;
//       };
//         $(this).parent().removeClass('on').text(inputVal);
//       });
//     }
//   });
// });