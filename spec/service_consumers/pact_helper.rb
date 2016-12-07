require 'pact/provider/rspec'

require "./spec/service_consumers/provider_states_for_catalog_app"

Pact.service_provider "Stock Service" do

  honours_pact_with 'Catalog App' do

    # This example points to a local file, however, on a real project with a continuous
    # integration box, you would use a [Pact Broker](https://github.com/bethesque/pact_broker) or publish your pacts as artifacts,
    # and point the pact_uri to the pact published by the last successful build.

    pact_uri 'http://pact-broker-pact-broker.tooling.178.62.64.127.nip.io/pacts/provider/Stock%20Service/consumer/Catalog%20App/latest'
  end
end
