class Task < ApplicationRecord
	validates :title, :project_id, :created_by, presence: true
	belongs_to :project
	has_many :comments
end
