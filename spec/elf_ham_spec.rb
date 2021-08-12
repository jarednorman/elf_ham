# frozen_string_literal: true

RSpec.describe ElfHam do
  let(:elf_ham) { described_class.new(<<~CSV) }
    header1,header2,header3,header4
    a,b,c,
    a,d,,b
    elf,ham,elf,ham
  CSV

  it "transforms CSV rows" do
    elf_ham.transform do |row|
      row["header1"] = row["header2"]
    end

    expect(elf_ham.result).to eq(<<~CSV)
      header1,header2,header3,header4
      b,b,c,
      d,d,,b
      ham,ham,elf,ham
    CSV
  end

  it "filters CSV rows" do
    elf_ham.select do |row|
      row["header1"] != "a"
    end

    expect(elf_ham.result).to eq(<<~CSV)
      header1,header2,header3,header4
      elf,ham,elf,ham
    CSV
  end

  it "can be chained" do
    expect(elf_ham.select do |row|
      row["header2"] != "b"
    end.transform do |row|
      row["header3"] = "elfham"
    end.result).to eq(<<~CSV)
      header1,header2,header3,header4
      a,d,elfham,b
      elf,ham,elfham,ham
    CSV
  end
end
