def print_menu
  puts 'Select an option'
  puts '1. Input students'
  puts '2. List students'
  puts '3. Save students'
  puts '4. Load students'
  puts '9. Exit'
end
def process(selection)
  case selection
    when '1'
      input_students
    when '2'
      list_students
    when '3'
      save_students
    when '4'
      load_students
    when '9'
      exit
    else
      puts 'Invalid selection'
  end
end
def input_students
  puts "Please enter the names of students."
  puts "To finish, just hit return twice"
  name = gets.chop
  while !name.empty? do
    puts "In which cohort is #{name}?"
    join_date = gets.chop
    @students << {name: name, cohort: join_date.to_sym}
    if @students.count < 2
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = gets.chop
  end
end
def print_header
  puts 'The students of Superhero Academy'
  puts '---------------------------------'
end
def print_students_list
  cohorts = []
  @students.each { |student|
    cohorts.push(student[:cohort])
  }
  cohorts = cohorts.uniq
  cohorts.each do |cohort|
    puts "Joining the #{cohort} cohort:"
    index = 0
    while index < @students.length do
      if cohort == @students[index][:cohort]
        puts "#{index + 1}. #{@students[index][:name]}"
      end
      index += 1
    end
  end

end
def print_footer
  if @students.count < 2
    puts "We have #{@students.count} great student"
  else
    puts "We have #{@students.length} great students"
  end
end
def list_students
  if @students.length >= 1
    print_header
    print_students_list
    print_footer
  else
    puts 'No students to list'
  end
end
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name],student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
def interactive_menu
  @students = []
  loop do
    print_menu
    selection = gets.chomp
    process(selection)
  end
end
interactive_menu
