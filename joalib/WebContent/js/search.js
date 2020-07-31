$(function() {
    $('.book_hover .book_add').hide();
    $('.book_hover').hover(function() {
      $(this).children('img').css("opacity","0.2")
      $(this).children('.book_add').show();
    },function(){
      $(this).children('img').css("opacity","1")
      $(this).children('.book_add').hide();
    })
  })




// $(function() {
//   $('.book_add').hide();
//   $('.book img').on("mouseenter",function() {
//     $(this).css("opacity","0.2")
//     $('.book_add').show();
//   });
//   $('.book img').on("mouseleave",function() {
//     $(this).css("opacity","1")
//     $('.book_add').hide();
//   });
// });

