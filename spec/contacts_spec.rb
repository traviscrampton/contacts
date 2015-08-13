require('rspec')
require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#first_name') do
    it('returns the first name of a contact') do
      test_contact = Contact.new({:first_name =>"Brian", :last_name => "Lau", :company => "Epicodus", :job_title => "Student", :email => "blau08@gmail.com", :phone_number => "5037208554", :phone_type => "Cell", :street_address => "10336 SE Quail Ridge Dr", :city => "Happy Valley", :state => "OR", :zip_code => "97086", :building_type => "Home"})
      expect(test_contact.first_name()).to(eq("Brian"))
    end
  end
end
