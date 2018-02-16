def input_students(students)
  puts "Please enter the names of students."
  puts "To finish, just hit return twice"
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
def interactive_menu
  students = []
  loop do
    puts 'Select an option'
    puts '1. Input students'
    puts '2. List students'
    puts '9. Exit'
    selection = gets.chomp
    case selection
    when '1'
      students = input_students(students)
    when '2'
      if students.length >= 1
        print_header
        print(students)
        print_footer(students)
      else
        puts 'No students to list'
      end
    when '9'
      exit
    else
      puts 'Invalid selection'
    end
  end
end
interactive_menu
