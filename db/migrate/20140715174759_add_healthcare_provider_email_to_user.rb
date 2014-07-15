class AddHealthcareProviderEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :healthcare_provider_email, :string
  end
end
