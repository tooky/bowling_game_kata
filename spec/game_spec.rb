require 'game'

#Examples: Twenty zeros produce zero.
#Twenty fours produce 80.
#Twelve tens produce 300

describe Game do
  describe 'acceptance examples' do
    subject { Game.score(rolls) }

    context 'with twenty zeros' do
      let(:rolls) {[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]}

      it 'produces 0' do
        should == 0
      end
    end

    context 'with twenty fours' do
      let(:rolls) {[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]}

      it 'produces 80' do
        should == 80
      end
    end

    context 'with twelve tens' do
      let(:rolls) {[10,10,10,10,10,10,10,10,10,10,10,10]}

      it 'produces 300' do
        should == 300
      end
    end

    context 'all spares with a 10 bonus' do
      let(:rolls) {[1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,10]}

      it 'produces 110' do
        should == 119
      end
    end

    context 'all spares with 10 on second roll' do
      let(:rolls) {[0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,10]}

      it { should == 110 }
    end

    context 'a variety' do
      let(:rolls) {[1,9,2,8,3,7,4,6,5,5,5,5,6,4,7,3,8,2,9,1,5]}

      it { should == 154 }
    end
  end
end
