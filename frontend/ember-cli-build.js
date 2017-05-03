var EmberApp = require('ember-cli/lib/broccoli/ember-app');
var nodeSass = require('node-sass'); // loads the version in your package.json

module.exports = function(defaults) {
  var app = new EmberApp(defaults, {
    sassOptions: {
      includePaths: [
        'bower_components/materialize/sass'
      ],
      nodeSass: nodeSass
    },
  });

  app.import('bower_components/jquery-ui/jquery-ui.js');
  app.import('vendor/mara.js');
  app.import('vendor/gallery_carousel.js');
  app.import('vendor/jquery.timepicker.js');
  app.import('vendor/jquery.timepicker.css');

  app.import('bower_components/fullcalendar/dist/locale/ru.js');

  return app.toTree();
};
