class SearchesController < ApplicationController
	def new
		@title = params[:title] if params[:title]
		@search=Search.new
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		respond_to do |format| 
			format.html
			format.xlsx {render xlsx: 'show',filename: "report.xlsx"}	
		end
	end
	def index
		@searches = Search.paginate(page: params[:page], per_page: 5)
	end

	private

	def search_params
		params.require(:search).permit(:keywords, :project_id, :assignet_to, :status)
	end
end

