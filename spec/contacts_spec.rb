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

  describe('.all') do
    it('is empty at first') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it("empties out all of the saved contacts") do
      Contact.new({:first_name =>"Brian", :last_name => "Lau", :company => "Epicodus", :job_title => "Student", :email => "blau08@gmail.com", :phone_number => "5037208554", :phone_type => "Cell", :street_address => "10336 SE Quail Ridge Dr", :city => "Happy Valley", :state => "OR", :zip_code => "97086", :building_type => "Home"}).save()
    Contact.clear()
    expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('adds a contact to the array of saved contacts') do
      test_contact = Contact.new({:first_name =>"Brian", :last_name => "Lau", :company => "Epicodus", :job_title => "Student", :email => "blau08@gmail.com", :phone_number => "5037208554", :phone_type => "Cell", :street_address => "10336 SE Quail Ridge Dr", :city => "Happy Valley", :state => "OR", :zip_code => "97086", :building_type => "Home"}).save()
      expect(Contact.all()).to(eq(test_contact))
    end
  end
end
