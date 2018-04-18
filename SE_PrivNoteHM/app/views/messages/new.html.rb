<h1> Welcome to the cheap verson of privnote!</h1>

<%= form_tag("/messages", multipart: true) do %>
  <%= text_field_tag 'text' %>
  <%= submit_tag 'submit' %>

<% end %>
