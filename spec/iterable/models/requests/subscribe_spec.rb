require 'spec_helper'

describe Iterable::Requests::Subscribe do
  subject { Iterable::Requests::Subscribe.new(listId: 1) }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has listId' do 
    subject.listId = 1
    expect(subject.listId).to eq 1
    subject.listId = "1"
    expect(subject.listId).to eq 1 # coerced into an integer
  end

  it 'has subscribers' do 
    expect(subject.subscribers).to be_nil
    user = Iterable::User.new(email: 'bob@example.org')
    subject.subscribers = [user]
    expect(subject.subscribers).to include user
    subject.subscribers = [{email: 'anita@example.org'}]
    expect(subject.subscribers.first.email).to include 'anita@example.org'
  end

  it 'can parse from json' do 
    json_string = load_file('request_subscribe.json')
    subject = Iterable::Requests::Subscribe.new(JSON.parse(json_string))
    expect(subject.listId).to eq 1
    first_subscriber = subject.subscribers.first
    expect(first_subscriber.email).to eq 'bob@example.org'
    expect(first_subscriber.userId).to eq '1'
    expect(first_subscriber.dataFields[:key]).to eq 'value'
  end
end