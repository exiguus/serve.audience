module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({

  pkg: grunt.file.readJSON('package.json'),

  //remove console log from code - but only for our js not from plugin - can make problems
  removelogging: {
    dist: {
      src: ['public/static/js/combined.min.js','html/static/js/combined.min.js']
    }
  },

  //combine js files
  concat: {
    options: {
    stripBanners: {
      separator: ';',
      block: true
    },
    process: true,
    banner: '/*! <%= pkg.name %> * <%= pkg.author %> * <%= grunt.template.today("yyyy-mm-dd HH:mm:ss") %> */'
    },
    dist: {
    src: [
        //-- browser fixes/enhancements
        'public/static/js/modernizr.custom.js',
        'public/static/js/jquery.min.js',
        'public/static/js/jquery.custom.js',
        'public/static/js/picturefill.js',
        //-- initialization
        'public/static/js/custom.js'
    ],
        dest: 'public/static/js/combined.js'
    }
  },

  //check js for errors, not all found errors are problems for running but making code smarter
  jshint: {
    options: {
    curly: false,
    eqeqeq: false,
    eqnull: true,
    browser: true,
    force: true,
    globals: {
      jQuery: true
    },
    },
    all: ['public/static/js/custom.js']
  },

  //minify js files, add version info on top
  uglify: {
    options: {
    banner: '/*! <%= pkg.name %> * v<%= pkg.author %> * <%= grunt.template.today("yyyy-mm-dd HH:mm:ss") %> */'
    },
    my_target: {
    files: {
      'public/static/js/combined.min.js': ['public/static/js/combined.js'],
      'html/static/js/combined.min.js': ['html/static/js/combined.js']
    }
    }
  },

  //remove empty lines to cleanup non minified files
  lineremover: {
    noOptions: {
    files: {
      'html/static/style/screen.css': 'html/static/style/screen.css',
      'html/static/js/combined.js': 'html/static/js/combined.js',
    }
    }
  },

  //combine and minify css files
  cssmin: {
    options: {
    shorthandCompacting: false,
    roundingPrecision: -1
    },
    target: {
    files: {
      'public/static/style/screen.min.css': ['public/static/style/screen.css'],
      'html/static/style/screen.min.css': ['public/static/style/screen.css']
    }
    }
  },

  clean: {
    html: ["html/*.html"],
    css: ["html/static/style/screen.css"],
    js: [
      "html/static/js/*.js",
      "!html/static/js/combined.min.js",
      "!html/static/js/jquery.min.js",
      "!html/static/js/jquery.ui.min.js"
    ],
    img: ["html/static/img/src"],
    init_clean: ["public/static/js/combined.*","public/static/style/screen.*","html/**"],
    images_clean: ["public/static/img/content/**"],
    dsstore: ["html/.DS_Store","html/*/.DS_Store","html/*/*/.DS_Store","html/*/*/*/.DS_Store","html/*/*/*/*/.DS_Store"]
  },

  removeemptylines: {
    options: {},
    files: {
      'html/*.html': ['html/*.html'],
      'html/**/*.html': ['html/**/*.html'],
      'html/**/**/*.html': ['html/**/**/*.html'],
      'html/**/**/**/*.html': ['html/**/**/**/*.html'],
      'html/**/**/**/**/*.html': ['html/**/**/**/**/*.html']
    }
  },

  // prettify html
  // add all child directories by hand
  prettify: {
    options: {
    indent: 1,
    indent_char: ' ',
    condense: true,
    padcomments: false,
    preserve_newlines: false,
    },
    base: {
    expand: true,
    cwd: 'html',
    ext: '.html',
    src: ['*.html'],
    dest: 'html'
    },
  },

  //Embed URL's as base64 strings inside your stylesheets
  //https://www.npmjs.com/package/grunt-css-url-embed
  cssUrlEmbed: {
      encode: {

          options: {
              inclusive: true,              // true means that you have to manually mark each URL that needs to be embedded using the /* embed */ comment.
                                            // false (exclusive) means that every URL is embedded, except those that are marked with /* noembed */ comment.
              skipUrlsLargerThan: '32 KB',  // IE8 is limited to 32 KB!!
              useMimeTypeSniffing: true,    // true = use the mmmagic MIME-type sniffing library (default); false = use always image extension only.
              failOnMissingUrl: true        // Default: true
              // baseDir: './app'           // Specify base directory if needed (Default: . or the directory of Gruntfile.js)
          },

          // Process single files
          files: {
              'public/static/style/screen.css': ['public/static/style/screen.css']
          }

          // Process all CSS files in target directory
          // expand: true,
          // cwd: 'stylesheets',
          // src: [ '**/*.scss' ],
          // dest: 'stylesheets'
      }
  },

  //html validation with w3c, getting doctype automatic
  // needs http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html on mac
  htmllint: {
    all:{
      options: {
        ignore: ['Comments seen before doctype. Internet Explorer will go into the quirks mode.',
             'Consider using the "h1" element as a top-level heading only (all "h1" elements are treated as top-level headings by many screen readers and other tools).',
             'Article lacks heading. Consider using “h2”-“h6” elements to add identifying headings to all articles.',
             'The "name" attribute is obsolete. Consider putting an "id" attribute on the nearest container instead.',
             'Element “div” not allowed as child of element “span” in this context. (Suppressing further errors from this subtree.)'
        ]
      },
      src: ["html/*.html", "html/**/*.html", "html/**/**/*.html", "html/**/**/**/*.html", "html/**/**/**/**/*.html"]
    }
  },
  //banner css
  banner: '/*! <%= pkg.name %> * <%= pkg.author %> * <%= grunt.template.today("yyyy-mm-dd HH:mm:ss") %> */',
  usebanner: {
    dist: {
      options: {
        position: 'top',
        linebreak: true,
        banner: '<%= banner %>'
      },
      files: {
        src: [ 'public/static/style/screen.min.css', 'html/static/style/screen.min.css' ]
      }
    },
  },
  // copy
  copy: {
    gif: {
      files: [
        {expand: true, flatten: true, cwd: 'public/static/img/src/', src: '*.gif', dest: 'public/static/img/content/', filter: 'isFile'}
      ]
    }
  },
  // create resp. images
  responsive_images: {
    image_large: {
      options: {
        sizes: [{
          name: "large",
          width: 1200
        },{
          name: "medium",
          width: 955
        },{
          name: "small",
          width: 480,
        },{
          name: "extrasmall",
          width: 526,
        }]
      },
      files: [{
        expand: true,
        src: ['**/*.{png,jpg}'],
        cwd: 'public/static/img/src/',
        dest: 'public/static/img/content/'
      }]
    },
  },
  imagemin: {
    content: {
      options: {
        progressive: true,
        optimizationLevel: 2,
        svgoPlugins: [{ removeViewBox: false }],
      },
      files: [{
        expand: true,
        cwd: 'public/static/img/content/',
        src: ['**/*.{png,jpg,gif,svg}'],
        dest: 'public/static/img/content/'
      }]
    },
  }
  });

  //to use the tools we need to load them

  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-html');
  grunt.loadNpmTasks('grunt-remove-logging');
  grunt.loadNpmTasks('grunt-line-remover');
  grunt.loadNpmTasks('grunt-prettify');
  grunt.loadNpmTasks('grunt-remove-empty-lines');
  grunt.loadNpmTasks('grunt-css-url-embed');
  grunt.loadNpmTasks('grunt-banner');
  grunt.loadNpmTasks('grunt-responsive-images');

  //running task with "grunt"
  grunt.registerTask('default', tasksPrepare);
  var tasksPrepare = ['clean:init_clean','concat'];
  var tasksValidate = ['jshint','htmllint'];
  var tasksImages = ['clean:images_clean', 'responsive_images', 'copy:gif', 'imagemin'];
  var tasksProduction = ['concat', 'lineremover', 'cssUrlEmbed', 'cssmin', 'uglify', 'usebanner', 'removeemptylines', 'prettify', 'clean:dsstore', 'clean:css', 'clean:js', 'clean:img'];
  // use mode production and run first grunt images then server export and grunt production;
  //running task with "grunt production"
  grunt.registerTask('prepare', tasksPrepare)
  grunt.registerTask('build', tasksProduction);
  grunt.registerTask('images', tasksImages);
  grunt.registerTask('validate', tasksValidate);

};
