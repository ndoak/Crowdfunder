# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!([
  {id: 1, name: 'Music', image: 'https://images.unsplash.com/photo-1431069826965-10c61a19b835?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=f6c897f66105b1e4eac5c8ec7b3e8d53'},
  {id: 2, name: 'Movies', image: 'https://images.unsplash.com/photo-1452745943986-be0a25cd68b4?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=77b7c88d7b9f01af6462e62ed3dab00f'},
  {id: 3, name: 'Food', image: 'https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?crop=entropy&dpr=2&fit=crop&fm=jpg&h=625&ixjsv=2.1.0&ixlib=rb-0.3.5&q=50&w=1300'},
  {id: 4, name: 'Tech', image: 'https://images.unsplash.com/photo-1416339442236-8ceb164046f8?crop=entropy&dpr=2&fit=crop&fm=jpg&h=625&ixjsv=2.1.0&ixlib=rb-0.3.5&q=50&w=1300'},
  {id: 5, name: 'Environment', image: 'https://images.unsplash.com/46/iYvDeqVGRbebiQv2PIJi_DSC_8407.JPG?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=f623a5ba3f76eda6264842fbc8b5e2b1'},
  {id: 6, name: 'Fashion', image: 'https://images.unsplash.com/photo-1444920275954-9dddec6b714e?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=d8cb8ac5055c66ee43971ba2e5bf3f8f'},
  {id: 7, name: 'Other', image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?crop=entropy&dpr=2&fit=crop&fm=jpg&h=625&ixjsv=2.1.0&ixlib=rb-0.3.5&q=50&w=1300'}
])

User.create(email: 'y@y.com', password: '1', password_confirmation: '1');
