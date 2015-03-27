require 'active_record'
require 'yaml'


# Define database class
class List < ActiveRecord::Base; end

config = YAML.load_file('./db.yml')

ActiveRecord::Base.establish_connection config['development']


ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'lists'
    create_table :lists do |t|
      t.column :user_name,   :string
      t.column :date_string, :string
    end
  end
end

# Create test data
if List.all.size.zero?
  List.create(user_name: 'TestUser')
end
