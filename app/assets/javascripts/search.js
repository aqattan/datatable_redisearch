$(document).on('turbolinks:load', function(){
  $('#search').autocomplete({
    source: function(request, response){
      $.get('/search?q='+request.term, function(data){
        response(data)
      })
    }
  })
});
