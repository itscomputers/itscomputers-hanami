require "spec_helper"

RSpec.describe Ntp::Views::ApplicationLayout, type: :view do
  let(:layout)   { Ntp::Views::ApplicationLayout.new({ format: :html }, "contents") }
  let(:rendered) { layout.render }

  it 'contains application name' do
    expect(rendered).to include('Ntp')
  end
end
