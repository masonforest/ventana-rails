Ventana
------

Ventana is a lightweight rails content management system. It allows the developer to specify small blocks of unstructured editable content. This is helpful for landing pages and small blocks for unstructured copy text. If you need a full content management system you should use other [content management systems for rails](https://www.ruby-toolbox.com/categories/content_management_systems). If you are looking for a solution to easily manager your application code use [copycopter](https://github.com/thoughtbot/copycopter)


Installation
-----------
Ventana is distributed as a gem, which is how it should be used in your app.

Include the gem in your Gemfile:

    gem 'ventana', git: 'git://github.com/thoughtbot/ventana.git'

Then run

    rake ventana:install:migrations
    rake db:migrate

Finally add the following to you config/routes.rb

    mount Ventana::Engine => "/ventana"

Quick Start
-----------

In user model:

Define can_edit? on your user model which will desigate who is allowed to edit ventana content blocks

```ruby
class User < ActiveRecord::Base
  def can_edit?
    id == 1
  end
end
```

In a view:

    <%= editable_content_for(:about_page, type: :markdown) %>

Next login as a user who is allowed to edit that block and you should see and edit link where this block was rendered. Click "Edit" and it will bring you to the vetana edit page.

In context editing using javascript
---

See [ventana-example](http://www.github.com/thoughtbot/ventana-example) for how to setup incontext javascript editing


Credits
-------


![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

ventana is maintained and funded by [thoughtbot, inc](http://thoughtbot.com/community)

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

License
-------

ventana is Copyright © 2008-2012 Mason Fischer and thoughtbot. It is free software, and may be redistributed under the terms specified in the LICENSE file.
