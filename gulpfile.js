var root = require('path').resolve('./')

var config = {
    paths: {
        ruby: {
            src: ['app/**/*.rb']
        },
        html: {
            src: ['app/**/*.haml']
        },
        sass: {
            src: ['app/**/*.sass']
        },
        js: {
            src: ['app/**/*.js']
        },
        jsx: {
            src: ['app/**/*.jsx']
        }
    }
}
config.paths.watch = [
    config.paths.ruby.src,
    config.paths.html.src,
    config.paths.sass.src,
    config.paths.js.src,
    config.paths.jsx.src
]

var browserSync = require('browser-sync')
var childProcess = require('child_process')
var gulp = require('gulp')
var run = require('gulp-run')
var runSequence = require('run-sequence')
var del = require('del');

gulp.task('reload', function () {
    browserSync.reload()
})

gulp.task('browser-sync', function () {
    browserSync({
        browser: 'Google\ Chrome',
        proxy: 'localhost:3001'
    })
})

gulp.task('clean', function () {
    return del(['public/packs/*'])
})

gulp.task('webpack', ['clean'], function(done) {
    run('bundle exec rake react_on_rails:locale && bin/webpack').exec(done)
})

gulp.task('build', function (done) {
    runSequence('reload', done)
})

gulp.task('watch', function () {
    gulp.watch(config.paths.watch, ['build'])
})

gulp.task('rails', function (done) {
    var spawn = childProcess.spawn;
    console.info('Starting rails server');
    var PIPE = {stdio: 'inherit'};
    spawn('rails', ['s', '-p', '3001'], PIPE);
})

gulp.task('default', function (done) {
    runSequence('clean', 'build', 'watch', 'browser-sync', done)
})

