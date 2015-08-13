require('pry')

class Phonebook
  attr_reader(:name)
  @@phonebooks = []

  define_method(:initialize) do |attributes|
    # binding.pry
    @name = attributes.fetch(:name)
    @id = @@phonebooks.length().+1
    @contacts=[]
  end

  define_method(:contacts) do
    @contacts
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@phonebooks
  end

  define_method(:save) do
    @@phonebooks.push(self)
  end

  define_singleton_method(:clear) do
    @@phonebooks = []
  end

  define_singleton_method(:find) do |id|
    found_phonebook = nil
    @@phonebooks.each() do |phonebook|
      if phonebook.id().eql?(id)
        found_phonebook = phonebook
      end
    end
    found_phonebook
  end
end
