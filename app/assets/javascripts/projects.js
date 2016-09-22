$(function() {

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
    }).fail(function(){
      console.log('this didnt work')
    });
    $('.all-categories').on('click', function(event){
      $('.categories-table').html("")
      $('.all-projects-table-body').attr('style',"display")
    });
  });

});
