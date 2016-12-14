
//admin panel
function removeFields(link) {
  $(link).prevAll("input[type=hidden]").first().val("1");
  $(link).parent(".fields").hide();
 }
function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().after(content.replace(regexp, new_id));
    $(document).foundation('equalizer', 'reflow');

}