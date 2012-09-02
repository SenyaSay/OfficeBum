# encoding: UTF-8

namespace :export do
  namespace :csv do
    desc 'Create products'
    task :create_products => :environment do
      ExportCSV.new('public/1.csv').execute if File.exists?('public/1.csv')
    end
  end
end

require "csv"

class ExportCSV
  TMP_FILE = 'tmp/my.csv'

  def initialize(path)
    @path = path
  end

  def execute
    begin
      return 'File does not exist' unless File.exist?(@path)
      preprocess
      create_by_csv_data
    rescue Exception => e
      p e.backtrace
    ensure
      cleanup
    end
  end

  private

  def create_by_csv_data
    CSV.foreach(TMP_FILE, :col_sep => '|', :headers => true, :return_headers => false) do |line|
      create_products(line, *characteristics)
    end
  end

  def characteristics
    characteristic1 = Characteristic.find_by_name("Артикул") || Characteristic.create(name: "Артикул")
    characteristic2 = Characteristic.find_by_name("Бренд") || Characteristic.create(name: "Бренд")
    return characteristic1, characteristic2
  end

  def create_products(line, characteristic1, characteristic2)
    product = Product.new(name: line[0], price: line[1].to_f)
    product.product_characteristics.build(characteristic_id: characteristic1.id, value: line[2])
    product.product_characteristics.build(characteristic_id: characteristic2.id, value: line[3])
    p(line) unless product.save
  end

  def preprocess
    data = File.read(@path)
    data.gsub!(/\"/, '\'')
    File.open(TMP_FILE, "w+") { |f| f.write(data) }
  end

  def cleanup
    File.delete(TMP_FILE)
  end
end