// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require highcharts/highcharts                                                           
//= require highcharts/highcharts-more                                                         
//= require highcharts/highstock
//= require_tree .

$(function() {
  $("#devices th a, #devices .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#devices_search input").keyup(function() {
    $.get($("#devices_search").attr("action"), $("#devices_search").serialize(), null, "script");
    return false;
  });
});

$(function() {
  $("#idevices th a, #idevices .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#idevices_search input").keyup(function() {
    $.get($("#idevices_search").attr("action"), $("#idevices_search").serialize(), null, "script");
    return false;
  });
});