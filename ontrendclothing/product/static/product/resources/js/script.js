
$(document).ready(function(){
  $("#dropdown-arrow").click(function(){
    if($('#dropdown-content').css('display') == 'none') {
      $("#dropdown-content").css("display","block")
    }
    else {
      $("#dropdown-content").css("display","none")
    }
  })
});


$(window).on('load',function(){
    $('#modal').modal('show');
});


$(document).ready(function(){
  $("#main-content").click(function(){
    $("#dropdown-content").css("display","none")
  })
});


$("#search-icn").click(function(){
  $('#modal-search').modal('show');
});

$(document).ready(()=>{
  $("#search").keyup(()=>{
    $.ajax({
      data:{search:$("#search").val()},
      url:'/search',
      method:'GET',
      success: function(data) {
        console.log(data)

        $("tr").not("tr:first").remove();
        if (search != "" ) {
          $(".pagination").remove();
        } else {
          window.location.replace("/showproduct");
        }
        for(data of data) {
          console.log(data.price)
          console.log(data.title)
          console.log(data.type)
          console.log(data.SKU)
          console.log(data.type)

          var html = "";
          html+="<tr>";
            html+=  "<th scope='row'><a href ='/editproduct/ " + data.SKU + "' ><img class='rounded product-thumbnail' src='static/media/"  + data.featureImg + "' alt='Featured Image'>" + data.title + "</a></th>";
            html+="<td>" + data.price + "</td>";
            html+="<td>" + (data.xs+data.sm+data.md+data.lg+data.xl+data.xxl+data.xxl) + "</td>";
            html+="<td>" + data.type_id + "</td>";
            html+="<td>" + data.vendor_id + "</td>";
          html+="</tr>"

          $("table").append(html);
        }
      }, error: function(error) {
        console.log(error)
      }, complete: function() {
        console.log("complete")
      }
    })
  })
});
