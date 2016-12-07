require 'sequel'
require 'stock/db'
require 'stock/t_shirt_repository'

Pact.provider_states_for "Catalog App" do

  set_up do
    Stock::DATABASE[:tshirts].truncate
  end

  provider_state "the t-shirt stock is not empty" do
    set_up do
      Stock::DATABASE[:tshirts].insert(name: 'surfer-t-shirt')
      Stock::DATABASE[:tshirts].insert(name: 'formal-t-shirt')
    end
  end

  provider_state "a t-shirt exists" do
    set_up do
      Stock::DATABASE[:tshirts].insert(name: 'surfer-t-shirt')
    end
  end

  provider_state "there is not a t-shirt with name surfer-t-shirt" do
    no_op
  end

  provider_state "an error occurs retrieving a t-shirt" do
    set_up do
      allow(Stock::TShirtRepository).to receive(:find_t_shirt_by_name).and_raise("Argh!!!")
    end
  end
end