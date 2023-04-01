<style>
img{max-width: 250px;margin-right: 10px;margin-bottom: 10px;}
#foo {color: red;}
</style>

# ollang_recipe

Flutter recipe search app using Edamam api.

<br />

## Demo

![My Image](https://lh4.googleusercontent.com/a4DQdUNkSwcDVuMYVtr-ogkSdffnzfsMU3oKH-oMCgRpZTZnmula7EnJdftPcclv7lo=w2400)
![My Image](https://lh5.googleusercontent.com/yYd81V2jcK_uqXhRTOMVCnJvNVmGWDt6vArQMxqd1K0AlgODZWn_C-e-B328-wtVX6c=w2400)
![My Image](https://lh4.googleusercontent.com/3Wbe7hq30Eo9FU2VNHg5v3QgRPyG_BqlfZvSOBkvGMqhPqEQwEFLYrfv0kW9Ilplg1M=w2400)
![My Image](https://lh3.googleusercontent.com/Fhio1br7tkaOaRk1WmiOm6o3VlTz_WZZmqSBfV87bpHGOk_QyTxbGwy365jOvnB0Cm8=w2400)
![My Image](https://lh6.googleusercontent.com/ucOUh6xrXYsZmIEMyejjIQ7RstBkT5nEsqzehdfxe_uSTDre54pEO8GdkMSBE19vRo8=w2400)
![My Image](https://lh5.googleusercontent.com/zaE6BDc3dqZiOyz_7q5WV8g940lhnnLhc3ZtUF6t9h-AXnN6a3bem9QF6r_eE8PQorQ=w2400)
![My Image](https://lh4.googleusercontent.com/qEbm8aJMPpp4YX2G-04LXu7XHvhHloJsS6M2y7r0PaDN-7e4gFcGSVCk2Rtu8apDZkE=w2400)
![My Image](https://lh5.googleusercontent.com/Nojwd2ICf7on_arzzi-0BSnkOi2RiwEiQI234c6W6XaJYkfKGcTxXctr0f9-nsvXshE=w2400)

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
