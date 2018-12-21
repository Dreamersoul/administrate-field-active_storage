class UsersController < ApplicationController
    def remove_attachment
        attachment = ActiveStorage::Attachment.find(params[:attachment_id])
        attachment.purge
        redirect_back(fallback_location: "/")
    end
end