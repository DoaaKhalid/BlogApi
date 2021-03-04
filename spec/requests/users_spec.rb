require 'rails_helper'
#happy senario valid data

describe 'Authentication', type: :request do 
		it 'authenticates the user' do
			user_params = { user: {
                       name: "doaa",
                       email: "doaa.khaled@gmail.com",
                       password_digest: "12345678",
                       image_path: "photo.jpg" }
                   }
        post '/api/v1/users', :params => user_params.to_json,:headers => { "Content-Type": "application/json" }
					expect(response).to have_http_status(:created)
		end
	
#unhappy senario invalid data
		it 'authenticates the user' do
user_params = { user: {
                       name: "doaa",
                       email: "doaa.khaled@gmail.com",
                       password_digest: "12",
                       image_path: "photo.jpg" }
                   }
        post '/api/v1/users', :params => user_params.to_json,:headers => { "Content-Type": "application/json" }
        					expect(response).to have_http_status(:unprocessable_entity)
		end
	


#happy senario login



		it 'authenticates the user' do

			user_params = { user: {
                       name: "doaa",
                       email: "doaa.khaled@gmail.com",
                       password_digest: "1234567",
                       image_path: "photo.jpg" }
                   }
        post '/api/v1/users', :params => user_params.to_json,:headers => { "Content-Type": "application/json" }
 			post '/api/v1/login', params: {user: {email: 'doaa@gmail.com', password_digest: '1234567' }}, :headers => {"Content-Type": "application/json" , "Authorization": "Bearer " }
					expect(response).to have_http_status(:ok)
		
	end



end