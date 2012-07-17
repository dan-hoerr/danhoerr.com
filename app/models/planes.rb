class Planes < ActiveRecord::Base
  attr_accessible :title, :cardtype, :text, :img, :multiverseid

  def self.random_record
  	ids = connection.select_all("SELECT id FROM planes")
  	return find_by_id(ids[rand(ids.length)]["id"].to_i) unless ids.blank?
  end

  def self.update_planes
	  	url = "http://gatherer.wizards.com/Pages/Search/Default.aspx?output=compact&action=advanced&special=true&type=%7C[%22Phenomenon%22]%7C[%22Plane%22]+![%22Planeswalker%22]"
		html_doc = Nokogiri::HTML(open(url))

		@cards = []
		#assemble details of each card to be added to the database
		html_doc.css("tr.cardItem").each do |card|
			temp_card = {}
			temp_card["title"] = card.at_css("td.name a").text
			#set the id of the card in question from the URL
			temp_url = card.at_css("td.name a").xpath('@href').text
			u = URI.parse(temp_url)
			q = CGI.parse(u.query)
			temp_card["multiverseid"] = q["multiverseid"].first
			temp_card["img"] = "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=" + temp_card["multiverseid"] + "&type=card"

			#open a new parser for the detail page to grab text/chaos
			card_url = "http://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid=" + temp_card["multiverseid"]
			card_doc = Nokogiri::HTML(open(card_url))

			temp_card["type"] = card_doc.css("#ctl00_ctl00_ctl00_MainContent_SubContent_SubContent_typeRow div.value").text.strip!

			text_box = card_doc.css("#ctl00_ctl00_ctl00_MainContent_SubContent_SubContent_textRow div.value .cardtextbox").to_html
			text_box.gsub!("/Handlers", "http://gatherer.wizards.com/Handlers")

			temp_card["text"] =  text_box

			@cards << temp_card
  		end

  		#check the database to see if the record already exists. if not, add it
  		@cards.each do |card|
  			unless Planes.find_by_multiverseid(card["multiverseid"])
  				plane = Planes.create()
  				plane.title = card["title"]
  				plane.multiverseid = card["multiverseid"]
  				plane.img = card["img"]
  				plane.cardtype = card["type"]
  				plane.text = card["text"]
  				plane.save
  			end
  		end
  	end #end update

end
