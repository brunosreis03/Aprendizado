class DashPage
  include Capybara::DSL

  def on_dash?
    return page.has_css?(".dashboard") #retorna true ou false
  end

  def gotoequipo_form
    click_button "Criar anúncio"
  end

  def equipo_list
    return find(".equipo-list") #.nome pq é uma classe
  end
end
