(function(scope) {
    'use strict';
    
    var Scope = scope.window ? window : global;
    
    if (typeof module === 'object' && module.exports)
        module.exports = new checkProto();
    else if (!Scope.check)
        Scope.check = new checkProto();
    
    function checkProto() {
        /**
         * Check is all arguments with names present
         * 
         * @param name
         * @param arg
         * @param type
         */
        var check = function check(args, names) {
            var name        = '',
                template    = ' coud not be empty!',
                
                indexOf     = Array.prototype.indexOf,
                
                lenNames    = names.length,
                lenArgs     = args.length,
                lessArgs    = lenArgs < lenNames,
                emptyIndex  = indexOf.call(args),
                isEmpty;
            
            if (~emptyIndex)
                isEmpty     = emptyIndex + 1 <= lenNames;
            
            if (lessArgs || isEmpty) {
                if (lessArgs)
                    name        = names[lenNames - 1];
                else
                    name        = names[emptyIndex];
                
                throw(Error(name + template));
            }
            
            return check;
        };
        
        check.check = check;
        
        /**
         * Check is type of arg with name is equal to type
         * 
         * @param name
         * @param arg
         * @param type
         */
        check.type  = function(name, arg, type) {
            var is = getType(arg) === type;
            
            if (!is)
                throw(Error(name + ' should be ' + type));
            
            return check;
        };
        
        function getType(variable) {
            var regExp      = new RegExp('\\s([a-zA-Z]+)'),
                str         = {}.toString.call(variable),
                typeBig     = str.match(regExp)[1],
                result      = typeBig.toLowerCase();
            
            return result;
        } 
        
        return check;
    }
    
})(this);
