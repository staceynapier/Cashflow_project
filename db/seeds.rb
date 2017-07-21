require('pg')
require('pry')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')

tag1 = Tag.new({ 'type' => 'Food', 'icon' => '../public/bills_icon.tiff' })
tag1.save

tag2 = Tag.new({ 'type' => 'Rent', 'icon' => '../public/rent_icon.tiff' })
tag2.save

tag3 = Tag.new({ 'type' => 'Entertainment', 'icon' => '../public/entertainment_icon.tiff' })
tag3.save

tag4 = Tag.new({ 'type' => 'Clothes', 'icon' => '../public/clothes_icon.tiff' })
tag4.save

tag5 = Tag.new({ 'type' => 'Bills', 'icon' => '../public/bills_icon.tiff' })
tag5.save

tag6 = Tag.new({ 'type' => 'Miscellaneous', 'icon' => '../public/misc_icon.tiff' })
tag6.save