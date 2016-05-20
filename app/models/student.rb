class Student < ApplicationRecord
  validates :name, presence: true
  validates :class_number, uniqueness: true

  before_create do |student|
    student.api_key = student.generate_api_key
  end

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless Student.exists?(api_key: token)
    end
  end
end
