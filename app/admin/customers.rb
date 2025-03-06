ActiveAdmin.register Customer do
  # Permit parameters for mass assignment
  permit_params :full_name, :phone_number, :email_address, :notes, :profile_image

  # Configure image upload
  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :profile_image, as: :file
    end
    f.actions
  end

  # Customize show view to display image
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :profile_image do |customer|
        image_tag customer.profile_image if customer.profile_image.attached?
      end
    end
  end
end