require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('../models/tag')
require_relative('../models/transaction')

get '/transactions' do
  @transactions = Transaction.find_all
  erb(:"transactions/index")
end

get '/transactions/new' do
  @transactions = Transaction.find_all
  erb(:"transactions/new")
end

post '/transactions' do
  new_trans = Transaction.new(params)
  new_trans.save
  redirect to '/transactions'
end