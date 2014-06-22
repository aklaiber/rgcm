module JsonHelper
  def json(str)
    JSON.parse(str, symbolize_names: true)
  end
end