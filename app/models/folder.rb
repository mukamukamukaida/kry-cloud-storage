class Folder < ApplicationRecord
  belongs_to :user
  belongs_to :parent
end
