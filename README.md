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

## TODO

* Add benchmarks (comparision to Draper)
