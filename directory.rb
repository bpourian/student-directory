def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit the return twice"
  #creating an empty array
  students = []
  name = gets.chomp
  #repeat this while name variable is empty
    while !name.empty? do
      #add the student hash to the array
      students << {name: name, cohort: :november}
      puts "Now we have #{students.count} students"
      #get another name from the user
      name = gets.chomp
    end
    #return the array of students
    students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
