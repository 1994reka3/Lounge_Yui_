// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require_tree .

// コメントするボタン押したらフォームが表示される
$(document).on('turbolinks:load', function () {
  $(function () {
    $('#comment-btn').on('click', () => {
      $('#new-comment').toggle('slow');
    });
  });
});
// 管理者側投稿一覧の行全体クリックしたらshowへ飛ぶ
$(document).on('turbolinks:load', function () {
  $(".post-clickable").click(function() {
    location.href = $(this).data("link");
  });
});
// 管理者側講座一覧の行全体クリックしたらshowへ飛ぶ
$(document).on('turbolinks:load', function () {
  $(".health-course-clickable").click(function() {
    location.href = $(this).data("link");
  });
});
// 管理者側ユーザー一覧の行全体クリックしたらshowへ飛ぶ
$(document).on('turbolinks:load', function () {
  $(".end_user-clickable").click(function() {
    location.href = $(this).data("link");
  });
});
