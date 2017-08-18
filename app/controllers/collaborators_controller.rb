# class CollaboratorsController < ApplicationController

# 	def create
#     @wiki = @wiki_id
#     @collaborator = current_user

#       if @collaborator.save
# 				flash[:notice] = "Collaborator added."
# 				redirect_to wikis_path(@wiki)
# 			else
# 				flash[:error] = "These was an error in adding collaborator. Please try again."
# 				redirect_to wikis_path(@wiki)
# 			end
# 	end

# 	def destroy
#     @wiki = @wiki_id
#     @user = user_session
#     @collaborator = current_user

# 		if @collaborator.destroy
# 			flash[:notice] = "Deleted collaborator?"
# 			redirect_to edit_wiki_path(@wiki)
# 		else
# 			flash[:error] = "There was an error deleting collaborator. Please try again."
# 			redirect_to edit_wiki_path(@wiki)
# 		end
# 	end
# end
