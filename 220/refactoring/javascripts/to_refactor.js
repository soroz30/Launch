$(function() {
  $("nav a").on("mouseenter", function() {
    $(this).next("ul").addClass('visible');
  });

  $("nav").on("mouseleave", function() {
    $(this).find("ul ul").removeClass('visible');
  });

  $(".button, button").on("click", function(e) {
    e.preventDefault();

    $(this).addClass("clicked");
  });

  $(".toggle").on("click", function(e) {
    e.preventDefault();

    $(this).next(".accordion").toggleClass('opened');
  });

  $("form").on("submit", function(e) {
    e.preventDefault();
    var cc_number = $(this).find("[type=text]").val(),
        odd_total = 0,
        even_total = 0;

    cc_number = cc_number.split("").reverse();
    cc_number.forEach(function(value, index) {
      if (index % 2 == 0) {
        even_total += value;
      } else {
        odd_total += value;
      }
    })

    if ((odd_total + even_total) % 10 == 0) {
      $(this).find(".success").show();
      $(this).find(".error").hide();
    }
    else {
      $(this).find(".error").show();
      $(this).find(".success").hide();
    }
  });

  $("ul a").on("click", function(e) {
    e.preventDefault();

    var month = $(this).text(),
        $stone = $("#birthstone");

    switch (month) {
      case "January":
        $stone.text("Your birthstone is garnet");
        break;
      case "February":
        $stone.text("Your birthstone is amethyst");
        break;
      case "March":
        $stone.text("Your birthstone is aquamarine or bloodstone");
        break;
      case "April":
        $stone.text("Your birthstone is diamond");
        break;
      case "May":
        $stone.text("Your birthstone is emerald");
        break;
      case "June":
        $stone.text("Your birthstone is pearl, moonstone, or alexandrite");
        break;
      case "July":
        $stone.text("Your birthstone is ruby");
        break;
      case "August":
        $stone.text("Your birthstone is peridot");
        break;
      case "September":
        $stone.text("Your birthstone is sapphire");
        break;
      case "October":
        $stone.text("Your birthstone is opal or tourmaline");
        break;
      case "November":
        $stone.text("Your birthstone is topaz or citrine");
        break;
      case "December":
        $stone.text("Your birthstone is turquoise, zircon, or tanzanite");
        break;
    }
  });
});
