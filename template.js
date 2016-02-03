'use stricts';

exports.description = 'Create a Qt Quick Application project files.';
exports.notes = '_name_ should not contain spaces.';
exports.after = 'You should now run `grunt`.\n' +
  'Every `.qml` file you change, an script will close all running instances, rebuild and run.' +
  '\n\n' +
  'Available commands:' +
  '\n' +
  '$ grunt watch' +
  '\n' +
  '$ grunt command:run rebuild';

exports.warnOn = '*';

exports.template = function(grunt, init, done) {
  init.process({}, [
    init.prompt('name'),
  ], function(err, props) {
    var files;

    files = init.filesToCopy(props);

    init.copyAndProcess(files, props); // TODO {noProcess: '/bin/**'}
    init.writePackageJSON('package.json', {
      name: props.name,
      version: '0.1.0',
      devDependencies: {
        "grunt": "^0.4.5",
        "grunt-contrib-commands": "^0.1.6",
        "grunt-contrib-watch": "^0.6.1"
      }
    });

    done();
  });

};
