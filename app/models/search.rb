class Search < ApplicationRecord

	def products
		@products ||= find_products
	end

	def find_products
		#products = Task.all
		products = Task.order(:title)
		products = products.where("title like ?", "%#{keywords}%") if keywords.present?
		products = products.where(project_id: project_id) if project_id.present?
		products = products.where(assignet_to: assignet_to) if assignet_to.present?
		products = products.where(status: status) if status.present?
		products
	end
	
end
