$(document).ready(function() {
  $('.pledge-btn').on('click', function(button){
    button.preventDefault();
  var id = $(this).attr("id");
  $.ajax({
    url: id+'/pledges/new',
    method: 'GET',
    data: {},
    dataType: 'html'
  }).done(function(responseData){
    $('#pledge-form').append(responseData);
    $('.pledge-btn').remove();
  })
});



})
