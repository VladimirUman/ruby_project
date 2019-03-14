#---
# Excerpted from "Agile Web Development with Rails 5",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails5 for more book information.
#---
# encoding: utf-8

User.delete_all

User.create!(name: 'admin', password: 'admin')

Category.delete_all

Category.create!(name: 'Products')

Category.create!(name: 'Books', parent_id: 1)

