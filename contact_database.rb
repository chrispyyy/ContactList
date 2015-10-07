## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

    def self.read_csv
      CSV.read('contacts.csv')
    end

    def self.read_contact_id(id)
      CSV.foreach('contacts.csv') do |line|
        return line if $. == id 
      end
    end

  def self.read_contacts
    @@all_contacts = []
    CSV.foreach('contacts.csv') do |row|
      @@all_contacts << row
      #turns it into an array
    end
    @@all_contacts
  end

  def self.add_contact(contact)
    
    CSV.open('contacts.csv', 'a') do |c|
      
      c << ["#{contact.name}", "#{contact.email}"]
      
      #   data << "#{number}"   , "#{contact.phonenumber}"
    end
  end

def self.add_phone_number(id, number)
  match = false
  contacts = read_csv
  contacts.each do |contact|
    if (id-1) == contacts.index(contact)
          contact.concat [number]
          match = true
        end
      end
  puts "Contact not found" unless match == true
      CSV.open('contacts.csv', 'w') do |file|
        contacts.each do |contact|
          file << contact
        end
    
  end
end


def self. find(word)
  CSV.foreach('contacts.csv') do |l|
    return l if l.to_s.downcase.include? word.downcase
  end
end

    # index
  def self.id
    index_lines = []
    CSV.foreach('contacts.csv') do |line|
      index_lines << $.
    end
    index_lines.last
  end
  

end
