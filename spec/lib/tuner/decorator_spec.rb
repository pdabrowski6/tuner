require 'spec_helper'

RSpec.describe Tuner::Decorator do
  class TestTunerDecorator < Tuner::Decorator
    def full_name
      "#{object.first_name} #{object.last_name}"
    end
  end

  let(:user) { Struct.new(:first_name, :last_name).new('John', 'Doe') }

  it 'decorates given object' do
    decorator = TestTunerDecorator.new(user)

    expect(decorator.full_name).to eq('John Doe')
  end

  describe '#model' do
    it 'returns original object' do
      decorator = TestTunerDecorator.new(user)

      expect(decorator.model).to eq(user)
    end
  end

  describe '#object' do
    it 'returns original object' do
      decorator = TestTunerDecorator.new(user)

      expect(decorator.object).to eq(user)
    end
  end

  describe '.decorate' do
    it 'returns decorated object' do
      decorated_object = TestTunerDecorator.decorate(user)

      expect(decorated_object).to be_instance_of(TestTunerDecorator)
    end
  end
end
