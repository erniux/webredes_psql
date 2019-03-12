# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Campos de Registros
      t.string :nombre
      t.string :appaterno
      t.string :appaterno
      t.string :rfc
  		t.string :razon_social
  		t.string :domicilio_fiscal
  		t.string :domicilio_fisico
  		t.string :sucursal
  		t.string :telefono_oficina
  		t.string :nombre_enlace
  		t.string :appaterno_enlace
  		t.string :apmaterno_enlace
  		t.string :cargo_enlace
  		t.string :correo_enlace
  		t.string :cargo_enlace
      t.string :telefono_enlace


      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
       t.integer  :sign_in_count, default: 0, null: false
       t.datetime :current_sign_in_at
       t.datetime :last_sign_in_at
       t.inet     :current_sign_in_ip
       t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
