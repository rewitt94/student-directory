students = [
  {name: 'Black Panther', cohort: :febuary},
  {name: 'Luther', cohort: :may},
  {name: 'Lara Croft', cohort: :march},
  {name: 'Rick', cohort: :january},
  {name: 'Rey', cohort: :december},
  {name: 'Harry Potter', cohort: :febuary},
  {name: 'Legolas', cohort: :december}
]
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
print_header
print(students)
print_footer(students)
