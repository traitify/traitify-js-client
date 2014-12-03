Traitify.js
===============

This package does not require jQuery, as it is a standalone encapsulated library. It does however require a browser with the ability to make cors requests (currently only supports ie10 and up, chrome, safari, and firefox).

### Assessment id and public key required!
For instructions on obtaining an assessment id and a public key visit:
[https://developer.traitify.com](https://developer.traitify.com)

### Using The Latest and Greatest(Edge)!
For directions on using the latest traitify js scroll to the bottom

### Using Traitify JS UI:
Include the Traitify.js library:

```xhtml
<script src="https://cdn.traitify.com/lib/v1.js"></script>
```

The following javascript will initialize with the above html:
```HTML
<script>
    Traitify.setPublicKey("8asdf8sda-f98as-df8ads-fadsf"); // Example Public Key
    Traitify.setHost("api-sandbox.traitify.com"); // Example host url (Defaults to api.traitify.com)
    Traitify.setVersion("v1"); // Example Version
    var assessmentId = "34aeraw23-3a43a32-234a34as42"; // Example Assessment id
</script>
```

===============
### Using Traitify JS API CLIENT:
```xhtml
<script src="https://cdn.traitify.com/lib/v1.js"></script>
```

##### Get Decks
```JavaScript
Traitify.getDecks("assessment id").then(function(data){
  console.log(data)
})
```

##### Get Slides
```JavaScript
Traitify.getSlides("assessment id").then(function(data){
  console.log(data)
})
```

##### Add Slide
```JavaScript
Traitify.addSlide("assessment id").then(function(data){
    console.log(data)
})
```

##### Get Personality Traits
```JavaScript
Traitify.getPersonalityTraits("assessment id").then(function(data){
    console.log(data)
})
```

##### Get Personality Types
```JavaScript
Traitify.getPersonalityTypes("assessment id").then(function(data){
    console.log(data)
})
```

##### Get Slides Using URL
```JavaScript
Traitify.get("/assessments/"+assessmentId+"slides").then(function(data){
    console.log(data)
})
```

##### Get Slides With URL
```JavaScript
\\ CamelCase instead of underscore
Traitify.setBeautify(true)
Traitify.getSlides(assessmentId).then(function(data){
    console.log(data)
})
```

### Using Edge
Warning, things may break if you use edge, it is not stable, and is not intended to be. If you're looking for a stable deployment then use the v1 bundle from the above cdn.
```xhtml
<script src="https://cdn.traitify.com/lib/edge.js"></script>
```

### Contributing 
#### Building, Testing and Bundling:
```Shell
$ cake watch
$ cake build
$ cake bundle
$ cake test
```
