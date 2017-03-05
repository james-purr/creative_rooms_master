class HomeownerValidator < ActiveModel::Validations
  def validate_each(record, attribute, parameters)
  	user = User.find(attribute)
    if !user.has_role? "Homeowner"
      record.errors[attribute] << "Artist can't be property owner"
    end
  end
end