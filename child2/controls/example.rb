# copyright: 2018, The Authors

# copyright: 2018, The Authors

control 'Child2 - Small Rock Show' do
  describe input('amplifier_max_volume') do # This line reads the value of the input
    it { should cmp 11 }
  end

  describe input('amplifier_max_volume_child_2') do # This line reads the value of the input
    it { should cmp 110 }
  end

  describe input('amplifier_text') do # This line reads the value of the input
    it { should cmp 'rees' }
  end
end