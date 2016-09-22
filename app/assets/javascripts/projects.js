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


  // this ajax request will get the information from categories json file
  $('.category').on('click', function(event){
    var categoryId = $(this).attr("value")
    $('.all-projects-table-body').attr('style',"display:none")
    $('.categories-table').html("")
    $.ajax({
      url: '/categories/' + categoryId,
      method: 'GET',
      data: {},
      dataType: 'json'
    }).done(function(data){

      for(i = 0, l = data.length; i < l; i++){
        console.log(data[i][''])
        $('<tr>').appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['name']).appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['date']).appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['goal']).appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['user_id']).appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['category_id']).appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['description']).appendTo('.categories-table')
        $('<br>').appendTo('.categories-table')
      };


    })
  });

});
