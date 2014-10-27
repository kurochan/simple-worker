# SimpleWorker

Simple Worker Library

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple-worker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple-worker

## Usage

```ruby
worker = SimpleWorker.new
worker.push {puts 'world'}
puts 'hello'
# output:
# hello
# world
```

```ruby
worker = SimpleWorker.new
worker.push Proc.new {puts 'world'}
puts 'hello'
# output:
# hello
# world
```

```ruby
worker = SimpleWorker.new(2)
5.times do |i|
  worker.push do |thread_id|
    sleep 1
    puts "thread_id=#{thread_id} value=#{i}"
  end
end
sleep 5
# output:
# thread_id=0 value=1
# thread_id=1 value=0
# thread_id=0 value=2
# thread_id=1 value=3
# thread_id=0 value=4
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/simple-worker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
