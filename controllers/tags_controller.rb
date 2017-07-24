require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('../models/tag')
require_relative('../models/transaction')

get '/tags' do
  @tags = Tag.find_all
  erb(:"tags/index")
end
