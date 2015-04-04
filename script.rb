require 'sinatra'
require 'twilio-ruby'

get '/' do 
	erb :textForm
	
end

post '/' do
	account_sid = ''
	auth_token = ''

	@client = Twilio::REST::Client.new account_sid, auth_token

	inputBody = params[:inputBody]
	inputNumber = params[:inputNumber]


	message = @client.account.messages.create(:body => inputBody,
		:to => inputNumber,
		:from => "+12403293901")
	puts message.to

	redirect to('/')
end



