class Folder < ApplicationRecord
  belongs_to :user
  belongs_to :parent_folder, class_name: 'Folder', optional: true
  has_many :subfolders, class_name: 'Folder', foreign_key: 'parent_id', dependent: :destroy
  has_many :stored_files, dependent: :destroy
end
