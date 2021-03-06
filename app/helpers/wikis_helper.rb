module WikisHelper
	def user_is_authorized_to_create_and_update_wiki?(wiki)
		current_user && (current_user==wiki.user || current_user.admin? || current_user.premium?)
	end
	
	def user_is_authorized_to_delete?
		current_user && (current_user == wiki.user || current_user.admin?)
	end
	
end
