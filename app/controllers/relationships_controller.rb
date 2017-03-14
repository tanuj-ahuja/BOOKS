class RelationshipsController < ApplicationController
	def create
		user=User.find(params[:seller_id])
		micropost=Micropost.find(params[:message_id])
		#current_user.add(user)
		#@r=Relationship.find_by(buyer_id: current_user.id,seller_id: user.id)
		#@r.message_id=micropost.id
		#@r.save!

		@n=Relationship.new(buyer_id: current_user.id,seller_id: user.id,message_id: micropost.id)
        @n.save!
		redirect_to root_url
	end	
	def show
		@user_items=current_user.weed.paginate(page: params[:page])
		@micropost_items=current_user.r.paginate(page: params[:page])
		@rels=current_user.hey.paginate(page: params[:page])
	end	
	def showtwo
		@user_items=current_user.weedy.paginate(page: params[:page])
		@micropost_items=current_user.ry.paginate(page: params[:page])
		@rels=current_user.heyy.paginate(page: params[:page])
	end	
end
