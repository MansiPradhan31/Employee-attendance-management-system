class UserSerializer < ActiveModel::Serializer
  attributes :id, :role, :email, :name

  has_many :employees
  def name
    "#{self.object.first_name} - #{self.object.last_name}"
  end
end
