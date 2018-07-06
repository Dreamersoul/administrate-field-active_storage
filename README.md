# Administrate::Field::ActiveStorage
![rails](https://img.shields.io/badge/rails-%3E%3D5.2.0-red.svg)
## Things To Know:
- currently the gem only works for `has_one_attached` support for `has_many_attached` will be added in a future release.
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

Use:
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

## Things To Do:

- [x] upload single file
- [x] adding image support through url_for to support 3rd party cloud storage
- [x] use html 5 video element for video files
- [x] use html audio element for audio files
- [x] download link to other files
- [x] preview videos
- [x] preview pdfs
- [ ] preview office files as pictures
- [ ] upload multiple files

## Contribution guide:
1. contributers are welcome (code, suggestions, and bugs).
2. please document your code.
3. add your name to the `contribute.md`.

    please note that this is my first gem :) i might have gotten some stuff wrong PR's are always welcome
---
Based on the [Administrate::Field::Image](https://github.com/thoughtbot/administrate-field-image) template, and inspired by [Administrate::Field::Paperclip](https://github.com/picandocodigo/administrate-field-paperclip).

