require 'csv'
@students = []  #an empty array accessible to all methods

def interactive_menu
  #load_students
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Load students from file"
  puts "4. Save the list to a file"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    puts " Input students selected ".center(60,":")
    input_students
  when "2"
    puts " Show students selected ".center(60,":")
    show_students
  when "3"
    puts " Load students from file ".center(60,":")
    load_students
  when "4"
    puts " Save list to a file ".center(60,":")
    save_students
  when "9"
    puts " Program exited ".center(60,":")
    exit
  else
    puts "I don't know what you meant, try again"
  end
end


#selection1
def input_students
  while true
    puts ""
    puts ' Please enter the name of the student '.center(60,"-")
    puts ' To finish just hit the return twice '.center(60)
    name = STDIN.gets.chomp
    return false if name.empty? == true
    puts 'Please enter student cohort'.center(60)
    cohort = STDIN.gets.chomp
    cohort = 'November' if cohort.empty?
    add_students_to_list(name, cohort)
    puts "Now we have #{@students.count} students".center(60)
  end
end

#selection2
def show_students
  if @students.empty?
    puts ""
    puts " No students loaded from file ".center(60," + ")
    puts ""
    return
  end
  print_header
  print_students_list
  print_footer
end

#selection3
def load_students(filename = choose_save_load_file)
  @students.clear  #set @students to clear so not to duplicate an existing csv file
  File.open(filename, 'r') do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_students_to_list(name, cohort)
    end
  end
  puts "Loaded #{@students.count} students from #{filename}".center(60)
end

#selection4
def save_students
  File.open(choose_save_load_file, 'w') do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

# prints the header of the list of students
def print_header
  puts ""
  puts 'The students of Villains Academy'.center(60)
  puts '-------------'.center(60)
end

# prints a footer with the total student count
def print_footer
  puts "Overall, we have #{@students.count} great student".center(60) if @students.count == 1
  puts "Overall, we have #{@students.count} great students".center(60) if @students.count > 1
end


def add_students_to_list(name, cohort)
  @students << { name: name, cohort: cohort}
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

def choose_save_load_file
  file = ""
    while file.empty?
      puts "Type in file name".center(60)
      file = gets.chomp
      puts "File #{file} loaded".center(60)
    end
    file
end

def load_list_startup
  ARGV.first.nil? ? filename = "students.csv" : filename = ARGV.first
  try_load_students(filename)
end

def try_load_students(filename)
  File.exists?(filename)? load_students(filename): puts("Sorry, #{filename} doesn\'t exist.".center(60))
end

load_list_startup
interactive_menu
