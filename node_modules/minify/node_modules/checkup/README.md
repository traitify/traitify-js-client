# Checkup

Check arguments and if they wrong throw exeption.

## Install

```
npm i chukup --save
```

## How to use?

```js
var check   = require('checkup');

function showName(name, callback) {
    check(arguments, ['name'])
    .check(arguments, ['callback'])
    .type('name', name, 'string')
    .type('callback', callback, 'function');

    console.log('every thing is ok:', name);
}

function callCallback(callback) {
    check([callback], ['callback'])
    .type('callback', callback, 'function');
    
    callback();
}

```

## License

MIT
