class User < ApplicationRecord
    has_many_attached :avatars
end
