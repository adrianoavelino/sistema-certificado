Dado("que eu visito a página de Remessa") do
  visit shipping_path
  expect(page.body).to have_content("Gerar Remessa")
end

Quando("eu enviar {int} números alternados de certificados existentes") do |int|
  all_certificate_numbers = Certificado.all.pluck(:id)
  certification_numbers = get_two_alternating_numbers(all_certificate_numbers)
  fill_in "term", with: certification_numbers
  click_button "Pesquisar"
end

Quando("eu enviar um intervalo de {int} de certificados") do |qtd|
  all_certificate_numbers = Certificado.all.order("id").pluck(:id)
  certification_numbers = get_interval_numbers(all_certificate_numbers, 5)
  fill_in "term", with: certification_numbers
  click_button "Pesquisar"
end

Então("eu devo ver {int} certificados listados") do |qtd|
  certification_amount = all(".even").count
  expect(certification_amount).to eq qtd
end

Quando("eu enviar {int} números alternados e um intervalo de números {int} de certificados") do |alternate_qtd, interval_qtd|
  all_certificate_numbers = Certificado.all.order("id").pluck(:id)
  certification_numbers = get_interval_numbers(all_certificate_numbers, 3)
  certification_numbers += "," + get_two_alternating_numbers(all_certificate_numbers)
  fill_in "term", with: certification_numbers
  click_button "Pesquisar"
end

def get_two_alternating_numbers(numbers = [])
  "#{numbers.last},#{numbers.last(2).first}"
end

def get_interval_numbers(numbers = [], interval)
  "#{numbers[0]}-#{numbers[interval-1]}"
end
