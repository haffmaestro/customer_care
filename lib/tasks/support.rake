task support_data: [:environment] do
  def namer
    (Faker::Name.first_name+" "+Faker::Name.last_name)
  end

  if Supporter.count > 99
    puts "Supporters already bootstrapped"
  else
    100.times do
      Supporter.create(
        name: namer,
        email: Faker::Internet.email,
        message: Faker::Lorem.paragraph,
        department: "Art",
        )
    end
  end

end
