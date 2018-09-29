class Match < ApplicationRecord
	def self.create uuid 
		if REDIS.get("matches").blank?
			REDIS.set("matches", uuid)
		else 
			#get uuid of waiting player
			opponent = REDIS.get("matches")

			Game.start(uuid, opponent)
			# clear the waiting key as no one new is waiting
			REDIS.set("matches", nil)
		end 
	end 
end
