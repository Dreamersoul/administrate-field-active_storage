class UsersController < ApplicationController
    def destroy_avatar
        avatar = requested_resource.avatars.find(params[:attachment_id])
        avatar.purge
        redirect_back(fallback_location: requested_resource)
    end
end