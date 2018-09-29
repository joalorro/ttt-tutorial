class Game < ApplicationRecord
	def self.start(player1,player2)
		#Randomly chooses who gets to be noughts or crosses 
		cross, nought = [player1,player2].shuffle

		#broadcast back to the players subscribed to channel
		ActionCable.server.broadcast "player_#{cross}", {action: "game_start", msg: "Cross"}
		ActionCable.server.broadcast "player_#{nought}", {action: "game_start", msg: "Nought"}

		REDIS.set("opponent_for:#{cross}",nought)
		REDIS.set("opponent_for:#{nought}",cross)

	end 
end
