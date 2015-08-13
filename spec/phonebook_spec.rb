require('rspec')
require('phonebook')

describe(Phonebook) do
  before() do
    Phonebook.clear()
  end
  describe("#name") do
    it('returns the name of the individuals phonebook') do
      test_phonebook = Phonebook.new({:name =>"Trav's Contacts"})
      expect(test_phonebook.name()).to(eq("Trav's Contacts"))
    end
  end
end
