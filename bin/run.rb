require_relative '../config/environment'


all_breed_info = GetBreeds.new
all_breed_info.run

app = DogApp.new
app.run