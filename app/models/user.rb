class User < ApplicationRecord
    has_secure_password
    has_many :folders
    has_many :stored_files
    has_one_attached :avatar
  
    def thumbnail
      avatar.variant(resize: "100x100!").processed
    end
  end
  