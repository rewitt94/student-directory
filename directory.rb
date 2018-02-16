def input_students
  puts "Please enter the names of students."
  puts "To finish, just hit return twice"
  students = []
  name = gets.chop
  while !name.empty? do
    puts "In which cohort is #{name}?"
    join_date = gets.chop
    students << {name: name, cohort: join_date.to_sym}
    if students.count < 2
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    name = gets.chop
  end
  students
end
def print_header
  puts 'The students of Superhero Academy'
  puts '---------------------------------'
end
def print(students)
  cohorts = []
  students.each { |student|
    cohorts.push(student[:cohort])
  }
  cohorts = cohorts.uniq
  cohorts.each do |cohort|
    puts "Joining the #{cohort} cohort:"
    index = 0
    while index < students.length do
      if cohort == students[index][:cohort]
        puts "#{index + 1}. #{students[index][:name]}"
      end
      index += 1
    end
  end

end
def print_footer(students)
  if students.count < 2
    puts "We have #{students.count} great student"
  else
    puts "We have #{students.length} great students"
  end
end
students = input_students
if students > 1
  print_header
  print(students)
  print_footer(students)
end
