
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end


class User < ActiveRecord::Base
		validates :name1, presence: {message: "El primer nombre es obligarorio"}
		validates :name1, length: {
			minimum: 2,
			message: "La primer nombre debe tener minimo 2 caracteres"
		}
		validates :lastname1, presence: {message: "El primer apellido es obligarorio"}
		validates :lastname1, length: {
			minimum: 2,
			message: "La primer apellido debe tener minimo 2 caracteres"
		}
		validates :email, presence: {message: "El Correo electronico es obligarorio"}
		validates :email, email: {message: "Ingrese un correo electronico valido"}
		validates :email, uniqueness: {message: "Ya existe una cuenta creada con este correo"}
		validates :phone, numericality: {
			allow_blank: true,
			message: "El campo telefono solo puede contener numeros"
		}
		validates :password, presence: {message: "La contraseña es obligaroria"}
		validates :password, length: {
			minimum: 8,
			message: "La contraseña debe tener minimo 8 caracteres",
			on: :create
		}
		validates :password, confirmation: {
			message: "Las contraseñas no coinciden",
			on: :create
		}
		validates :password_confirmation, presence: {message: "Por favor repita la contraseña"}
		validates :i_accept_terms_and_conditions, acceptance: { 
			accept: true,
			message: "Click en acepto terminos y condiciones"
		}

end
