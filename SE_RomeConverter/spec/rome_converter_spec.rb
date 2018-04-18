require "rome_converter.rb"

describe RomeConverter do
  describe ".to_rome" do
      it "Converts 1" do
          expect(RomeConverter.new.to_rome 1).to eq "I"
      end
      it "Converts 2" do
          expect(RomeConverter.new.to_rome 2).to eq "II"
      end
      it "Converts 4" do
          expect(RomeConverter.new.to_rome 4).to eq "IV"
      end
      it "Converts 5" do
          expect(RomeConverter.new.to_rome 5).to eq "V"
      end
      it "Converts 6" do
          expect(RomeConverter.new.to_rome 6).to eq "VI"
      end
      it "Converts 8" do
          expect(RomeConverter.new.to_rome 8). to eq "VIII"
      end
      it "Converts 9" do
          expect(RomeConverter.new.to_rome 9).to eq "IX"
      end
      it "Converts 10" do
          expect(RomeConverter.new.to_rome 10).to eq "X"
      end
      it "Converts 50" do
          expect(RomeConverter.new.to_rome 50).to eq "L"
      end
      it "Converts 74" do
          expect(RomeConverter.new.to_rome 74).to eq "LXXIV"
      end
      it "Converts 90" do
          expect(RomeConverter.new.to_rome 90).to eq "XC"
      end
      it "Converts 100" do
          expect(RomeConverter.new.to_rome 100).to eq "C"
      end
      it "Converts 200" do
          expect(RomeConverter.new.to_rome 200).to eq "CC"
      end
      it "Converts 400" do
          expect(RomeConverter.new.to_rome 400).to eq "CD"
      end
      it "Converts 500" do
          expect(RomeConverter.new.to_rome 500).to eq "D"
      end
      it "Converts 900" do
          expect(RomeConverter.new.to_rome 900).to eq "CM"
      end
      it "Converts 1000" do
          expect(RomeConverter.new.to_rome 1000).to eq "M"
      end
      it "Converts 1234" do
          expect(RomeConverter.new.to_rome 1234).to eq "MCCXXXIV"
      end
      it "Converts 3999" do
          expect(RomeConverter.new.to_rome 3999).to eq "MMMCMXCIX"
      end
      it "Converts 4567" do
          expect(RomeConverter.new.to_rome 4567).to eq "MMMMDLXVII"
      end
      it "Converts 4944" do
          expect(RomeConverter.new.to_rome 4944). to eq "MMMMCMXLIV"
      end
  end

  describe "to_dec" do
      it "Converts I" do
          expect(RomeConverter.new.to_dec "I"). to eq 1
      end
      it "Converts IV" do
          expect(RomeConverter.new.to_dec "IV"). to eq 4
      end
      it "Converts V" do
          expect(RomeConverter.new.to_dec "V").to eq 5
      end
      it "Converts VII" do
          expect(RomeConverter.new.to_dec "VIII").to eq 8
      end
      it "Converts IX" do
          expect(RomeConverter.new.to_dec "IX").to eq 9
      end
      it "Converts X" do
          expect(RomeConverter.new.to_dec "X").to eq 10
      end
      it "Converts L" do
          expect(RomeConverter.new.to_dec "L").to eq 50
      end
      it "Converts LXXIV" do
          expect(RomeConverter.new.to_dec "LXXIV").to eq 74
      end
      it "Converts C" do
          expect(RomeConverter.new.to_dec "C").to eq 100
      end
      it "Converts D" do
          expect(RomeConverter.new.to_dec "D").to eq 500
      end
      it "Converts M" do
          expect(RomeConverter.new.to_dec "M").to eq 1000
      end
      it "Converts MCCXXXIV" do
          expect(RomeConverter.new.to_dec "MCCXXXIV").to eq 1234
      end
      it "Converts MMMCMXCIX" do
          expect(RomeConverter.new.to_dec "MMMCMXCIX").to eq 3999
      end
      it "Converts MMMMDLXVII" do
          expect(RomeConverter.new.to_dec "MMMMDLXVII").to eq 4567
      end
      it "Converts MMMMCMXLIV" do
          expect(RomeConverter.new.to_dec "MMMMCMXLIV"). to eq 4944
      end
  end
end
