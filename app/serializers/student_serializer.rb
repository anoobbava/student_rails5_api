class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :class_name, :age, :dob, :class_number
end
