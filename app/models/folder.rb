class Folder < ApplicationRecord
  belongs_to :user
  has_many :subfolders, class_name: 'Folder', dependent: :destroy
  has_many :stored_files, dependent: :destroy
  has_ancestry
end
