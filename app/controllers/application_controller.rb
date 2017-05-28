class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  Rails.application.routes.default_url_options[:port]= 3000 if Rails.env.development?

  helper_method :current_user, :logged_user?, :admin?, :check_edit_permission?

  protected

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = session[:user_id] && User.find(session[:user_id])
  end

  def logged_user?
    if !current_user
      return false 
    end
    return true
  end

  def admin?
    if current_user&.is_admin
      return true
    end
    return false
  end
  

  def authenticated_admin?
    if not current_user&.is_admin
      flash[:alert] = "Permission denied"
      redirect_to root_path
      return false 
    end
    return true
  end

  def authenticated_login?
    if not current_user
      flash[:alert] = "You must be logged in to do this action"
      redirect_to new_sessions_path
      return false 
    end
    return true
  end

  def has_edit_permission?(entity)
    if logged_user? and (admin? or current_user&.id == entity.user_id)
      return true
    end
    flash[:alert] = "Permission denied"
    redirect_to root_path
    return false
  end

  def check_edit_permission?(entity)
    if logged_user? and (admin? or current_user&.id == entity.user_id)
      return true
    end
    return false
  end

  def category_tree
    categories = Category.where(parent_id: nil).map{|x| [x,1]}
    i = 0
    while i<categories.length
      category, depth = categories[i]
      for child in category.children
        categories.insert(i+1, [child, depth+1])
      end
      i+=1
    end
    categories
  end

  def category_tree_hashmap_version
    parent_categories = Category.where(parent_id: nil).map{|x| [x,{}]}.to_h
    tree = {base: parent_categories}
    extend_category_tree(tree[:base])
    p tree
    tree
  end

  def extend_category_tree(dic)
    dic.each do |category,_|
      subtree = category.children.map{|x| [x,{}]}.to_h
      extend_category_tree(subtree)
      dic[category] = subtree
    end
  end
end
