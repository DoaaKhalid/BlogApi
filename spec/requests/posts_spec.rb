require 'rails_helper'
 # Happy scenario  for create,update and delete posts

describe 'Posts API', type: :request do 
	describe 'GET /posts', type: :request do
	it 'returns all posta' do 
     user_params = { user: {name: "doaa",email: "doaa.khaled@gmail.com",password_digest: "1234567",image_path: "photo.jpg" }}
     post '/api/v1/users', :params => user_params.to_json,:headers => { "Content-Type": "application/json" }
     json_file = JSON.parse(response.body)
     token=json_file['token']
     post '/api/v1/posts', params: { post: {title: 'First Test', body: 'First Body'} }, :headers => {"Content-Type": "application/json" , "Authorization": "Bearer " + token}
	
	
	

		get '/api/v1/posts' , :headers => {"Content-Type": "application/json" , "Authorization": "Bearer " + token}

		expect(response).to have_http_status(:success)
		expect(JSON.parse(response.body).size).to eq(1)
	  end

    end

	describe 'POST /posts' , type: :request do
	it 'create a new post' do

	     user_params = { user: {
                       name: "doaa",
                       email: "doaa.khaled@gmail.com",
                       password_digest: "1234567",
                       image_path: "photo.jpg" }
                   }
        post '/api/v1/users', :params => user_params.to_json,:headers => { "Content-Type": "application/json" }
        json_file = JSON.parse(response.body)
        token = json_file['token']
	
		expect{
		post '/api/v1/posts', params: { post: {title: 'Fourth Test', body: 'Fourth Body'} }, :headers => {"Content-Type": "application/json" , "Authorization": "Bearer " + token}
			}.to change{Post.count}.from(0).to(1)
		expect(response).to have_http_status(:created)
		end
	end	


end

 # Unhappy scenario  for create,update and delete posts ====> (without user token)

describe 'Posts API', type: :request do

	describe 'GET /posts' , type: :request do
	it 'returns all posta' do 
		user_params = { user: {
                       name: "doaa",
                       email: "doaa.khaled@gmail.com",
                       password_digest: "1234567",
                       image_path: "photo.jpg" }
                   }
        post '/api/v1/users', :params => user_params.to_json,:headers => { "Content-Type": "application/json" }
        json_file = JSON.parse(response.body)
        token = json_file['token']

        post '/api/v1/posts', params: { post: {title: 'First Test', body: 'First Body'} }, :headers => {"Content-Type": "application/json" , "Authorization": "Bearer " + token}

	
		get '/api/v1/posts' , :headers => {"Content-Type": "application/json" }
		expect(response).to have_http_status(:unauthorized)
	  end

    end

	describe 'POST /posts', type: :request do
	it 'create a new post'  do
		expect{
		post '/api/v1/posts', params: { post: {title: 'Fourth Test', body: 'Fourth Body'} }, :headers => {"Content-Type": "application/json" }
			}.to change{Post.count}.from(0).to(1)
		expect(response).to have_http_status(:unauthorized)
		end
	end	


end