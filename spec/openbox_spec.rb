# frozen_string_literal: true

RSpec.describe Openbox do
  it 'has a version number' do
    expect(Openbox::VERSION).not_to be nil
  end

  describe '.runtime' do
    subject { described_class.runtime }

    it { is_expected.to be_a(Openbox::Runtime) }
  end

  describe '.database' do
    subject { described_class.database }

    it { is_expected.to be_a(Openbox::Database) }
  end
end
