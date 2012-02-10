// The test runner as a different URL root
curlCfg['baseUrl'] = '/runner/' + curlCfg['baseUrl']

// Override the default jasmine.getEnv().execute() to
// ensure that is is called after curl has loaded all the
// assests.
jasmine.Env.prototype.delayedExecute = jasmine.getEnv().execute
jasmine.getEnv().execute = function(){}

