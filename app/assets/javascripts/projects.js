$(document).ready(function() {
  $('#pledge-btn').on('click', function(button){
    button.preventDefault();
    var id = $(this).attr("id");
    $.ajax({
      url: 'projects/'+id+'/pledges/new',
      method: 'GET',
      data: {},
      dataType: 'html'
    }).done(function(responseData){

    })
  });



})
