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
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require popper
//= require_tree .

$(document).on('turbolinks:load', function () {
  // コメントするボタン押したらフォームが表示される
  $('#comment-btn').on('click', () => {
    $('#new-comment').toggle('slow');
  });
  // 管理者側講座一覧の行全体クリックしたらshowへ飛ぶ
  $(".health-course-clickable").click(function() {
    location.href = $(this).data("link");
  });
  // 管理者側ユーザー一覧の行全体クリックしたらshowへ飛ぶ
  $(".end_user-clickable").click(function() {
    location.href = $(this).data("link");
  });
  //画像プレビュー
  $('#end_user_image').on('change', function(e) {
    let render = new FileReader();
    render.onload = function(e) {
      $("#profile_image").attr('src', e.target.result)
    }
    render.readAsDataURL(e.target.files[0]);
  });
});