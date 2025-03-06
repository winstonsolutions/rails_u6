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
end