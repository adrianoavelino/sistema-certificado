module CertificadosHelper
  def value_selected(model)
    return 0  if model.nil?
    model.id
  end
end
