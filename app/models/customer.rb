class Customer < ApplicationRecord
  # Add ActiveStorage for image upload
  has_one_attached :profile_image

  # Validations
  validates :full_name, presence: true
  validates :email_address,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: 'must be a valid email address'
            },
            allow_blank: true

  # Scope for finding customers without email
  scope :missing_email, -> { where(email_address: [nil, '']) }

  # Add these two methods for Ransack
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email_address", "full_name", "id", "notes", "phone_number", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["profile_image_attachment", "profile_image_blob"]
  end
end