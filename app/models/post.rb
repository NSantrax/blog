class Post < ActiveRecord::Base
  mount_uploader :foto, FotoUploader
end
