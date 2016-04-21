require "administrate/field/base"
require "rails"

module Administrate
  module Field
    class Image < Administrate::Field::Base
      VERSION = "0.0.2"

      class Engine < ::Rails::Engine
      end
    end
  end
end
