# Tuner

A pure implementation of decorator pattern, alternative to Draper gem

## Installation

```
gem install tuner
```

## Usage

Turn your class into decorator by inheriting from `Tuner::Decorator` class:

```ruby
class UserDecorator < Tuner::Decorator
  def full_name
    "#{model.first_name} #{model.last_name}"
  end
end
```

then you can decorate your object:

```ruby
user = User.find(...)

UserDecorator.new(user)
# or 
UserDecorator.decorate(user)
```

## Benchmarks

In basic usage, `Tuner` is around 3 times faster than `Draper` and it allocates 60% less objects.

Code used for benchmarks:

```ruby
require 'allocation_stats'
require 'draper'
require 'tuner'
require 'benchmark'

class UserTunerDecorator < Tuner::Decorator
  def full_name
    "#{model.first_name} #{model.last_name}"
  end
end

class UserDraperDecorator < Draper::Decorator
  def full_name
    "#{model.first_name} #{model.last_name}"
  end
end

user = Struct.new(:first_name, :last_name).new('John', 'Doe')

stats = AllocationStats.trace { UserDraperDecorator.new(user).full_name }
puts stats.allocations.group_by(:class).to_text

stats = AllocationStats.trace { UserTunerDecorator.new(user).full_name }
puts stats.allocations.group_by(:class).to_text

Benchmark.bm 10 do |bench|
  bench.report "Tuner: " do
    1_000_000.times { UserTunerDecorator.new(user).full_name }
  end

  bench.report "Draper: " do
    1_000_000.times { UserDraperDecorator.new(user).full_name }
  end
end
```
