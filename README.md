# Administrate::Field::Image

A plugin to show image URLs in [Administrate].

This repository is the first field plugin extracted out of Administrate.
Although its structure may change,
it's designed to act as a template for other Administrate field plugins.

## FAQs

**Q: How should I name my gem?**

A: Administrate field gems must be named according to the [Rubygems naming guidelines].

Essentially, name your gem after the field class that it defines.
If there's a namespace in the class name, that gets translated to a dash (`-`) in the gem name.
If the class name is CamelCased, that translates to an underscore (`_`) in the gem name.

Since all administrate field gems are under the namespace `Administrate::Field`,
every field gem name should start with the prefix `administrate-field-`.

Here are some examples (these don't correspond to actual gems):

| Gem Name | Field Name |
|----------------------------|------------------------------|
| `administrate-field-image` | `Administrate::Field::Image` |
| `administrate-field-file_upload` | `Administrate::Field::FileUpload` |
| `administrate-field-geocoding-region` | `Administrate::Field::Geocoding::Region` |
| `administrate-field-geocoding-geo_json` | `Administrate::Field::Geocoding::GeoJson` |

[Rubygems naming guidelines]: http://guides.rubygems.org/name-your-gem/

[Administrate]: https://github.com/thoughtbot/administrate
