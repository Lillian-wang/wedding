class WeddingController < ApplicationController
	def index
		if params[:link_code]
			@wedding_invite = WeddingInvite.find_by(link_code: params[:link_code])
		else
			@wedding_invite = nil
		end
		@image_gallery = [
			{
				'src': 'shanghai_outdoor1.JPG',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'shanghai_bw3.JPG',
				'dimensions_css': 'wide' 
			},
			{
				'src': 'min_ren_jie1.JPG',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'min_ren_jie2.JPG',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'min_ren_jie5.JPG',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'min_ren_jie4.JPG',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'shanghai_bw4.JPG',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'ming_guo2.JPG',
				'dimensions_css': 'wide' 
			},
			{
				'src': 'ming_guo3.JPG',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'shanghai_bw1.JPG',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'ming_guo1.JPG',
				'dimensions_css': 'tall' 
			},
			{
				'src': 'shanghai_outdoor2.JPG',
				'dimensions_css': 'tall' 
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
