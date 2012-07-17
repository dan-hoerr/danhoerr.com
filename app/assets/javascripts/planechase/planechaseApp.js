PlanechaseApp = (function(Backbone, _){
	var Card = Backbone.Model.extend({});

	var Planechase = Backbone.Collection.extend({
		model:Card
	});

	var CardView = Backbone.View.extend({
		tagName: "article",
		className: "card-container",
		render: function(){
			var card = this.model.toJSON();
			var tmpl = _.template($('#cardTemplate').html());
			this.$el.html(tmpl(card));
			if(card.cardtype === "Phenomenon"){
				this.$el.addClass('phenom');
			}
			return this;
		}
	});
	var PlanechaseView = Backbone.View.extend({
		initialize: function(){
			this.collection.bind("reset", this.render, this);
		},
		render: function(){
			this.$el.find("article").remove();
			this.renderRandomCard();
		},

		renderCard: function(item){
			console.log(item)
			var cardview = new CardView({
				model:item
			});
			this.$el.append(cardview.render().el);
		},

		renderRandomCard: function(){
			random = Math.floor(Math.random()*this.collection.models.length);
			this.renderCard(this.collection.models[random]);
		},

		events: {
			"click .card-container" : "render"
		}
	});

	var planechaseApp = function(initialModels){
		this.start = function(){
			this.models = new Planechase();
			this.view = new PlanechaseView({collection: this.models, el: $('#plane')});
			this.models.reset(initialModels);
		};
	};
	return planechaseApp;
})(Backbone, _);