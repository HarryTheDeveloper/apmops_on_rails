# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seed 20 papers
20.times do |index|
  Paper.create(
      title: "Apmops #{2000 + index}",
      is_paid: index > 1,
      num_questions: 30,
      year: 2000 + index,
      round: 0
  )
end