require_relative "../spec_helper"

describe Mongoid::Document do

  describe ".paranoid?" do

    context "when Mongoid::Paranoia is included" do
      subject { ParanoidPost }
      it "returns true" do
        expect(subject.paranoid?).to be_true
      end
    end

    context "when Mongoid::Paranoia not included" do
      subject { Author }
      it "returns true" do
        expect(subject.paranoid?).to be_false
      end
    end
  end
end
