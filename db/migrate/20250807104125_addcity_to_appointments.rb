class AddcityToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_reference :appointments, :city, foreign_key: true
  end
end
