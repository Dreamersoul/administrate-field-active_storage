# Administrate::Field::ActiveStorage
![rails](https://img.shields.io/badge/rails-%3E%3D5.2.0-red.svg)

## Things To Know:
- To preview pdf files you need to install `mupdf` or `Poppler`.
- To preview video files you need to install `ffmpeg`.

## How To Use:
Add `administrate-field-active_storage` to your Gemfile:

```ruby
gem 'administrate-field-active_storage'
```

Install:

```
$ bundle install
```

### `has_one_attached`:
Assuming your model name is `Model` and field name is `attachment`
```ruby
class ModelDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachment: Field::ActiveStorage,
  }
# ...
```
Then add `:attachment` to `FORM_ATTRIBUTES` and `SHOW_PAGE_ATTRIBUTES`.
Adding `:attachment` `COLLECTION_ATTRIBUTES` will work but will probably look too big.

### `has_many_attached`:
Assuming your model name is `Model` and field name is `attachments` the process is identical the only issue is that the form field isn't being permitted, in order to permit it we apply the following method to the dashboard:

```ruby
class ModelDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachments: Field::ActiveStorage,
  }

  # ...
  FORM_ATTRIBUTES = {
    #...
    :attachments
  }

  # permitted for has_many_attached
  def permitted_attributes
    super + [:attachments => []]
  end
```
I know it is not ideal, if you have a workaround please submit a PR.

### Prevent N+1 queries
In order to prevent N+1 queries from active storage you have to modify your admin model controller, below an example for a model called `User` and with attached avatars
```ruby
module Admin
  class UsersController < Admin::ApplicationController
    def index
      super
      @resources = User.with_attached_avatars.
        page(params[:page]).
        per(10)
    end
  end
end

```

### Removing/Deleting an Attachment
In order to allow the user to delete an attachment using the admin dashboard you need to do the following:
1. create a controller action with a `delete` route
2. point the `Field::ActiveStorage` field to that route

here is an example (send the route name as a symbol):
```ruby
class ModelDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachment: Field::ActiveStorage.with_options({destroy_path: :custom_active_storage_destroy_path}),
  }
# ...
```
Your `routes.rb` file must point to a controller action with method `delete` which should contain the following piece of code (you can modify to your own liking).
**FOR SECURITY REASONS** please check if the current user is allowed to remove such file
```ruby
  def remove_attachment
    attachment = ActiveStorage::Attachment.find(params[:attachment_id])
    attachment.purge
    redirect_back(fallback_location: "/")
  end
```

### url_only
Only the following needs to change in order for the field to be url_only
```ruby
class ModelDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachments: Field::ActiveStorage.with_options({url_only: true}),
    # ...
  }
  # ...
end
```

### show_in_index
This will preview thumbnails in the index page and if you're using `has_many` it will show the first one as a thumbnail and a count of the total attached files
```ruby
class ModelDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachments: Field::ActiveStorage.with_options({show_in_index: true}),
    # ...
  }
  # ...
end
```

## show_preview_size
Supply the size of the image preview inside the show page check out the mini_magic documentation for resize
```ruby
class ModelDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachments: Field::ActiveStorage.with_options({show_preview_size:  '150x200>'}),
    # ...
  }
  # ...
end
### direct_upload
If you want to upload directly from the browser to the cloud you can use direct_upload
```ruby
class ModelDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachments: Field::ActiveStorage.with_options({direct_upload: true}),
    # ...
  }
  # ...
end
```

Don't forget to include [ActiveStorage JavaScript](https://edgeguides.rubyonrails.org/active_storage_overview.html#direct-uploads). You can use `rails generate administrate:assets:javascripts` to be able to customize Administrate JavaScripts in your application.

## Things To Do:
- [x] upload single file
- [x] adding image support through url_for to support 3rd party cloud storage
- [x] use html 5 video element for video files
- [x] use html audio element for audio files
- [x] download link to other files
- [x] preview videos
- [x] preview pdfs
- [x] upload multiple files
- [x] find a way to delete attachments
- [ ] preview office files as pictures

## Contribution Guide:
1. contributers are welcome (code, suggestions, and bugs).
2. please document your code.
3. add your name to the `contribute.md`.

Please note that this is my first gem :) i might have gotten some stuff wrong PR's are always welcome.

---
Based on the [Administrate::Field::Image](https://github.com/thoughtbot/administrate-field-image) template, and inspired by [Administrate::Field::Paperclip](https://github.com/picandocodigo/administrate-field-paperclip).
