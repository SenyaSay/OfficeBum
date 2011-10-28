module PhoneValidation
  def self.included(base)
    base.send :before_validation, :transform_phone_number
    base.send :validates, :phone, :format => /^\d{10}$/, :message => 'phone must have 10 digits', :allow_blank => true
  end

  protected
  def transform_phone_number
    self.phone.gsub!(/\D+/, '') if self.phone
  end

end