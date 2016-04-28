class WeddingController < ApplicationController
	def index
		if params[:link_code]
			@wedding_invite = WeddingInvite.find_by(link_code: params[:link_code])
			@language_code = @wedding_invite.language_code
		else
			@wedding_invite = nil
			@language_code = 'en'
		end
		@image_gallery = [
			{
				'src': 'shanghai_outdoor1.jpg',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'carmel1.jpg',
				'dimensions_css': 'wide' 
			},
			{
				'src': 'shanghai_bw3.jpg',
				'dimensions_css': 'wide' 
			},
			{
				'src': 'min_ren_jie2.jpg',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'min_ren_jie5.jpg',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'shanghai_indoor.jpg',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'pebble_beach4.jpg',
				'dimensions_css': 'wide' 
			},
			{
				'src': 'ming_guo2.jpg',
				'dimensions_css': 'wide' 
			},
			{
				'src': 'kitchen.jpg',
				'dimensions_css': 'wide' 
			},
			{
				'src': 'shanghai_bw1.jpg',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'spanish_bay.jpg',
				'dimensions_css': 'wide left-aligned' 
			},
			{
				'src': 'shanghai_outdoor2.jpg',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'shanghai_outdoors.jpg',
				'dimensions_css': 'wide' 
			},
			{
				'src': 'min_ren_jie1.jpg',
				'dimensions_css': 'wide' 
			},
			{
				'src': 'ming_guo3.jpg',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'lone_cypress.jpg',
				'dimensions_css': 'wide' 
			}
		]
	end

	def save
		invite = WeddingInvite.find_by(link_code: params[:link_code])
		invite_info = params[:wedding_invite]
		save_status = invite.update_attributes(
			:is_coming => invite_info[:is_coming],
			:extra_comments => invite_info[:extra_comments],
			:primary_invitee_meal => invite_info[:primary_invitee_meal],
			:guest_1_name => invite_info[:guest_1_name],
			:guest_1_meal => invite_info[:guest_1_meal],
			:guest_2_name => invite_info[:guest_2_name],
			:guest_2_meal => invite_info[:guest_2_meal],
			:guest_3_name => invite_info[:guest_3_name],
			:guest_3_meal => invite_info[:guest_3_meal],
			:guest_4_name => invite_info[:guest_4_name],
			:guest_4_meal => invite_info[:guest_4_meal]
			)
		if save_status
			render :json => {
				:is_coming => invite[:is_coming]
				}, :status => :ok
		else
			render :json => {}, :status => :unprocessable_entity
		end
	end

	def switch_language
		invite = WeddingInvite.find_by(link_code: params[:link_code])
		if invite.language_code == 'en'
			new_language_code =  'zh'
		else
			new_language_code = 'en'
		end
		invite.update_attribute(:language_code, new_language_code)
		redirect_to action: "index", link_code: params[:link_code]

	end
end
