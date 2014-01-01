namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "admin",
                         email: "rzevall1@swarthmore.edu",
                         password: "festerina",
                         password_confirmation: "festerina",
                         admin: true)

    Post.create!(title: "Example Post",
                 content: "Sample content")
    99.times do |n|
      title = "Sample Post #{n}"
      content = Faker::Name.name
      Post.create!(title: title,
                   content: content)

    end
  end
end