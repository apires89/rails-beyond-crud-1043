puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = {name: "BK", address: "No do Fojo", rating: 5, chef_name: "gordon ramsey"}
pizza_east =  {name: "Telepizza", address: "Matosinhos", rating: 4, chef_name: "ze da esquina"}

[dishoom, pizza_east].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
