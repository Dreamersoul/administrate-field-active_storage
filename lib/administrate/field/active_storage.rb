require "administrate/field/base"
require "rails"

module Administrate
  module Field
    class ActiveStorage < Administrate::Field::Base
      class Engine < ::Rails::Engine
      end
    end
  end
end
