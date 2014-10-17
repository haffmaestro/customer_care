task department: [:environment] do
  def department_setter
    departments = ['Sales', 'Marketing', 'Technical']
    integer = rand(3).round
    departments[integer]
  end

  supporters = Supporter.all
  supporters.each do |supporter|
    supporter.department = department_setter
    supporter.save
  end

end