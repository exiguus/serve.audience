# serve.audience
A presentation framework for frontend web developer. Build a static site with serve and grunt.

## Documentation

### Install

```console
cd src/
bundle install
npm install
```

Deep Dependencies: node/npm, ruby/bundle

### Development

```console
cd src/
bundle exec serve
```

### Build

```
./make-dist
```

### Environment
- ```src/``` serve environment
  - ```public/``` static files
    - ```img/``` images
      - ```src/``` image source for ```<picture>``` element and *images* grunt task (gif files won't be resized)
      - ```content/``` ```<img src="" />``` path
  - ```stylesheets/``` sass files
    - ```partials```
      - ```_base.scss``` font, color, background-color and other basic configurations
    - ```screen.scss``` breakpoints
  - ```views/``` data structure and html templates
    - ```view_helper.erb``` data
      - ```author()```
      - ```dict()```
      - ```project()```
      - ```categories()``` (each category item has a page, for example ```categories[{:id => "about"}]``` is mapped to ```about.html.erb```)
- ```dist/``` static presentation website
- ```make-dist``` (make dist from build: generate images for picture tag, serve export, combine, minify and prittfy CSS, JavaScript and HTML files)

### Presentation
An example Presentation with Dataset (Atom Frontend Development) is predefined. You may take a look on the online version https://exiguus.github.io/serve.audience/dist/ or the ```dist/``` folder.
#### Keybindings
- Home Page ```H```
- Next Page ```→```
- Prev Page ```←```
- Next Slide ```↓```
- Prev Slide ```↑```

#### touch Devices
- Extra Menu to navigate Pages and Slides

#### Browser support
Google Chrome 53+, Mozilla Firefox 49+, Internet Explorer 11+ and Safari 10+

presentation, present, powerpoint, browser presentation, web presentation, serve, sass, grunt, compass, static, framework, ruby