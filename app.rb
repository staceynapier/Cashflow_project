require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/tags_controller.rb')
require_relative('controllers/transactions_controller.rb')
require_relative('./models/tag')
require_relative('./models/transaction')
require_relative('./models/wallet')

get '/' do
  erb (:index)
end

post '/' do
  new_wallet = Wallet.new(params)
  new_wallet.save
  redirect to ('/')
end