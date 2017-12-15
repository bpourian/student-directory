@students = []  #an empty array accessible to all methods

def input_students
  while true
    puts 'Please enter the name of the student'.center(60,"-")
    puts 'To finish just hit the return twice'.center(60)
    name = STDIN.gets.chomp
    return false if name.empty? == true
    puts 'Please enter student cohort'.center(60)
    cohort = STDIN.gets.chomp
    cohort = 'November' if cohort.empty?
    add_students_to_list(name, cohort)
    puts "Now we have #{@students.count} students".center(60)
  end
end

def add_students_to_list(name, cohort)
  @students << { name: name, cohort: cohort}
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students_to_list(name, cohort)
  end
  file.close
end

# prints the header of the list of students
def print_header
  puts 'The students of Villains Academy'.center(60)
  puts '-------------'.center(60)
end

# prints the list of students in the array sorted into cohorts
def print_students_list
  cohort_list = @students.map {|student| student[:cohort]}.uniq
  cohort_list.each do |month|
    @students.each do |student|
      if student[:cohort] == month
        puts "#{student[:name]} --- (cohort: #{student[:cohort]})".center(60)
      end
    end
  end
end

# prints a footer with the total student count
def print_footer
  puts "Overall, we have #{@students.count} great student".center(60) if @students.count == 1
  puts "Overall, we have #{@students.count} great students".center(60) if @students.count > 1
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    puts "Input students selected".center(60,":")
    input_students
  when "2"
    puts "Show students selected".center(60,":")
    show_students
  when "3"
    puts "List Saved".center(60,":")
    save_students
  when "9"
    puts "Program exited".center(60,":")
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  load_students
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it is isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exit
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
