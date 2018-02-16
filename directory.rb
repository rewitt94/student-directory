def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end
def print_header
  puts 'The students of Superhero Academy'
  puts '---------------------------------'
end
def print(students)
  students.each { |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
}
end
def print_footer(students)
  puts "We have #{students.length} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
