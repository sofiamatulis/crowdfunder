$(function() {

  console.log( 'INSIDE ALT DOC READY' ); /// TEMP

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
        $('<tr>').appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['name']).appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['date']).appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['goal']).appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['user_id']).appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['category_id']).appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data[i]['description']).appendTo('.categories-table')
        $('<a>').attr('class', 'show-btn').attr('href', '/projects/' + (data[i]['id'] +1) ).html('Read More').appendTo('.categories-table')
        $('<br>').appendTo('.categories-table')
      };
    }).fail(function(){
      console.log('this didnt work');
    });
      $('.all-categories').on('click', function(event){
      $('.categories-table').html("")
      $('.all-projects-table-body').attr('style',"display")
    });

  });
  // Calculation for progressbar
 // console.log('hi');
  // $('.progressbar').ready(function(){

    var funded = parseInt($('#funded').text());
    var goal   = parseInt($('#goal').text());
    var final  = Math.floor((( funded / goal) * 100));

    console.log(final);

    var check  = function(){
      if (funded >= goal) {
        return "100%"
      } else if(funded === 0){
        $('.progress-bar').css('color', 'black');
        return "0"
      } else {
        return ' " '+ final + '%" '
      }
    }
    // console.log(check());
    // $('.progressbar').attr('aria-valuenow', '"'+final+'"');
    $('.progress-bar').attr('test', check());
    $('.progress-bar').css('width', check());
    $('.progress-bar').text(check());


  // })
});
