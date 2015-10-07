require 'pry'
require_relative 'contact'
require_relative 'contact_database'

class ContactList 
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets


 
def self.add_contact
  puts "Enter new contact name: "
  name = get_input
  puts "Enter new contact email: "
  email = get_input
  if Contact.duplicate?(email)
        puts "Cannot add duplicate entry, must be unique"
    else

      end
  contact = Contact.create(name,email)
  puts "Added Name: #{name}"
  puts "Added Email: #{email}"


  # CSV.open('contacts.csv', 'a') do |csvfile|  
  #         csvfile << contact.to_a
  #     end
  #     id
  # puts_contact_details(to_a(contact))
  #   # puts CSV.create(name, email)
end

def self.to_a(contact)
  contact.each do |a, b|
    [a, b]
  end
end

def self.list_contacts
  list = Contact.all
  id = 1
  list.each do |contact|
    puts "#{id}: #{contact[0]}, #{contact[1]}"
    id += 1
  end
  puts "#{ContactDatabase.id} total lines/records"
end

def self.find_contact
  puts "Enter name or part of name to search for: "
      word = gets.chomp
      puts Contact.find(word)
end

def self.show_contact
  puts "Enter in ID: "
  input = gets.chomp
  id = input.match(/\d+/)[0]   
  id = id.to_i
  puts ContactDatabase.read_contact_id(id)
end

def self.get_input
  STDIN.gets.chomp
end

def self.first_menu
  puts "Here is a list of available commands: "
  puts "new  - Create a new contact"
  puts "list - List all contacts"
  puts "show - Show a contact"
  puts "find - Find a contact"
  puts "phone - Add a phone number"
  puts "quit - Quits!!!"
end

def self.first_menu_select(selection)
  case selection
    when "help" then first_menu
    when "new" then add_contact
    when "list" then list_contacts
    when "show" then show_contact
    when "find" then find_contact
    when "phone" then add_phone
    when "quit" then @quit = true
  end
end


def self.add_phone
  count = 0
  puts "You can add max. of 3 sepatate phone numbers)"
  while count < 4
    puts "Enter the ID you want to add a phone number. (Use 'list' to show IDs): "
    id = gets.chomp
    id = id.to_i
    puts "Add phone number: "
    number = gets.chomp
    ContactDatabase.add_phone_number(id, number)
    count += 1
  end
  gametime
end

  
# def self.puts_contact_details(contact)
#   contact.to_a
#   puts "Name: #{contact.name}"
#   puts "Email: #{contact.email}"
#   # puts "Phone number: #{contact.phone_numbers}"
# end



def self.gametime
  @quit = false
  while @quit!= true
    if get_input != "quit"
      first_menu
      selection = gets.chomp
      first_menu_select(selection)
    
    else
    break
    end
  end
end

end

ContactList.gametime




#