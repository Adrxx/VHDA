module StaticsHelper
  def photo_from_experience(exp)
    if exp.photos.any?
      exp.photos.first.file
    else
      image_url("no-image.png")
    end
  end
end
