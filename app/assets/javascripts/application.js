// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/extras/dataTables.tableTools
//= require dataTables/extras/dataTables.colVis
//= require bootstrap-sprockets
//= require select2
//= require turbolinks
//= require_tree .


window.setTimeout(function() { $(".alert.flash").alert('close'); }, 6000);

$(document).click(function() {
  $(".alert.flash").alert('close');
});

// $(function() {
//   var $divForms, $formLogin, $formLost, $formRegister, $modalAnimateTime, $msgAnimateTime, $msgShowTime, modalAnimate, msgChange, msgFade;
//   $formLogin = $('#login-form');
//   $formLost = $('#lost-form');
//   $formRegister = $('#register-form');
//   $divForms = $('#div-forms');
//   $modalAnimateTime = 300;
//   $msgAnimateTime = 150;
//   $msgShowTime = 2000;
//   modalAnimate = function($oldForm, $newForm) {
//     var $newH, $oldH;
//     $oldH = $oldForm.height();
//     $newH = $newForm.height();
//     $divForms.css('height', $oldH);
//     $oldForm.fadeToggle($modalAnimateTime, function() {
//       $divForms.animate({
//         height: $newH
//       }, $modalAnimateTime, function() {
//         $newForm.fadeToggle($modalAnimateTime);
//       });
//     });
//   };
//   msgFade = function($msgId, $msgText) {
//     $msgId.fadeOut($msgAnimateTime, function() {
//       $(this).text($msgText).fadeIn($msgAnimateTime);
//     });
//   };
//   msgChange = function($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
//     var $msgOld;
//     $msgOld = $divTag.text();
//     msgFade($textTag, $msgText);
//     $divTag.addClass($divClass);
//     $iconTag.removeClass('glyphicon-chevron-right');
//     $iconTag.addClass($iconClass + ' ' + $divClass);
//     setTimeout((function() {
//       msgFade($textTag, $msgOld);
//       $divTag.removeClass($divClass);
//       $iconTag.addClass('glyphicon-chevron-right');
//       $iconTag.removeClass($iconClass + ' ' + $divClass);
//     }), $msgShowTime);
//   };
//   $('form').submit(function() {
//     var $lg_password, $lg_username, $ls_email, $rg_email, $rg_password, $rg_username;
//     switch (this.id) {
//       case 'login-form':
//         $lg_username = $('#login_username').val();
//         $lg_password = $('#login_password').val();
//         if ($lg_username === 'ERROR') {
//           msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), 'error', 'glyphicon-remove', 'Login error');
//         } else {
//           msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), 'success', 'glyphicon-ok', 'Login OK');
//         }
//         return false;
//       case 'lost-form':
//         $ls_email = $('#lost_email').val();
//         if ($ls_email === 'ERROR') {
//           msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), 'error', 'glyphicon-remove', 'Send error');
//         } else {
//           msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), 'success', 'glyphicon-ok', 'Send OK');
//         }
//         return false;
//       case 'register-form':
//         $rg_username = $('#register_username').val();
//         $rg_email = $('#register_email').val();
//         $rg_password = $('#register_password').val();
//         if ($rg_username === 'ERROR') {
//           msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), 'error', 'glyphicon-remove', 'Register error');
//         } else {
//           msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), 'success', 'glyphicon-ok', 'Register OK');
//         }
//         return false;
//       default:
//         return false;
//     }
//     return false;
//   });
//   $('#login_register_btn').click(function() {
//     modalAnimate($formLogin, $formRegister);
//   });
//   $('#register_login_btn').click(function() {
//     modalAnimate($formRegister, $formLogin);
//   });
//   $('#login_lost_btn').click(function() {
//     modalAnimate($formLogin, $formLost);
//   });
//   $('#lost_login_btn').click(function() {
//     modalAnimate($formLost, $formLogin);
//   });
//   $('#lost_register_btn').click(function() {
//     modalAnimate($formLost, $formRegister);
//   });
//   $('#register_lost_btn').click(function() {
//     modalAnimate($formRegister, $formLost);
//   });
// });
