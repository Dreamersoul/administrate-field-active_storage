require "administrate/field/base"
require "rails"

module Administrate
  module Field
    class ActiveStorage < Administrate::Field::Base
      class Engine < ::Rails::Engine
      end
      # currently we are using Rails.application.routes.url_helpers 
      # without including the namespace because it runs into an
      # exception
      def many?
        # find a way to use instance_of
        data.class.name == "ActiveStorage::Attached::Many"
      end
      # work around since calling data.preview(options)
      # returns "/images/<ActiveStorage::Preview>" which isnt the url

      def preview(attachment, options)
        Rails.application.routes.url_helpers.rails_representation_path(attachment.preview(options), only_path: true)
      end

      def url(attachment)
        Rails.application.routes.url_helpers.rails_blob_path(attachment, only_path: true)
      end
      
      def blob_url(attachment)
        Rails.application.routes.url_helpers.rails_blob_path(attachment, disposition: :attachment, only_path: true)
      end
      
      delegate :attached?, to: :data
      delegate :attachments, to: :data
    end
  end
end
