# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"

Article.destroy_all
User.destroy_all
Comment.destroy_all

puts "creating 3 users"

user1 = User.create(email: "test1@test.com", password: "123456", first_name: "Zoe", last_name: "Jackson", admin: true)

user2 = User.create(email: "test2@test.com", password: "123456", first_name: "Rory", last_name: "Swinburne", admin: false)

user3 = User.create(email: "test3@test.com", password: "123456", first_name: "Orla", last_name: "Fowler", admin: false)

puts "created 3 users"
puts "creating articles"

article1 = Article.create(title: Faker::Name.name, address: Faker::Address.country, category: Faker::Commerce.department, content: Faker::Lorem.paragraph(sentence_count: 8))
file1 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986958/pexels-diego-f-parra-843633_lynsiz.jpg")
article1.photo.attach(io: file1, filename: "nes.png", content_type: "image/png")
article1.user = user1
article1.save!

puts "created 1 article"

article2 = Article.create(title: Faker::Name.name, address: Faker::Address.country, category: Faker::Commerce.department, content: Faker::Lorem.paragraph(sentence_count: 8))
file2 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1666112212/zoe2_xlnz0u.jpg")
article2.photo.attach(io: file2, filename: "nes.png", content_type: "image/png")
article2.user = user1
article2.save!
puts "created 1 article"

article3 = Article.create(title: Faker::Name.name, address: Faker::Address.country, category: Faker::Commerce.department, content: Faker::Lorem.paragraph(sentence_count: 8))
file3 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1666861660/qqksbhnrh2whpb2qy5dp.jpg")
article3.photo.attach(io: file3, filename: "nes.png", content_type: "image/png")
article3.user = user1
article3.save!
puts "created 1 article"

article4 = Article.create(title: Faker::Name.name, address: Faker::Address.country, category: Faker::Commerce.department, content: Faker::Lorem.paragraph(sentence_count: 8))
file4 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986955/pexels-jean-van-der-meulen-1549308_exzrxw.jpg")
article4.photo.attach(io: file4, filename: "nes.png", content_type: "image/png")
article4.user = user1
article4.save!
puts "created 1 article"

article5 = Article.create(title: Faker::Name.name, address: Faker::Address.country, category: Faker::Commerce.department, content: Faker::Lorem.paragraph(sentence_count: 8))
file5 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986964/pexels-scott-webb-212942_pw1lp9.jpg")
article5.photo.attach(io: file5, filename: "nes.png", content_type: "image/png")
article5.user = user2
article5.save!
puts "created 1 article"

article6 = Article.create(title: Faker::Name.name, address: Faker::Address.country, category: Faker::Commerce.department, content: Faker::Lorem.paragraph(sentence_count: 8))
file6 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1669048522/zoe_header_pic_2_nsu9ml.jpg")
article6.photo.attach(io: file6, filename: "nes.png", content_type: "image/png")
article6.user = user2
article6.save!
puts "created 1 article"

article7 = Article.create(title: Faker::Name.name, address: Faker::Address.country, category: Faker::Commerce.department, content: Faker::Lorem.paragraph(sentence_count: 8))
file7 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1669281726/pexels-pixabay-277696_jjhe6d.jpg")
article7.photo.attach(io: file7, filename: "nes.png", content_type: "image/png")
article7.user = user2
article7.save!
puts "created 1 article"

article8 = Article.create(title: Faker::Name.name, address: Faker::Address.country, category: Faker::Commerce.department, content: Faker::Lorem.paragraph(sentence_count: 8))
file8 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1669386981/pexels-arthouse-studio-4328296_cgkmdz.jpg")
article8.photo.attach(io: file8, filename: "nes.png", content_type: "image/png")
article8.user = user3
article8.save!
puts "created 1 article"

article9 = Article.create(title: Faker::Name.name, address: Faker::Address.country, category: Faker::Commerce.department, content: Faker::Lorem.paragraph(sentence_count: 8))
file9 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1669393163/24744ce9-95be-4ca9-9416-3c5effe76997_beqitg.jpg")
article9.photo.attach(io: file9, filename: "nes.png", content_type: "image/png")
article9.user = user3
article9.save!
puts "created 1 article"

article10 = Article.create(title: Faker::Name.name, address: Faker::Address.country, category: Faker::Commerce.department, content: Faker::Lorem.paragraph(sentence_count: 8))
file10 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1669751716/orla_zoeandcam_m8eghc.jpg")
article10.photo.attach(io: file10, filename: "nes.png", content_type: "image/png")
article10.user = user3
article10.save!

puts "created 10 articles"

10.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.article = article1
  comment.user = user1
  comment.save!
end

10.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.article = article2
  comment.user = user2
  comment.save!
end

10.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.article = article3
  comment.user = user3
  comment.save!
end

10.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.article = article4
  comment.user = user3
  comment.save!
end

10.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.article = article5
  comment.user = user1
  comment.save!
end

10.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.article = article6
  comment.user = user2
  comment.save!
end

10.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.article = article7
  comment.user = user3
  comment.save!
end

10.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.article = article8
  comment.user = user2
  comment.save!
end

10.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.article = article9
  comment.user = user1
  comment.save!
end

10.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.article = article10
  comment.user = user1
  comment.save!
end
