class Project < ApplicationRecord
	validates :name, :parent_id, presence: true
	has_many :tasks
end
