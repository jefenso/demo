ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :name
    column :role
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :role
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
