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

      def url
        Rails.application.routes.url_helpers.rails_blob_path(data, only_path: true)
      end

      def blob_url
        Rails.application.routes.url_helpers.rails_blob_path(data, disposition: :attachment, only_path: true)
      end
      
      # work around since calling data.preview(options)
      # returns "/images/<ActiveStorage::Preview>" which isnt the url

      def preview(options)
        Rails.application.routes.url_helpers.rails_representation_path(data.preview(options), only_path: true)
      end
      
      delegate :filename, to: :data
      delegate :previewable?, to: :data
      delegate :image?, to: :data
      delegate :video?, to: :data
      delegate :audio?, to: :data
      delegate :audio?, to: :data

    end
  end
end
