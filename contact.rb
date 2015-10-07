

class Contact
 
  attr_accessor :name, :email
  # :phone_numbers

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    # @phone_numbers = phone_numbers

  end
 
  # def to_s
  #   # TODO: return string representation of Contact
  #   csv_string = CSV.parse do |csv|
  #     csv.to_s
  #   end
  # end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      # csv_arr = CSV.parse("CSV,data,String")
      contact = Contact.new(name,email)
      ContactDatabase.add_contact(contact)
      # CSV.open("contacts.csv", "a") do |csv|
      #   csv << [name, email]
      
    end
 
    def find(word)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      contact = []
      contact = ContactDatabase.find(word)
      return "The record: #{contact[0]}, #{contact[1]} returns"
    end

    def duplicate?(email)
      contacts = []
      contacts = ContactDatabase.read_csv
      contacts.each do |contact|
        return true if contact[1].to_s == email
      end
      false
    end

 # TODO: Return the list of contacts, as is
    def all
      list = []
      list = ContactDatabase.read_csv
      list
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      ContactDatabase.read_csv(id)
    end
    
  end
 
end