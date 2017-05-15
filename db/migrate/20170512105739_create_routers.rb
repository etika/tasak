class CreateRouters < ActiveRecord::Migration[5.0]
  def change
    execute 'CREATE EXTENSION "uuid-ossp" SCHEMA public'

    create_table :routers, id: :uuid do |t|
      t.string :name
      t.string :location
      t.timestamps
    end
  end
end
