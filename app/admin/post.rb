ActiveAdmin.register Post do
  permit_params :content, :attachment
  actions :all, except: [:new]

  index do
    selectable_column
    column :user
    column :created_at
    column :updated_at
    column :cached_votes_up
    column :comments_count
    actions
  end

  show do
    attributes_table do
      row :content
      row :attachment do |post|
        image_tag post.attachment.url
      end
    end
    active_admin_comments
  end

  action_item :view, only: :show do
    link_to 'View on site', post_path(post)
  end

  filter :user
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :content
      f.input :attachment
    end
    f.actions
  end
end