ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation
  actions :all, except: [:new, :create, :edit, :update]

  index do
    selectable_column
    column :name
    column :email
    column :sex
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :about
      row :sex
      row :location
      row :dob
      row :phone_number
      row :posts_count
      row :slug

      row :avatar do |user|
        image_tag user.avatar.url
      end
      row :cover do |user|
        image_tag user.cover.url
      end
    end
    active_admin_comments
  end

  action_item :view, only: :show do
    link_to 'View on site', user_path(user)
  end

  filter :name
  filter :email
  filter :created_at
  filter :updated_at

end