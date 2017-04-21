module ApplicationHelper

	def comment_belongs_to_current_user?(comment)
      comment.user == current_user 
    end

   # these three methods are used for devise form modals
    def resource
      @resource ||= User.new
    end

    def resource_name
      :user
    end

    def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
    end
end
