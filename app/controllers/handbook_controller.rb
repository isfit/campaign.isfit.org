class HandbookController < ApplicationController
	layout 'handbook'

	def index

	end

	def show
		@handbook = Handbook.find(params[:id])
	end

	def info
	end
end
