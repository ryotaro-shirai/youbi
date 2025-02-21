# frozen_string_literal: true
require "youbi"

RSpec.describe Youbi do
  let(:date) { Date.new(2025, 2, 10) } # 月曜日
  let(:time) { Time.new(2025, 2, 10, 12, 0, 0) } # 月曜日

  describe "#japanese_day" do
    context "in case of kanji（default）" do
      it "returns the correct day of the week with Date" do
        expect(date.japanese_day).to eq "月曜日"
        expect(date.japanese_day(format: :kanji)).to eq "月曜日"
      end

      it "returns the correct day of the week with Time" do
        expect(time.japanese_day).to eq "月曜日"
        expect(time.japanese_day(format: :kanji)).to eq "月曜日"
      end
    end

    context "in case of hiragana" do
      it "returns the correct day of the week with Date" do
        expect(date.japanese_day(format: :hiragana)).to eq "げつようび"
      end

      it "returns the correct day of the week with Time" do
        expect(time.japanese_day(format: :hiragana)).to eq "げつようび"
      end
    end

    context "in case of katakana" do
      it "returns the correct day of the week with Date" do
        expect(date.japanese_day(format: :katakana)).to eq "ゲツヨウビ"
      end

      it "returns the correct day of the week with Time" do
        expect(time.japanese_day(format: :katakana)).to eq "ゲツヨウビ"
      end
    end

    context "in case of short format" do
      it "returns the correct day of the week with Date" do
        expect(date.japanese_day(format: :short)).to eq "月"
      end

      it "returns the correct day of the week with Time" do
        expect(time.japanese_day(format: :short)).to eq "月"
      end
    end

    context "in case of invalid format" do
      it "raises Error with Date" do
        expect {date.japanese_day(format: :invalid)}.to raise_error(Youbi::Error)
      end

      it "raises Error with Time" do
        expect {time.japanese_day(format: :invalid)}.to raise_error(Youbi::Error)
      end
    end
  end
end
