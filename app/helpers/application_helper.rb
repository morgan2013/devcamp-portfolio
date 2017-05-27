module ApplicationHelper
  def login_helper class_style='nav-link'
    if !current_user.is_a? GuestUser
      link_to 'Logout', destroy_user_session_path, method: :delete, class: class_style
    else
      (link_to 'Register', new_user_registration_path, class: class_style) +
      ' '.html_safe +
      (link_to 'Login', new_user_session_path, class: class_style )
    end
  end


  def source_helper
    if session[:source]
      content_tag :p, "Thanks for visiting me from #{session[:source]}"
    end
  end

  def copyright_generator
    DevcampMorganViewTool::Renderer.copyright 'Jordan Hudgens', 'All rights reserved'
  end

  def nav_helper style, tag_type
    [{title: ' Home ', href:root_path },{title: ' About ', href:about_path},
     {title: ' Contact ', href:contact_path},{title: ' Blogs ', href:blogs_path},
     {title: ' Portfolio ', href:portfolios_path} ].map  do |item|
       content_tag(tag_type,  link_to(item[:title], item[:href], class: [style, active?(item[:href])]))
     end.inject(''){|str, i| str+= " #{i} "}.html_safe
  end

  def active? path
    'active' if current_page? path
  end
end
