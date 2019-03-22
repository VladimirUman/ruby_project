User.delete_all

User.create!(name: 'admin', password: 'admin', email: 'admin@example.com')

Category.delete_all

Category.create!(name: 'Products')

Category.create!(name: 'Books', parent_id: 1)

