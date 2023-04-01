<style>
img{max-width: 250px;margin-right: 10px;margin-bottom: 10px;}
#foo {color: red;}
</style>

# ollang_recipe

Flutter recipe search app using Edamam api.

<br />

## Demo

![My Image](/screenshots/favorite.gif)
![My Image](/screenshots/details.gif)
![My Image](/screenshots/filter.gif)
![My Image](/screenshots/history.gif)
![My Image](/screenshots/lazy_load.gif)
![My Image](/screenshots/random.gif)
![My Image](/screenshots/search.gif)
![My Image](/screenshots/theme.gif)

## Features

- Random recipe
- Filter recipes
- Search history
- Favorite recipes
- Swipe to delete favorite recipes
- Lazy load for search results
- Theme mode
- Search recipe with name or ingredients
- Share recipe

## Used Packages and Versions

**Packages:** get, hive, hive_flutter, http, lottie, cached_network_image

**Dart Version:** 2.19.6

**Flutter Version:** 3.7.9

<br />

## Used APIs

#### Get api schema from Edamam for getting available filters

```http
  GET https://api.edamam.com/doc/open-api/recipe-search-v2.json
```

#### Get search results from Edamam

```http
  GET https://api.edamam.com/api/recipes/v2
```
