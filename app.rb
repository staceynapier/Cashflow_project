require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/tags_controller.rb')
require_relative('controllers/transactions_controller.rb')
require_relative('./models/tag')
require_relative('./models/transaction')
require_relative('./models/wallet')

set :wallet_id => 1

get '/' do
  @wallet = Wallet.find(settings.wallet_id)
  erb (:index)
end

post '/wallets/:id' do
  wallet = Wallet.find(params[:id])
  wallet.budget = params[:budget]
  wallet.update
  redirect to ('/')
end