module Admin
  class UsersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      super
      @resources = User.with_attached_avatars.
        page(params[:page]).
        per(10)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def destroy_avatar
      avatar = requested_resource.avatars.find(params[:attachment_id])
      avatar.purge
      redirect_back(fallback_location: requested_resource)
    end
  end
end
