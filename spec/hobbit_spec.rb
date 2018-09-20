require_relative '../lib/hobbit'

describe Hobbit
  it "has a name" do
    hobbit = Hobbit.new("Bilbo")
    expect(hobbit.name).to eq("Bilbo")
  end

  it "can be named something else" do
    hobbit = Hobbit.new("Peregrin")
    expect(hobbit.name).to eq("Peregrin")
  end

  it "can have a unadventurous disposition" do
    hobbit = Hobbit.new("Samwise")
    expect(hobbit.disposition).to eq("homebody")
  end

  it "can have a different disposition" do
    hobbit = Hobbit.new("Frodo", "adventurous")
    expect(hobbit.disposition).to eq("adventurous")
  end

  it "grows older when celebrating birthdays" do
    hobbit = Hobbit.new('Meriadoc')
    expect(hobbit.age).to eq(0)
    5.times do
      hobbit.celebrate_birthday
    end
    expect(hobbit.age).to eq(5)
  end

  it "is considered a child at 32" do
    hobbit = Hobbit.new('Gerontius')
    32.times do
      hobbit.celebrate_birthday
    end
    expect(hobbit.adult?).to eq(false)
  end

  it "comes of age at 33" do
    hobbit = Hobbit.new('Otho')
    33.times do
      hobbit.celebrate_birthday
    end
    expect(hobbit.adult?).to eq(true)

    # still adult, one year later
    hobbit.celebrate_birthday
    expect(hobbit.adult?).to eq(true)
  end

  it "is old at age of 101" do
    hobbit = Hobbit.new("Otho")
    101.times do
      hobbit.celebrate_birthday
    end
    expect(hobbit.old?).to eq(false)
  end

  it "has the ring if its name is frodo" do
    hobbit = Hobbit.new("Frodo")
    hobbit_buddy = Hobbit.new("Sam")

    expect(hobbit_buddy.has_ring?).to eq(false)
    expect(hobbit.has_ring?).to eq(true)
  end

  it "is short" do
    hobbit = Hobbit.new("Frodo")
    expect(hobbit.is_short?).to eq(false)
  end
end
