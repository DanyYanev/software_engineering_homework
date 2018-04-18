class CreateRsas < ActiveRecord::Migration[5.1]
  def change
    create_table :rsas do |t|
      t.string :mid
      t.string :message
      t.string :enc_message
      t.bigint :n
      t.bigint :e
      t.bigint :d

      t.timestamps
    end
  end
end
