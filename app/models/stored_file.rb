class StoredFile < ApplicationRecord
  belongs_to :folder
  belongs_to :user
  has_one_attached :s3_key
end
