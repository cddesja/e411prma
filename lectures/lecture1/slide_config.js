var SLIDE_CONFIG = {
  // Slide settings
  settings: {
    title: 'E-411-PRMA',
    subtitle: 'Lecture 1',
    date: '17 August 2015',
  /*  eventInfo: {
     title: 'Google I/O',
      date: '17 August 2015'
    }, */
    useBuilds: true, // Default: true. False will turn off slide animation builds.
    usePrettify: true, // Default: true
    enableSlideAreas: true, // Default: true. False turns off the click areas on either slide of the slides.
    enableTouch: true, // Default: true. If touch support should enabled. Note: the device must support touch.
    //analytics: 'UA-XXXXXXXX-1', // TODO: Using this breaks GA for some reason (probably requirejs). Update your tracking code in template.html instead.
    favIcon: 'images/default_clear.png',
    fonts: [
      'Open Sans:regular,semibold,italic,italicsemibold',
      'Source Code Pro'
    ],
    //theme: ['mytheme'], // Add your own custom themes or styles in /theme/css. Leave off the .css extension.
  },

  // Author information
  presenters: [{
    name: 'Christopher David Desjardins',
    company: 'Reykjavik University',
  /*  gplus: 'http://plus.google.com/1234567890',
    twitter: '@yourhandle',*/
    www: 'http://cddesja.github.io',
    github: 'http://github.com/cddesja'
  }/*, {
    name: 'Second Name',
    company: 'Job Title, Google',
    gplus: 'http://plus.google.com/1234567890',
    twitter: '@yourhandle',
    www: 'http://www.you.com',
    github: 'http://github.com/you'
  }*/]
};
