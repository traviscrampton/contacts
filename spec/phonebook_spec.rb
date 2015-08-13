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
  describe('#id') do
    it("returns the id of the phonebook") do
      test_phonebook = Phonebook.new({:name =>"Travis"})
      expect(test_phonebook.id()).to(eq(1))
    end
  end
  describe('.all') do
    it('is empty at first') do
      expect(Phonebook.all()).to(eq([]))
    end
  end
  describe('#clear') do
    it('empties out all of the saved phonebooks') do
      Phonebook.new({:name => "Travis"}).save()
      Phonebook.clear()
      expect(Phonebook.all()).to(eq([]))
    end
  end
  describe('#contacts') do
    it("initially returns an empty array of contacts for the phonebook") do
      test_phonebook = Phonebook.new({:name =>"Travis"})
      expect(test_phonebook.contacts()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds a phonebook to the array of saved phonebooks") do
      test_phonebook = Phonebook.new({:name =>"Travis"})
      test_phonebook.save()
      expect(Phonebook.all()).to(eq([test_phonebook]))
    end
  end
  describe(".find") do
    it("returns a phonebook by its id number") do
      test_phonebook = Phonebook.new({:name =>"Travis"})
      test_phonebook.save()
      test_phonebook2 = Phonebook.new({:name =>"Brian"})
      test_phonebook2.save()
      expect(Phonebook.find(test_phonebook.id())).to(eq(test_phonebook))
    end
  end
end
