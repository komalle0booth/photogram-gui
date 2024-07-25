class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({:created_at => :desc})

    render("photo_templates/index")
  end

  def show
    # Parameters: {"path_id"=>"777"}
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render("photo_templates/show")
  end

  def destroy
    # Parameters: {"path_id"=>"777"}
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")
  end

  def create
    # Parameters: {"input_image"=>""}, {"input_caption"=>""}, {"input_owner_id"=>""}
    input_image = params.fetch("input_image")

    input_caption = params.fetch("input_caption")

    input_owner_id = params.fetch("input_caption")

    a_new_photo = Photo.new
    a_new_photo.image = input_caption
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to({ :template => "photos/" + a_new_photo.id.to_s)
  end
end
