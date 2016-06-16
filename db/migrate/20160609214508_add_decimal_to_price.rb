class AddDecimalToPrice < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.change :price, :decimal, :precision => 5, :scale => 2
    end
  end
end
