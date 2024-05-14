ActiveAdmin.register Error do
  permit_params :user_id, :error, :content, :today
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :error, :content, :user_id, :today
  #
  # or
  #
  # permit_params do
  #   permitted = [:error, :content, :user_id, :today]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
