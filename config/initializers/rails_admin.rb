RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin?
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # Navigation
  config.included_models = ['User', 'Post', 'Event', 'Video', 'Game']

  # Users
  config.model 'User' do
    list do
      field :username
      field :email
      field :about
      field :avatar
      field :cover
    end

    show do
      field :username
      field :email
      field :about
      field :avatar
      field :cover
      field :sex
      field :slug

      field :posts
      field :events
      field :videos

      field :sign_in_count
      field :current_sign_in_ip
      field :last_sign_in_ip
      field :confirmed_at
    end

    edit do
      field :username
      field :email
      field :about
      field :avatar
      field :cover
      field :slug
    end
  end

  # Posts
  config.model 'Post' do
    list do
      field :user
      field :content
      field :attachment
      field :created_at
      field :cached_votes_up
      field :comments_count
    end

    show do
      field :user
      field :content
      field :attachment
      field :created_at
      field :cached_votes_up
      field :comments_count
    end

    edit do
      field :content
      field :attachment
    end
  end

  # Events
  config.model 'Event' do
    list do
      field :user
      field :name
      field :when
      field :created_at
      field :cached_votes_up
      field :comments_count
    end

    show do
      field :user
      field :name
      field :when
      field :cached_votes_up
      field :comments_count
    end

    edit do
      field :name
      field :when
    end
  end

  # Videos
  config.model 'Video' do
    list do
      field :user
      field :description
      field :attachment
      field :created_at
      field :cached_votes_up
      field :comments_count
    end

    show do
      field :user
      field :description
      field :attachment
      field :cached_votes_up
      field :comments_count
    end

    edit do
      field :description
      field :attachment
    end
  end

  # Games
  config.model 'Game' do
    list do
      field :title
      field :developer
      field :publisher
      field :release_date
    end

    show do
      field :title
      field :developer
      field :publisher
      field :platform
      field :webpage
      field :genre
      field :release_date
      field :logo
      field :cover
    end

    edit do
      field :title
      field :developer
      field :publisher
      field :platform
      field :webpage
      field :genre
      field :release_date
      field :logo
      field :cover
    end
  end
end
