gulp = require("gulp")
webserver = require("gulp-webserver")
cors = require("cors")
traitify = require("traitify")
fs = require("fs")
coffee = require("gulp-coffee")
watch = require("gulp-watch")
gutil = require("gulp-util")

gulp.task('coffee', ->
  gulp.src('./src/**/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log).on('done', ->
      gulp.start('scripts')
    )).pipe(gulp.dest('./compiled'))
)

gulp.task("server", ->
  express = require('express')
  app = express()
  app.use(cors())
  #CREATE ASSESSMENT ENDPOINT
  app.post("/assessments", (req, res)->
    traitify.setHost(process.env.TF_HOST)
    traitify.setVersion("v1")
    traitify.setSecretKey(process.env.TF_SECRET_KEY)
    traitify.createAssessment(req.query.deck, (assessment)->
        res.send(assessment)
    )
  )
  app.post("/public_key", (req, res)->
    res.send(process.env.TF_PUBLIC_KEY)
  )

  app.get("/", (req, res)->
    fileContents = fs.readFileSync("./index.html", "utf8")
    res.send(fileContents)
  )

  app.get("/compiled/*", (req, res)->
    res.setHeader('Content-Type', "text/javascript" )
    a = req.originalUrl
    fileContents = fs.readFileSync(req.originalUrl.slice(1, req.originalUrl.length), "utf8")
    res.send(fileContents)
  )


  app.listen(9292)
)

gulp.task('watch', ->
  gulp.watch('./src/**/*.coffee', {}, ->
    gulp.start('coffee');
  )
  gulp.start(["coffee"])
)

gulp.task("default", ["server", "watch"])
