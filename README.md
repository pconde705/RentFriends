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
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1515364979/Screen_Shot_2018-01-07_at_2.41.49_PM_fyoqw0.png" >
</p>

Live statistics showcase the current date, how many ongoing projects currently exist, how many backers RentFriends has, and how many projects have been successfully funded.

The stats page was the final thing added to the app that took the most time and effort. Not all aspects were challenging, but when it came to calculating the projects that had been funded, using the columns created in my table, required ruby methods performing calculations on the backend and a triple Full Outer Join written as a SQL query in Active Record.

```ruby
  def total_amount_raised
    first_value = project_backers.where('cash_only != 0').sum(:cash_only)
    second_value = reward_backers.sum(:amount)
    first_value + second_value
  end

  def total_number_of_backers
    user_backers.uniq.count
  end

  def self.all_projects
    Project.all.count
  end

  def self.all_funded_projects
    result = ActiveRecord::Base.connection.execute(<<-SQL)
      SELECT
        projects.id
      FROM
        projects
      FULL OUTER JOIN project_backers AS reward_backers ON reward_backers.project_id = projects.id
      FULL OUTER JOIN rewards ON reward_backers.reward_id = rewards.id
      FULL OUTER JOIN project_backers AS cash_backers ON cash_backers.project_id = projects.id
      GROUP BY
        projects.id
      HAVING
        sum(cash_backers.cash_only + rewards.amount) > projects.goal
    SQL
    result.count
  end
```

In order to correctly calculate whether the total amount had exceeded the initial goal the user had stated for that project, required a table keeping track of three things.

The data from the rewards table that kept track of the amounts each specific reward offered, the data from the project_backers table that kept track of any freely inputed cash amount to be donated, and the total_amount_raised (see method above) that calculates how much each specific project had already raised based on the two previous data inputs.

The total_amount_raised was thus a necessary creation that overwrote the initial money_raised column that existed in the projects table.
