require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/phonebook')

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
  name = params.fetch('name')
  Phonebook.new(name).save()
  @phonebooks = Phonebook.all()
  erb(:success)
end

get('contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  @first_name = @Contacts.first_name()
  @last_name = @Contacts.last_name()
  @company = @Contacts.company()
  @job_title = @Contacts.job_title()
  @email = @Contacts.email()
  @phone_number = @Contacts.phone_number()
  @phone_type = @Contacts.phone_type()
  @street_address = @Contacts.street_address()
  @city = @Contacts.city()
  @state = @Contacts.state()
  @zip_code = @Contacts.zip_code()
  @building_type = @Contacts.building_type()
  erb(:contact)
end
