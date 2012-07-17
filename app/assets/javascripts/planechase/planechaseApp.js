

PlanechaseApp = (function(Backbone, _){
	var Card = Backbone.Model.extend({});

	var Deck = Backbone.Collection.extend({
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
				$('body').addClass('phenom');
				this.$el.addClass('click_to_advance');
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
			this.revealNextCard(this.collection.models[0]);
		},

		revealNextCard: function(item){
			this.clearMessage();
			$('body').removeClass('phenom');
			var cardview = new CardView({
				model:item
			});
			this.$el.append(cardview.render().el);
			this.moveCardToBottom();
		},

		revealXCards: function(){
			
			var cards_to_reveal = $('#xCards').val() === 0 ? 1 : $('#xCards').val();
			var that = this;
			this.clearMessage();
			if(Number(cards_to_reveal) != NaN){
				this.$el.find("article").remove();
				this.showMessage("notice", "click on one card to make that the active plane")
				_.each(_.range(0,cards_to_reveal), function(i){
					that.revealX(that.collection.models[i]);
				});
			} else {
				this.showMessage("error", "please enter a real number");
			}
		},

		revealX: function(item){
			var cardview = new CardView({
				model:item,
				className:"multi-up-container"
			});

			this.$el.append(cardview.render().el);
			this.moveCardToBottom();
		},

		moveCardToBottom: function(){
			usedCard = this.collection.models.shift();
			this.collection.models.push(usedCard);
		},

		shuffleDeck: function(){
			var shuffled = _.shuffle(this.collection.models)
			this.collection.reset(shuffled);
			this.showMessage("notice", "Deck Shuffled.");
		},

		showMessage: function(type, message){
			$('.alerts').html("<p class='" + type + "'>" + message + "</p>" );
		},

		clearMessage: function(){
			$('.alerts').html("");
		},

		selectCardToPersist: function(e){
			$(e.currentTarget).removeClass('multi-up-container').addClass('card-container').siblings("article").remove();
			this.clearMessage();
		},

		rollDice: function(){
			roll = Math.floor(Math.random()*6);
			switch(roll){
				case 0:
					this.render();
					this.showMessage('notice', 'Planeswalk! Pulling up the next Plane for you...');
					break;
				case 1:
					this.showMessage('notice', 'Chaos!');
					break;
				default:
					this.showMessage('notice', 'better luck next time...');
			}
		},

		events: {
			"click .click_to_advance" : "render",
			"click #shuffledeck" : "shuffleDeck",
			"click #revealX" : "revealXCards",
			"click .multi-up-container" : "selectCardToPersist",
			"click #rollDice" : "rollDice"
		}
	});

	var planechaseApp = function(initialModels){
		this.start = function(){
			this.models = new Deck();
			this.view = new PlanechaseView({collection: this.models, el: $('#plane')});
			//shuffle the models, we're going to move the 
			this.models.reset(_.shuffle(initialModels));
		};
	};
	return planechaseApp;
})(Backbone, _);