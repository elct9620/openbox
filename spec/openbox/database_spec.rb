# frozen_string_literal: true

RSpec.describe Openbox::Database do
  subject(:database) { described_class.new }

  describe '#adapters' do
    subject { database.adapters }

    it { is_expected.to be_empty }

    context 'when dependencies contains pg' do
      let(:runtime) { instance_double('Openbox::Runtime') }

      before do
        allow(Openbox).to receive(:runtime).and_return(runtime)
        allow(runtime).to receive(:select)
          .and_return([instance_double('Bundler::Dependency', name: 'pg')])
      end

      it { is_expected.to include('pg') }
    end
  end

  describe '#ensure_connection!' do
    subject(:ensure) { database.ensure_connection! }

    it { is_expected.to be_nil }
  end
end
