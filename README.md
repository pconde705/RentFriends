<h1 align="center"> RentFriends </h1> <br>
<p align="center">
  <a href="https://airbnb-pconde705.herokuapp.com">
    <img alt="RentFriends" title="RentFriends" src="https://res.cloudinary.com/lopopoa2/image/upload/v1515311948/Screen_Shot_2018-01-06_at_11.57.42_PM_s01a94.png" >
  </a>
</p>

<p align="center">
  Welcome to RentFriends, an AirBnb inspired web application written primarily with jQuery for the frontend and Ruby on Rails for the backend. Styling with CSS and BootStrap.
</p>

## Table of Contents

- [Introduction](#introduction)
- [Become a Friend](#become-a-friend)
- ["Friend" Profile](#friend-profile)
- [Search](#search)
- [Dashboard](#dashboard)


## Introduction

In [RentFriends](https://airbnb-pconde705.herokuapp.com) users can sign up for an account, which allows them to rent a "Friend" for a specified amount of time if the "Friend" agrees. You can search "Friends" based on price and location to match what you are looking for. You can also become a "Friend" by entering information about where you are located and what you can offer, which creates a profile page for others to see and interact with.

Features:

* View all available "Friends" for hire
* View a "Friend" individually
* Become a "Friend" with your own stipulations
* Request a "Friend" for a specific period of time
* Reject or Accept incoming requests to rent you as a "Friend"
* Search for a "Friend" by city and max price

## Become a Friend

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1515313512/Screen_Shot_2018-01-07_at_12.24.47_AM_znymcl.png">
</p>

To become a friend simply click on the button in the navbar that will always be available allowing for ease of access. Upon completion of each input field the form will redirect you to your profile page that you just created. Everything you need to become a "Friend" is on that one page further emphasizing ease of usability. The address bar will automatically provide you with a google maps rendering of where you are located.

## "Friend" Profile

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1515363954/Screen_Shot_2018-01-07_at_2.25.26_PM_upothp.png" >
</p>
<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1515364296/Screen_Shot_2018-01-07_at_2.31.07_PM_lseeds.png" >
</p>

In the profile page of a "Friend" you can read the description of the activities the "Friend" is suggesting, as well as the cost they have specified for your activities together. Here you will also discover a google maps rendering of where you would be hanging out together.

## Search

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1515364979/Screen_Shot_2018-01-07_at_2.41.49_PM_fyoqw0.png" >
</p>

A simple search function exists in the center of the home page that allows you to narrow your search. Here you can specify your city of choice, and your current budget, allowing RentFriends to filter options better suited for you.

## Dashboard

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1515364982/Screen_Shot_2018-01-07_at_2.36.45_PM_tm16sy.png" >
</p>

In your dashboard, you can see your outgoing friend requests. The current status, be it pending, rejected, or accepted will be determined based on the responses made to the "Friend" you requested. Likewise if someone has requested you as a "Friend" to rent, their information will be made available on the Incoming Requests tab, allowing you to reject or accept. The Home tab will display your history and if you have any ongoing rentals.

```ruby
<% if m.status == "pending" %>

    <div class="col-xs-8 col-sm-6">
      <p><strong><%= m.user.first_name %></strong> requested to be RentFriends with you</p>
      <p><strong>Start Date:</strong> <%= m.start_date %></p>
      <p><strong>End Date:</strong> <%= m.end_date %></p>
      <br>
    </div>

    <div class="col-xs-8 col-sm-6">
      <div class="btn_accept_reject">
        <%= link_to match_accept_path(m) do %>
      <p><button type="submit" class="btn btn-default btn-small">Accept</button>
      <% end %>
      <%= link_to offer_match_path(m.offer, m), method: :delete do %>
      <button type="submit" class="btn btn-default btn-small">Reject</button></p>
      <% end %>
      </div>
    </div>
<% end %>
```
