describe Ebe do
  describe '#divides?' do
    it "is always false when `b == 0`" do
      property_of {
        Rantly { integer }
      }.check { |a|
        expect(Ebe.divides?(0, a)).to be false
      }
    end

    context "when `b != 0`" do
      it "is always true when `b == 1`" do
        property_of {
          Rantly { integer }
        }.check { |a|
          expect(Ebe.divides?(1, a)).to be true
        }
      end

      it "is always true when `b == -1`" do
        property_of {
          Rantly { integer }
        }.check { |a|
          expect(Ebe.divides?(-1, a)).to be true
        }
      end

      it "is always true when `a == 0`" do
        property_of {
          Rantly { nonzero_integer }
        }.check { |b|
          expect(Ebe.divides?(b, 0)).to be true
        }
      end

      it "is always true when `a` is a multiple of `b`" do
        property_of { [
          Rantly { nonzero_integer },
          Rantly { integer },
        ] }.check { |b, multiplier|
          expect(Ebe.divides?(b, b * multiplier)).to be true
        }
      end

      it "is always false when `a` is not a multiple of `b`" do
        property_of { [
          Rantly { integer.tap { |b| guard b.abs > 2 } },
          Rantly { integer },
        ] }.check { |b, multiplier|
          offset = Random.rand(0...b.abs)
          expect(Ebe.divides?(b, b * multiplier + offset)).to be false
        }
      end
    end
  end

  describe '#div_rem' do
    subject { Ebe.div_rem(a, b) }

    context "when `a` and `b` are positive" do
      let(:a) { 55 }
      let(:b) { 12 }
      it { is_expected.to eq [4, 7] }
    end

    context "when `b` is negative" do
      let(:a) { 55 }
      let(:b) { -12 }
      it { is_expected.to eq [-4, 7] }
    end

    context "when `a` is negative" do
      let(:a) { -55 }
      let(:b) { 12 }
      it { is_expected.to eq [-5, 5] }
    end

    context "when `a` and `b` are negative" do
      let(:a) { -55 }
      let(:b) { -12 }
      it { is_expected.to eq [5, 5] }
    end

    describe 'relation to #quotient and #remainder' do
      let(:a) { 55 }
      let(:b) { 12 }
      it { is_expected.to eq [Ebe.quotient(a, b), Ebe.remainder(a, b)] }
    end
  end
end

