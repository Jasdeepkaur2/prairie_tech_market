class MakeProvinceIdNullableOnUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_null :users, :province_id, true
  end
end
