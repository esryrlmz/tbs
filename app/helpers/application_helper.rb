module ApplicationHelper
  BOOTSTRAP_FLASH_MSG = {
   success: 'alert-success',
   error: 'alert-danger',
   alert: 'alert-warning',
   notice: 'alert-info'
 }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG[flash_type.to_sym]
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert flash #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # Fotoğrafı varmı, yokmu? kontrolü
  # def has_club_logo_or_not(club, width=50, height=50)
  #   if club.logo.present?
  #     image_tag(club.logo, :width => width, :height => height)
  #   else
  #     image_tag('omu_logo.png', :width => width, :height => height)
  #   end
  # end

  # Fotoğrafı varmı, yokmu? kontrolü
  def has_club_logo_or_not(club, size="50x50", opts={})
    o = {class: ""}.merge(opts)

    if club.logo.present?
      image_tag(club.logo, size: size, :class => o[:class])
    else
      placeholder_club_logo(size)
    end

  end

  # Fotoğrafı yoksa gösterilecek imaj
  def placeholder_club_logo(size)
    image_tag("club_placeholder.png", alt: "club-placeholder", size: size)
  end

  # Fotoğrafı varmı, yokmu? kontrolü
  def has_avatar_or_not(user, width, height, style_opts={}, class_opts={})
    class_o = {class: ""}.merge(class_opts)
    style_o = {style: ""}.merge(style_opts)

    if user.present? && user.image.present?
      image_tag(user.image, :width => width, :height => height, :class => class_o[:class], :style => style_o[:style])
    else
      placeholder_avatar(width, height)
    end

  end

  # Fotoğrafı yoksa gösterilecek imaj
  def placeholder_avatar(width, height)
    image_tag("avatar_placeholder.png", alt: "avatar-placeholder", :width => width, :height => height)
  end

end
