require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('../models/tag')
require_relative('../models/transaction')

get '/tags' do
  @tags = Tag.find_all
  @images = Tag.find_all
  erb(:"tags/index")
end

get '/tags/food' do
  @food = Transaction.find_by_tag(1)
  erb(:"tags/food")
end

get '/tags/rent' do
  @rent = Transaction.find_by_tag(2)
  erb(:"tags/rent")
end

get '/tags/entertainment' do
  @entertainment = Transaction.find_by_tag(3)
  erb(:"tags/entertainment")
end

get '/tags/clothes' do
  @clothes = Transaction.find_by_tag(4)
  erb(:"tags/clothes")
end

get '/tags/bills' do
  @bills = Transaction.find_by_tag(5)
  erb(:"tags/bills")
end

get '/tags/miscellaneous' do
  @misc = Transaction.find_by_tag(6)
  erb(:"tags/misc")
end