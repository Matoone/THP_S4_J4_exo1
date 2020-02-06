class CreateJoinTableDoctorSpeciality < ActiveRecord::Migration[5.2]
  def change
    create_join_table :doctors, :specialities
  end
end
