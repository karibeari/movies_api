desc "Seed the database with all or a specified movies from the dataset"
task :seed_db, [:number_of_movies] do |_t, args|
  
  if args[:number_of_movies]
    ParseMoviesMetadata.new('./the-movies-dataset/movies_metadata.csv', args[:number_of_movies]).perform
  else 
    ParseMoviesMetadata.new('./the-movies-dataset/movies_metadata.csv').perform
  end

  puts 'Database successfully seeded'

end