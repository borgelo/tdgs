jQuery.ajaxSetup({
    'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
});


$.fn.submitIngredient = function() {
    var that = this;

    this.click(function() {
		var uri = "/re_ins"
		var recipe_id = $('[id ="re_in_recipe_id"]').val();
		var amount = $('[id ="re_in_amount"]').val();
		var unit = $('[id ="re_in_unit"]').val();
		var ingredient = $('[id ="re_in_ingredient_name"]').val();
        $.post(uri, {re_in: {recipe_id: recipe_id, amount: amount, unit: unit, ingredient_name: ingredient}}, null, "script");
    });
}
