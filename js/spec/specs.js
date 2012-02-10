//
// Start curl using the same configuraiton
// that is used for the application
// 
// Custom overrides are done in config-override.js
curl(curlCfg,
     // The list of specs to run.  Each specification
     // is its own AMD module
     [
       // These are AMD paths to each specification
       'spec/doubleit_spec'
     ]

    ).then(function (){
      // At this point the above specs will be loaded
      // into the Jasmine environment
      jasmine.getEnv().delayedExecute()
    })

