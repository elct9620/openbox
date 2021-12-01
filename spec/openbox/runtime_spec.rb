# frozen_string_literal: true

RSpec.describe Openbox::Runtime do
  subject(:runtime) { described_class.new }

  describe '#groups' do
    subject { runtime.groups }

    it { is_expected.to include(:default) }

    context 'when RAILS_ENV is production' do
      before do
        allow(ENV).to receive(:[]).with(anything)
        allow(ENV).to receive(:[]).with('RAILS_ENV').and_return('production')
      end

      it { is_expected.to include(:production) }
    end

    context 'when RACK_ENV is development' do
      before do
        allow(ENV).to receive(:[]).with(anything)
        allow(ENV).to receive(:[]).with('RACK_ENV').and_return('development')
      end

      it { is_expected.to include(:development) }
    end
  end

  describe '#has?' do
    subject { runtime.has?('pg') }

    it { is_expected.to be_falsy }

    context 'when dependency include pg' do
      let(:dependencies) { [instance_double('Bundler::Dependency', name: 'pg', groups: [:default])] }
      let(:runtime) { described_class.new(dependencies) }

      it { is_expected.to be_truthy }
    end
  end

  describe '#rails?' do
    subject { runtime.rails? }

    it { is_expected.to be_falsy }

    context 'when dependency include rails' do
      let(:dependencies) { [instance_double('Bundler::Dependency', name: 'rails', groups: [:default])] }
      let(:runtime) { described_class.new(dependencies) }

      it { is_expected.to be_truthy }
    end
  end
end
