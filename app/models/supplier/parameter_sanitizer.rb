class Supplier::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    permit(self.for(:sign_up) + [:name, :phone, :address])
  end

  def account_update
    permit(self.for(:account_update) + [:name, :phone, :address])
  end
end
