Song.destroy_all

50.times do
    Song.create(
        title: Faker::Music::Phish.song,
        released: true,
        release_year: rand(1990..2020),
        artist_name: Faker::Music.band,
        genre: Faker::Music.genre
    )
end