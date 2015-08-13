class Contact
  attr_reader(:first_name, :last_name, :company, :job_title, :email, :phone_number, :phone_type, :street_address, :city, :state, :zip_code, :building_type)

  @@contacts = []

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @company = attributes.fetch(:company)
    @job_title = attributes.fetch(:job_title)
    @email = attributes.fetch(:email)
    @phone_number = attributes.fetch(:phone_number)
    @phone_type = attributes.fetch(:phone_type)
    @street_address = attributes.fetch(:street_address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip_code = attributes.fetch(:zip_code)
    @building_type = attributes.fetch(:building_type)
    @id = @@contacts.length().+1
  end

  define_method(:id) do
    @id
  end


  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end
end
