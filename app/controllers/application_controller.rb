class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    def hello
	render html: <nav class="navbar navbar-default mega-nav ">
    <div class="container">
    <div class="collapse navbar-collapse" id="MainMenu">
        <ul class="nav navbar-nav menu-list">
            <li><%= link_to('Home', destroy_user_session_path, :method => :delete)%></li>
            <li><a href="about">About</a></li>
            <li><a href="#">Contacts</a></li>
            <form  class="navbar-form navbar-right">
                <div class="input-group">
                        <%= form_tag(@post_path, method: :get) do %>
                            <%= text_field_tag :term, params[:term] %>
                            <%= submit_tag 'Search', title: nil %>
                        <% end %>
                </div>
            </form>
        </ul>
        <form class="navbar-form navbar-right">
            <ul class="nav navbar-nav menu-list">
                    <li class="dropdown list-category">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                             <i class="glyphicon glyphicon-user"></i> User <i class="fa fa-angle-down" aria-hidden="true"></i>
                        </a>
                        <ul class="dropdown-menu mega-dropdown-menu">
                            <li><a href="users/sign_in">Log In</a></li>
                            <% if user_signed_in? %>
                            <li><a href="#">Change Password</a></li>
                            <li><a href="users/sign_up">Register</a></li>
                            <li><%= link_to "New Post", new_post_path %></a></li>
                            <li role="separator" class="divider"></li>
                            <li><%= link_to('Log Out', destroy_user_session_path, :method => :delete)%></li>
                            <% end %>
                        </ul>
                    </li>
                </ul> 
            </ul>
        </form>
    </div>
</div>
</nav>
    end
end
