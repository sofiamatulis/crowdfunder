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
      console.log(data);
      for(i = 0, l = data.projects.length; i < l; i++){
        $('<tr id="table'+i+'"">').appendTo('.categories-table')
        $('<td>').attr('class', 'name').html(data.projects[i]['name']).appendTo('#table'+i)
        $('<td>').attr('class', 'name').html(data.projects[i]['date']).appendTo('#table'+i)
        $('<td>').attr('class', 'name').html(data.projects[i]['goal']).appendTo('#table'+i)
        $('<td>').attr('class', 'name').html(data.users[data.projects[i].user_id - 1]['name']).appendTo('#table'+i)
        $('<td>').attr('class', 'name').html(data.category['name']).appendTo('#table'+i)
        $('<td>').attr('class', 'name').html(data.projects[i]['description']).appendTo('#table'+i)
        $('<td>').attr('class', 'name').append($('<a>').attr('class', 'show-btn').attr('href', '/projects/' + (data.projects[i]['id'] ) ).html('Read More'))
                                      .appendTo('#table'+i)
        // $('<br>').appendTo('#table'+i)
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
