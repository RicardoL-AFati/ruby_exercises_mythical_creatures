require_relative '../lib/dragon'

describe Dragon
  it "has a name" do
    dragon = Dragon.new("Ramoth", :gold, "Lessa")
    expect(dragon.name).to eq("Ramoth")
  end

  it "has a rider" do
    dragon = Dragon.new("Ramoth", :gold, "Lessa")
    expect(dragon.rider).to eq("Lessa")
  end

  it "has a color" do
    dragon = Dragon.new("Ramoth", :gold, "Lessa")
    expect(dragon.color).to eq(:gold)
  end

  it "can be a different dragon" do
    dragon = Dragon.new("Mnementh", :bronze, "F'lar")
    expect(dragon.name).to eq("Mnementh")
  end

  it "can have a different rider" do
    dragon = Dragon.new("Mnementh", :bronze, "F'lar")
    expect(dragon.rider).to eq("F'lar")
  end

  it "can have a different dragons color" do
    dragon = Dragon.new("Mnementh", :bronze, "F'lar")
    expect(dragon.color).to eq(:bronze)
  end

  it "is born hungry" do
    dragon = Dragon.new("Canth", :brown, "F'nor")
    expect(dragon.hungry?).to eq(true)
  end

  it "eats a lot" do
    dragon = Dragon.new("Canth", :brown, "F'nor")
    expect(dragon.hungry?).to eq(true)
    dragon.eat
    expect(dragon.hungry?).to eq(true)
    dragon.eat
    expect(dragon.hungry?).to eq(true)
    dragon.eat
    expect(dragon.hungry?).to eq(false)
  end
end
