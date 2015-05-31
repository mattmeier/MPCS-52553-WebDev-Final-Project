<%= form_tag "/password_resets/#{@user.password_reset_token}", :method => 'patch' do %>

<% if @user.errors.any? %>
<div class="error_messages">
	<h2>Form is invalid</h2>
	<ul>
		<% for message in @user.errors.full_messages %>
		<li><%= message %></li>
		<% end %>
	</ul>
</div>
<% end %>

<div class="field">
	<%= label_tag :password %>
	<%= password_field_tag :password %>
</div>

<div class="field">
	<%= label_tag :password_confirmation %>
	<%= password_field_tag :password_confirmation %>
</div>

<input type="submit" name="commit" value="Change Password!">
<% end %>