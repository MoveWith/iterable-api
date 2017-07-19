require 'spec_helper'

describe Iterable::DataFields do
  subject { Iterable::DataFields.new }

  it 'is Mash' do 
    expect(subject.is_a?(Hashie::Mash)).to be_truthy
  end

  it 'can parse from json' do 
    json_string = load_file('data_fields.json')
    subject = Iterable::DataFields.new(JSON.parse(json_string))
    expect(subject[:key1]).to eq 'value1'
    expect(subject[:key2]).to eq 'value2'
  end
end