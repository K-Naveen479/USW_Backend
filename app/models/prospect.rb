class Prospect < ApplicationRecord
  SUBJECT_AREAS = ['Engineering', 'Computer Science', 'Mathematics', 'Physics'].freeze

  validates :full_name, :email, :date_of_birth, :subject_area, :gps_location, presence: true
end