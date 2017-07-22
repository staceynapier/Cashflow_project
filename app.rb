require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/tags_controller.rb')
require_relative('controllers/transactions_controller.rb')
require_relative('./models/tag')
require_relative('./models/transaction')

get '/' do
  erb (:index)
end