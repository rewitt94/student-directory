students = [
  'Black Panther',
  'Luther',
  'Lara Croft',
  'Rick',
  'Rey',
  'Harry Potter',
  'Legolas'
]
def print_header
  puts 'The students of Superhero Academy'
  puts '---------------------------------'
end
def print(names)
  names.each { |student|
  puts student
}
end
def print_footer(names)
  puts "We have #{names.count} great students"
end
print_header
print(students)
print_footer(students)
