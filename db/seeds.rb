5.times do
  Category.create(name: Faker::HitchhikersGuideToTheGalaxy.planet)
end

5.times do
  Post.create(name: Faker::ProgrammingLanguage.name , author: Faker::ProgrammingLanguage.creator, body: Faker::Lorem.paragraph, category_id: 1)
end

5.times do
  Post.create(name: Faker::ProgrammingLanguage.name , author: Faker::ProgrammingLanguage.creator, body: Faker::Lorem.paragraph, category_id: 2)
end

5.times do
  Post.create(name: Faker::ProgrammingLanguage.name , author: Faker::ProgrammingLanguage.creator, body: Faker::Lorem.paragraph, category_id: 3)
end

5.times do
  Post.create(name: Faker::ProgrammingLanguage.name , author: Faker::ProgrammingLanguage.creator, body: Faker::Lorem.paragraph, category_id: 4)
end

5.times do
  Post.create(name: Faker::ProgrammingLanguage.name , author: Faker::ProgrammingLanguage.creator, body: Faker::Lorem.paragraph, category_id: 5)
end