require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/phonebook')
require('pry')

get('/') do
  erb(:index)
end

get('/phonebooks/new') do
  erb(:phonebooks_form)
end

get('/phonebooks') do
  @phonebooks = Phonebook.all()
  erb(:phonebooks)
end

post('/phonebooks') do
  name = params.fetch("name")
  Phonebook.new({:name => name}).save()
  @phonebooks = Phonebook.all()
  erb(:phonebooks)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())

  # @first_name = @Contacts.first_name()
  # @last_name = @Contacts.last_name()
  # @company = @Contacts.company()
  # @job_title = @Contacts.job_title()
  # @email = @Contacts.email()
  # @phone_number = @Contacts.phone_number()
  # @phone_type = @Contacts.phone_type()
  # @street_address = @Contacts.street_address()
  # @city = @Contacts.city()
  # @state = @Contacts.state()
  # @zip_code = @Contacts.zip_code()
  # @building_type = @Contacts.building_type()
  erb(:contact)
end

get('/phonebooks/:id') do
  @phonebook = Phonebook.find(params.fetch('id').to_i())
  erb(:phonebook)
end

get('/phonebooks/:id/contacts/new') do
  @phonebook = Phonebook.find(params.fetch('id').to_i())
  erb(:phonebook_contacts_form)
end

post('/contacts') do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  company = params.fetch("company")
  job_title = params.fetch("job_title")
  email = params.fetch("email")
  phone_number = params.fetch("phone_number")
  phone_type = params.fetch("phone_type")
  street_address = params.fetch("street_address")
  city = params.fetch("city")
  state = params.fetch("state")
  zip_code = params.fetch("zip_code")
  building_type = params.fetch("building_type")
  @phonebook = Phonebook.find(params.fetch('phonebook_id').to_i())
  @contact = Contact.new({:first_name => first_name, :last_name => last_name, :company => company, :job_title => job_title, :email => email, :phone_number => phone_number, :phone_type => phone_type, :street_address => street_address, :city => city, :state => state, :zip_code => zip_code, :building_type => building_type})
  @contact.save()
  #  @contacts = Contact.all()
  @phonebook.add_contact(@contact)
  erb(:contact)
end
