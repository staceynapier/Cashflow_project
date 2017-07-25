require('pg')
require('pry')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require_relative('../models/wallet.rb')

Transaction.delete_all
Tag.delete_all

tag1 = Tag.new({ 'type' => 'Food', 'icon' => 'images/food_icon.jpg' })
tag1.save

tag2 = Tag.new({ 'type' => 'Rent', 'icon' => 'images/rent_icon.jpg' })
tag2.save

tag3 = Tag.new({ 'type' => 'Entertainment', 'icon' => 'images/entertainment_icon.jpg' })
tag3.save

tag4 = Tag.new({ 'type' => 'Clothes', 'icon' => 'images/clothes_icon.jpg' })
tag4.save

tag5 = Tag.new({ 'type' => 'Bills', 'icon' => 'images/bills_icon.jpg' })
tag5.save

tag6 = Tag.new({ 'type' => 'Miscellaneous', 'icon' => 'images/misc_icon.jpg' })
tag6.save


transaction1 = Transaction.new({ 
  'merchant' => 'Chanter',
  'description' => 'pint', 
  'value' => '3.00', 
  'date_of_trans' => 'Jul-18-2017', 
  'tag_id' => tag3.id
  })
transaction1.save

transaction2 = Transaction.new({ 
  'merchant' => 'Co-op',
  'description' => 'Tuesday dinner', 
  'value' => '6.99', 
  'date_of_trans' => 'Jul-15-2017', 
  'tag_id' => tag1.id
  })
transaction2.save

transaction3 = Transaction.new({ 
  'merchant' => 'Landlord', 
  'description' => 'boo', 
  'value' => '300.00', 
  'date_of_trans' => 'Jul-20-2017', 
  'tag_id' => tag2.id
  })
transaction3.save

transaction4 = Transaction.new({
  'merchant' => 'OVO Energy', 
  'description' => 'gas bill',
  'value' => '72.00', 
  'date_of_trans' => 'Jul-21-2017', 
  'tag_id' => tag5.id, 
  })
transaction4.save

wallet1 = Wallet.new({
  'budget' => '1000.00'
  })
binding.pry
wallet1.save
nil