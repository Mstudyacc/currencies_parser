require 'rexml/document'
require 'date'

class Parser

  attr_accessor :id, :num_code, :name, :value

	def initialize(params)
    @id = params[:id]
    @num_code = params[:num_code]
    @name = params[:name]
    @value = params[:value]
  end

  # Метод класса from_xml_node возвращает экземпляр класса, прочитанные из
  # элемента XML-структуры с параметрами
  def self.from_xml(node)
    new(
      id: node.attributes['ID'].to_i,
      num_code: node.elements['NumCode'].get_text.value.to_i,
      name: node.elements['Name'].get_text.value.to_s,
      value: node.elements['Value'].get_text.value.to_s
    )
  end

  def to_s
    result = "#{@name}:  #{@value} руб."

    return result
  end

end