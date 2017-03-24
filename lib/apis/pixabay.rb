#get the image from pixabay API
module Apis
	module Pixabay
		def Pixabay.get_image search_string
		  uri = URI('https://pixabay.com/api/')
		  params = { :key => Rails.application.secrets.pixabay_key,:q => search_string }
		  #form the query
		  uri.query = URI.encode_www_form(params)
		  response = Net::HTTP.get_response(uri)
		  #if response is success, parse and store it
		  result = JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
		  #fetch the required field
		  image = result['hits'][0]['previewURL']
		  return image
		end
	end
end