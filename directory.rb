def input_students
  puts 'Please enter the names of the students'
  puts 'To finish just hit the return twice'
  name = gets.chomp

  unless name.empty?

    puts 'Please enter student cohort'
    cohort = gets.chomp
    cohort = 'November' if cohort.empty?

    puts 'Please enter students hobby'
    hobby = gets.chomp

    puts 'Please enter students place of birth'
    birth_place = gets.chomp

    puts 'Please enter students height'
    height = gets.chomp
end
  # repeat this while name variable is empty
  # creating an empty array
  students = []
  until name.empty?
    # add the student hash to the array
    students << { name: name, cohort: cohort, hobby: hobby,
                  birth_place: birth_place, height: height }
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts 'Enter name'
    name = gets.chomp

    next if name.empty?
    puts 'Enter cohort'
    cohort = gets.chomp
    cohort = 'November' if cohort.empty?

    puts 'Enter hobby'
    hobby = gets.chomp

    puts 'Enter place of birth'
    birth_place = gets.chomp

    puts 'Enter height'
    height = gets.chomp

  end
  # return the array of students
  students
end

# prints the header of the list of students
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

# prints the list of students in the array
def print(students)
  cohort_sorted = {}

  students.map do |student|
    name = student[:name]
    cohort = student[:cohort]

    if cohort_sorted[cohort].nil?
      cohort_sorted[cohort] = [name]
    else
      cohort_sorted[cohort].push(name)
    end
  end

  cohort_sorted.each do |cohort|

    cohort.each do |student|
    puts student
    end

  end

end







# prints a footer with the total student count
def print_footer(names)
  puts "Overall, we have #{names.count} great student" if names.count == 1
  puts "Overall, we have #{names.count} great students" if names.count > 1
end

students = input_students
print_header
print(students)
print_footer(students)
