describe Ntp::Views::Divisibility::Index do
  let(:exposures) { { :divisor => divisor, :dividend => dividend } }
  let(:template) { Hanami::View::Template.new('apps/ntp/templates/divisibility/index.html.slim') }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }

  let(:divisor) { nil }
  let(:dividend) { nil }

  it "has the definition" do
    expect(rendered).to include "<code>b</code> divides <code>a</code>"
  end

  it "has the successful example" do
    expect(rendered).to include "15 divides 45"
  end

  it "has the failed example" do
    expect(rendered).to include "10 does not divide 45"
  end

  context "with divisor but no dividend" do
    let(:divisor) { 111 }

    it "does not have the answer" do
      expect(rendered).to_not include "<h4>answer</h4>"
    end
  end

  context "with dividend but no divisor" do
    let(:dividend) { 666 }

    it "does not have the answer" do
      expect(rendered).to_not include "<h4>answer</h4>"
    end
  end

  context "with both divisor and dividend" do
    let(:divisor) { 111 }
    let(:dividend) { 666 }

    it "has the answer" do
      expect(rendered).to include "<h4>answer</h4>"
    end

    context "if dividend is a multiple of divisor" do
      before { expect(Ebe.divides? divisor, dividend).to be true }

      it "has the yes answer" do
        expect(rendered).to_not include "<strong>no"
        expect(rendered).to include "<strong>yes"
      end

      it "has the sentence version" do
        expect(rendered).to include(
          "<code>#{divisor}</code> <span>divides</span> <code>#{dividend}</code>"
        )
      end
    end

    context "if dividend is a not multiple of divisor" do
      let(:divisor) { 100 }

      before { expect(Ebe.divides? divisor, dividend).to be false }

      it "has the no answer" do
        expect(rendered).to include "<strong>no"
        expect(rendered).to_not include "<strong>yes"
      end

      it "has the sentence version" do
        expect(rendered).to include(
          "<code>#{divisor}</code> <span>does not divide</span> <code>#{dividend}</code>"
        )
      end
    end
  end
end

