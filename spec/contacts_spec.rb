require('rspec')
require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#first_name') do
    it('returns the first name of a contact') do
      test_contact = Contact.new({:first_name => "Brian"})
      expect(test_contact.first_name()).to(eq("Brian"))
    end
  end
end
