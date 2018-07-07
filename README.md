# Administrate::Field::ActiveStorage
![rails](https://img.shields.io/badge/rails-%3E%3D5.2.0-red.svg)
## Things To Know:
- to preview pdf files you need to install `mupdf` or `Poppler`.
- to preview video files you need to install `ffmpeg`.

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
assuming your modelname is `Model` and field name is `attachment`
```ruby
class ModelDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachment: Field::ActiveStorage,
  }
# ...
```
Then add `:attachment` to `FORM_ATTRIBUTES` and `SHOW_PAGE_ATTRIBUTES`.
currently adding `:attachment` `COLLECTION_ATTRIBUTES` will work but will probably look too big.

### `has_many_attached`:
assuming your modelname is `Model` and field name is `attachments`
the processs is identical the only issue is that the form field isn't being permitted, in order to permit it we apply the following method to the dashboard:

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
i know it is not ideal, if you have a workaround please submit a PR

### url_only
only the following needs to change in order for the feild to be url_only
```ruby
class ModelDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachments: Field::ActiveStorage.with_options({url_only: true}),
    # ...
  }
  # ...
end
```
## Things To Do:

- [x] upload single file
- [x] adding image support through url_for to support 3rd party cloud storage
- [x] use html 5 video element for video files
- [x] use html audio element for audio files
- [x] download link to other files
- [x] preview videos
- [x] preview pdfs
- [x] upload multiple files
- [ ] find a way to delete attachments
- [ ] preview office files as pictures

## Contribution guide:
1. contributers are welcome (code, suggestions, and bugs).
2. please document your code.
3. add your name to the `contribute.md`.

    please note that this is my first gem :) i might have gotten some stuff wrong PR's are always welcome
---
Based on the [Administrate::Field::Image](https://github.com/thoughtbot/administrate-field-image) template, and inspired by [Administrate::Field::Paperclip](https://github.com/picandocodigo/administrate-field-paperclip).

