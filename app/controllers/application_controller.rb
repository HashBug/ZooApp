class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include Apis::Pixabay
end
