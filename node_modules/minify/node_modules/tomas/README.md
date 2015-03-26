# Tomas

Save data to storage and read from it to speed up computing.

## Install

```
npm i tomas --save
```
## How to use?

```js
var fs      = require('fs'),
    tomas   = require('tomas'),
    path    = 'coderaiser/node-tomas/package.json';

tomas.check(path, function(is) {
    if (is)
        tomas.read(name, function(error, data) {
            if (error)
                console.error(message);
            else
                console.log('tomas read:\n', data);
        });
    else
        fs.readFile(name, 'utf8', function(error, data) {
            if (error)
                console.error(error.message);
            else
                tomas.write(name, data, function(error) {
                    if (error)
                        console.error(data);
                    else
                        console.log('tomas written');
                });
        });
});
```

## License

MIT
