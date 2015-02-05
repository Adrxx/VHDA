class PhotosController < ApplicationController

	def create
		Experience.new.photos.build
	end

	def index

	end

end
