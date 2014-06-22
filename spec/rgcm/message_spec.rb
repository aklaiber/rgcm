require 'spec_helper'

describe Rgcm::Message do

  it 'posts gcm message' do
    Rgcm::Message.new.post('gcm_registration_id', 'collapse_key', 'data')
  end

end