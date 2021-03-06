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
      puts "You successfully choose option #{selection}: input students"
      input_students
    when '2'
      puts "You successfully choose option #{selection}: list students"
      list_students
    when '3'
      puts "You successfully choose option #{selection}: save students"
      puts "Please insert a filename to save."
      filename = gets.chomp
      save_students(filename)
    when '4'
      puts "You successfully choose option #{selection}: load students"
      puts "Please insert a filename to load."
      filename = gets.chomp
      load_students(filename)
    when '9'
      exit
    else
      puts 'Invalid selection'
  end
end
def input_students
  puts "Please enter the names of students."
  puts "To finish, just hit return twice"
  name = STDIN.gets.chop
  while !name.empty? do
    puts "In which cohort is #{name}?"
    cohort = STDIN.gets.chop
    add_student(name,cohort)
    if @students.count < 2
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = STDIN.gets.chop
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
def save_students(filename)
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name],student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name,cohort)
  end
  file.close
end
def try_load_students
  if ARGV.first != nil
    filename = ARGV.first
    if File.exists?(filename)
      load_students(filename)
    else
      puts "Sorry the file #{filename} isn't found"
    end
  else
    load_students
  end
end
def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end
def interactive_menu
  @students = []
  try_load_students
  loop do
    print_menu
    selection = STDIN.gets.chomp
    process(selection)
  end
end
interactive_menu
