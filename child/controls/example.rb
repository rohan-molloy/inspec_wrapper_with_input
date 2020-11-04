# copyright: 2018, The Authors

include_controls 'child2'
control 'Child 1 - Big Rock Show' do
  describe input('amplifier_max_volume') do # This line reads the value of the input
    it { should cmp 11 }
  end

  describe input('amplifier_max_volume_child_1') do # This line reads the value of the input
    it { should cmp 110 }
  end

  describe input('amplifier_text') do # This line reads the value of the input
    it { should cmp 'anthony' }
  end
end
