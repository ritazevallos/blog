namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "admin",
                         email: "rzevall1@swarthmore.edu",
                         password: "festerina",
                         password_confirmation: "festerina",
                         admin: true)
    Category.create!(title: "the collection")
    Post.create!(title: "Same test hahahahaa",
                 content: "another sample",
                 category_id: 1)
  end
end