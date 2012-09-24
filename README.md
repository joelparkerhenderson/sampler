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

  * Optional: add some authentication of your choice

  * Required technologies: Ruby on Rails, Bundler and Rspec

Deliver a Rails project--via Github--that runs correctly after an initial "git clone <url>"
followed by the "rails s" command. Please include documentation in your project’s Readme describing
your API and how to use it. If specific dependencies are required on the target container to run the
application, please include a list of those.

### Sample

Feel free to implement this, or any other project that satisfies the requirements above.

Create an API that returns some information about a given city, including things like:

  * a few Google search results

  * a few tweets about the city

  * a weather forecast

For instance, the API could take the parameters "Berkeley, CA", the request would trigger three
independent searches on Google, Twitter, and a weather site, then the results would be aggregated and
returned to the consumer.

The diagram below shows a sample flow:

  * Google and Twitter are used via synchronous API calls.

  * the weather service is invoked asynchronously via a message queue
