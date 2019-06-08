require 'administrate/field/base'
require 'rails'

module Administrate
  module Field
    class ActiveStorage < Administrate::Field::Base
      class Engine < ::Rails::Engine
      end

      def url_only?
        options.fetch(:url_only, false)
      end

      def destroyable?
        options.key?(:destroy_path)
      end

      def show_in_index?
        options.fetch(:show_in_index, false)
      end

      def show_preview_size
        options.fetch(:show_preview_size, "1080x1920>")
      end

      def many?
        # find a way to use instance_of
        data.class.name == 'ActiveStorage::Attached::Many'
      end

      def direct?
        options.fetch(:direct_upload, false)
      end

      # def destroy_path?
      #   options.fetch(:destroy_path, false).present?
      # end

      # currently we are using Rails.application.routes.url_helpers
      # without including the namespace because it runs into an
      # exception

      # work around since calling data.preview(options)
      # returns "/images/<ActiveStorage::Preview>" which isnt the url
      def preview(attachment, options)
        Rails.application.routes.url_helpers.rails_representation_path(attachment.preview(options), only_path: true)
      end

      def variant(attachment, options)
        Rails.application.routes.url_helpers.rails_representation_path(attachment.variant(combine_options: options), only_path: true)
      end

      def url(attachment)
        Rails.application.routes.url_helpers.rails_blob_path(attachment, only_path: true)
      end

      def blob_url(attachment)
        Rails.application.routes.url_helpers.rails_blob_path(attachment, disposition: :attachment, only_path: true)
      end

      def destroy_path(field, attachment)
        destroy_path_helper = options.fetch(:destroy_path)
        record_id = field.data.record.id
        attachment_id = attachment.id
        Rails.application.routes.url_helpers.send(destroy_path_helper, {:record_id => record_id, :attachment_id => attachment_id})
      end

      delegate :attached?, to: :data
      delegate :attachments, to: :data
    end
  end
end
