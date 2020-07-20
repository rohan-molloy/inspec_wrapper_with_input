# copyright: 2018, The Authors

tag_example = input('amplifier_max_volume')

control 'Big Rock Show' do
  tag acsc: tag_example
  describe input('amplifier_max_volume') do    # This line reads the value of the input
    it { should cmp 11 } 
  end
end