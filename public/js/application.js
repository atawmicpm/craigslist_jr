$(document).ready(function() {
  setInterval(function() {
    $.ajax({
      type: "get",
      url: "/posts",
    }).success(function(response){
      $('.response').children().remove();
      var results = $.parseJSON(response);
      for (var i in results) {
        $('.response').append('<li>' + '<a href="http://localhost:9393/posts/' + results[i]['post']['id'] + '/">' + results[i]['post']['title'] + '</a>')
      }
    });
  }, 2000);
});