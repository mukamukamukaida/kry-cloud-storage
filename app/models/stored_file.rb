class StoredFile < ApplicationRecord
  belongs_to :folder
  belongs_to :user
end
