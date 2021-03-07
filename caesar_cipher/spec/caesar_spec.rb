# frozen_string_literal: true

require './caesar_cipher.rb'

describe 'caesar_cipher' do
  it 'works with single letters' do
    expect(caesar_cipher('A', 1)).to eql 'B'
  end
  it 'works with words' do
    expect(caesar_cipher('Aaa', 1)).to eql 'Bbb'
  end
  it 'works with phrases' do
    expect(caesar_cipher('What a string!', 5)).to eql 'Bmfy f xywnsl!'
  end
  it 'works with negative shift' do
    expect(caesar_cipher('Bmfy f xywnsl!', -5)).to eql 'What a string!'
  end
  it 'wraps' do
    expect(caesar_cipher('Z', 1)).to eql 'A'
  end
  it 'works with large shift factors' do
    expect(caesar_cipher('Hello, World!', 75)).to eql 'Ebiil, Tloia!'
  end
  it 'works with large negative shift factors' do
    expect(caesar_cipher('Hello, World!', -29)).to eql 'Ebiil, Tloia!'
  end
end
