require 'pg'
require './lib/task'
require './lib/list'

DB = PG.connect({:dbname => 'to_do_database'})


def welcome
  system 'clear'
  puts "Welcome to the To Do list!"
  puts ""
  puts "Hit Enter to continue"
  gets.chomp
  menu
end

def menu
  system 'clear'
  puts "N > New List"
  puts "S > Show Lists"
  puts "E > Edit Lists"
  puts "X > Exit"
  user_input = gets.chomp.upcase
  if user_input == 'N'
    new_list
  elsif user_input == 'S'
    show_list
  elsif user_input == 'E'
    edit_list
  elsif user_input == 'X'
    puts "Goodbye!"
    sleep(1)
    Exit
  else
    puts 'Not a valid entry - hit enter to continue!'
    gets.chomp
    menu
  end
end

def new_list
  puts "Please enter the name of your new list:"
  user_input = gets.chomp.capitalize
  added_list = List.new(user_input,1)
  puts ""
  puts "#{added_list.name} added to database!"
  puts ""
  puts "Press A to add new task or hit enter to return to main-menu"
  choice = gets.chomp.upcase
  if choice == 'A'
    add_task(added_list)
  else
    added_list.save
    menu
  end
end

def add_task(list)
  puts "Please enter the name of your new task:"
  user_input = gets.chomp.capitalize
  new_task = Task.new(user_input, list.id)
  new_task.save
  puts ""
  puts "Task added!"
  puts ""
  puts "Press A to add new task or hit enter to return to main-menu"
  user_input = gets.chomp.upcase
  if user_input == 'A'
    add_task(list)
  else
    list.save
    menu
  end
end

def show_list
  List.all.each_with_index do |list, index|
    puts "#{index + 1}. #{list.name}"
  end
  puts ""
  puts "Enter the number of the list you wish to open:"
  number_input = gets.chomp.to_i
  List.all.each do |list|
    # if list.name ==
  end
  p temp
  p Task.all
end

def show_tasks
  Task.all.each_with_index do |task, index|
    puts "#{index + 1}. #{task.name}"
  end
  puts ""
  puts "Hit enter to return to menu"
  gets.chomp
  menu
end

def edit_list

end

welcome
