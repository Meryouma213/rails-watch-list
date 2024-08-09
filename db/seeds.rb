require 'faker'

Movie.destroy_all
puts "everything destroyed"

10.times do
  Movie.find_or_create_by!(title: Faker::Movie.unique.title) do |movie|
    movie.overview = Faker::Movie.quote
    movie.poster_url = Faker::LoremFlickr.image(size: "300x400", search_terms: ['movie'])
    movie.rating = Faker::Number.between(from: 0.0, to: 10.0).round(1)
  end
end

puts "#{Movie.count} movies created!"
