class Product < ApplicationRecord
    # validate :name, precense: true
    # validate :name, precense: true, numerically: {grather_than: 0}

    # def self.vencido(entrada) do
    #     if entrada == 0 then
    #         return "vencido"
    #     else
    #         return "vigente"
    #     end
    # end

  # Buscar productos por nombre (ignora mayúsculas)
  def self.search(query)
    where("LOWER(name) LIKE ?", "%#{query.downcase}%")
  end
    
  # Productos menor a 100 (precio menor a 100)
  def self.minor
    where("price < ?", 500)
  end

  # Productos mayor a 100 (precio menor a 100)
  def self.major
    where("price > ?", 500)
  end
    
  # Productos agregados recientemente
  def self.recent
    order(created_at: :desc).limit(5)
  end
    
  # Filtrar productos por un rango de precios
  def self.by_price_range(min, max)
    where(price: min..max)
  end

  # Ordenar productos por precio ascendente
  def self.cheap_first
    order(price: :asc)
  end

  # Ordenar productos por precio descendente
  def self.expensive_first
    order(price: :desc)
  end
  
  # Productos creados hoy
  def self.today
    where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end
   
end
