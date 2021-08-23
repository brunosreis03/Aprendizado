Então("sou redirecionado para o Dashboard") do
  expect(@dash_page.on_dash?).to be true # só vai ser true se tiver realmente no dashboard
end

Então("vejo a mensagem de alerta: {string}") do |expect_alert|
  expect(@alert.dark).to eql expect_alert
end
