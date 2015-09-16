# Nested Resources Practice App - A Ruby on Rails Web Application

  <img src="https://s3-us-west-2.amazonaws.com/yangportfoliobucket/layoutpics/headshot.jpg" width="200">

By [Matthew Yang](http://www.matthewgyang.com).

## Description

This application was a practice exercise for using nested resources in a Rails environment.  The main points of emphasis are on how the RESTful routes and Rails conventions work together and how to use them.

This app uses the example of `Teams` and `Players` for the resources.  The relationship is that a team is composed of players.  That is represented in the model as such;

**Team**
```ruby
class Team < ActiveRecord::Base
  has_many :players
end
```

**Player**
```ruby
class Player < ActiveRecord::Base
  belongs_to :team
end
```

Once that association is set up I set up a migration to add a `team_id` column to the `players` table.  Adding the `team:references` to the end of the migration also indexes the players in the database and designates player as a foreign key to team:

```console
rails g migration AddTeamIdToPlayers team:references
```

Finally, in `app/config/routes.rb` you designate the nested resource in order to create the correctly formatted routes/url's:

```ruby
resources :teams do
  resources :players
end
```

See the [Rails Guides](http://guides.rubyonrails.org/routing.html) for more information on nested resources/routing.
