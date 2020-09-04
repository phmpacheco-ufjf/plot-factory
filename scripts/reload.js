$(document).ready(function () {
  $("body").on("DOMNodeInserted", "#shiny-disconnected-overlay", function () {
    setTimeout(() => location.reload(), 1500);
  });
});
