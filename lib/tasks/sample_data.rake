namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "admin",
                         email: "rzevall1@swarthmore.edu",
                         password: "festerina",
                         password_confirmation: "festerina",
                         admin: true)
    Category.create!(title: "personal")
    Post.create!(title: "about rita zevallos",
                 content: "I am a twenty-year-old person living in various places and studying various things.",
                 category_id: 1)
  end
end