# frozen_string_literal: true

require "csv"

require_relative "elf_ham/version"

class ElfHam
  def initialize(csv_data)
    @rows = CSV.parse(csv_data, headers: true).each.to_a
  end

  def transform(&block)
    @rows.each(&block)
    self
  end

  def select(&block)
    @rows.select!(&block)
    self
  end

  def result
    CSV.generate do |csv|
      @rows.each_with_index do |row, index|
        if index == 0
          csv << row.headers
        end

        csv << row.fields
      end
    end
  end
end
