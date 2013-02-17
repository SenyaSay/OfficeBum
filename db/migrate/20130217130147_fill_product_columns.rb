# encoding: UTF-8

class FillProductColumns < ActiveRecord::Migration
  def up
    code_id = Characteristic.where(name: "Артикул").first.try(:id)
    brand_id = Characteristic.where(name: "Бренд").first.try(:id)

    Product.all.each do |product|
      if code_id
        code = ProductCharacteristic.where(characteristic_id: code_id, product_id: product.id).first.try(:value)
        product.code = code if code
      end
      if brand_id
        brand = ProductCharacteristic.where(characteristic_id: brand_id, product_id: product.id).first.try(:value)
        product.brand = brand if brand
      end

      product.save
    end
  end
end
