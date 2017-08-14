class WikiPolicy < ApplicationPolicy
     attr_reader :user, :wiki

     def initialize(user, wiki)
        @user = user
        @wiki = wiki
    end

    def create?
        user.premium? || user.admin?
    end
    
    def update?
        if wiki.private == true
            user.premium? || user.admin?
        else
            user.present?
        end
    end
     
    def delete?
        if wiki.private == true
            user.premium? || user.admin?
        end  #user == @wiki.
    end
end 
