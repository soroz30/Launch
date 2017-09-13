$(function() {
  var colors = ['#000', '#003', '#006', '#009', '#00c', '#00f'];
  var canvas = document.querySelector('canvas');
  var ctx = canvas.getContext('2d');
  
  var x = canvas.width / 2;
  var y = canvas.height / 2;
  var radius = x;

  ctx.beginPath();
  ctx.arc(x, y, radius, 0, 2 * Math.PI);
  ctx.fill();
  ctx.closePath();

  ctx.beginPath();
  ctx.strokeStyle = 'rgba(0, 102, 204, .7)';
  ctx.moveTo(x, y - 50);
  ctx.lineTo(x + 50, y);
  ctx.lineTo(x - 50, y);
  ctx.lineTo(x, y - 50);
  ctx.stroke();
  ctx.closePath();

  var img_src = canvas.toDataURL('png');
  var img = document.createElement('img');

  img.src = img_src;
  document.body.appendChil(img);
});