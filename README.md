# Sampler application


The goal of this application is to show Rails functionality.

The challenege: create a RESTful API that consists of one or more resources. The API should allow the consumer to
retrieve aggregated data from 2 or 3 sources. See sample below. Here are some of the requirements.

  * Show your knowledge of how to design RESTful resources.

  * The API should support at least GET requests.

  * The API takes requests for data, then delegates those requests to more than one public APIs
    (see samples below), once the responses are received, the data from multiple sources should be
    aggregated and sent back to the consumer.

  * One of the delegations should be asynchronous and use a message queue.

  * Persist some request tracking information using ActiveRecord; in-memory database is fine.
    Add your own creative twists.

  * Show your experience in packaging a full ready-to-run project.

  * Required: add unit and integrations tests using rspec

  * Required technologies: Ruby on Rails, Bundler and Rspec

  * Optional: add some authentication of your choice

Deliver a Rails project--via Github--that runs correctly after an initial "git clone <url>"
followed by the "rails s" command. Please include documentation in your project’s Readme describing
your API and how to use it. If specific dependencies are required on the target container to run the
application, please include a list of those.


## Implementation


This is a quick implementation designed to show Rails functionality.

  * Show the user (or REST agent) a homepage with search box.

  * When the user (or REST agent) submits a search, show some results from Google and Yahoo.

  * The results are in typical HTML, suitable for REST to follow.


## Run It


To run this app using the local webrick server:

    rails s

To run the AMQP asynchronous message queue:

    cd script/amqp
    bundle exec ./amqp-weather-server.rb

To load the home page in any browser:

    http://0.0.0.0:3000


## Discussion

Tradeoffs:

  * This app uses simple HTML APIs that are web requests akin to what a browser would request.

  * Future development could use similar JSON APIs, and reconstruct the HTML links.


REST:

  * For REST, I use the Fielding paper.

  * I agree with Fielding's position that REST APIs must be hypertext driven:
    http://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven

  * For this sample app, HTML is the closest to REST for a quick implementation.

  * If the goal is to use pre-determined JSON RPC endpoints, such as the Google Search API,
    I would tend to describe the app design as using JSON RPC (rather than as using REST).
    This is a valuable distinction because a true REST app is significantly more powerful
    than JSON RPC, tends to be more challenging to develop, and needs more follow-testing.
