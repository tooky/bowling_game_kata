require 'frame'

describe Frame do
  subject { Frame.new }
  context 'with a single 5 roll' do
    before { subject.roll(5) }

    it { should_not be_finished }
    its(:score) { should == 5 }
    it { should_not be_requires_bonus }

    context 'with a second roll' do
      before { subject.roll(3) }

      it { should be_finished }
      its(:score) { should == 8 }
      it { should_not be_requires_bonus }
    end

    context 'with a spare roll' do
      before { subject.roll(5) }

      it { should be_finished }
      it { should be_requires_bonus }
    end
  end

  context 'with a single 10 roll' do
    before { subject.roll(10) }

    it { should be_finished }

    its(:score) { should == 10 }

    it { should be_requires_bonus }

    context 'with one bonus roll' do
      before { subject.roll(9) }

      it { should be_requires_bonus }
    end

    context 'with two bonus rolls' do
      before do
        subject.roll(9)
        subject.roll(3)
      end

      it { should_not be_requires_bonus }
    end

  end
end
