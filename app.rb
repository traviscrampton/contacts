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
