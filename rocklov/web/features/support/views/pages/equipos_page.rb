class EquiposPage
  include Capybara::DSL

  def create(equipo)
    page.has_css?("#equipoForm") #isso é um checkpoint com timeout explicito para garantir q estou no lugar correto, já q em page objects n aceita a funcao expect

    upload(equipo[:thumb]) if equipo[:thumb].length > 0 #obtem a quantidade de itens num array ou a quantidade de letras numa string
    find("input[placeholder$=equipamento]").set equipo[:nome] #chave nome
    select_cat(equipo[:categoria]) if equipo[:categoria].length > 0
    find("input[placeholder^=Valor]").set equipo[:preco]

    click_button "Cadastrar"
  end

  def select_cat(cat)
    find("#category").find("option", text: cat).select_option #encontra nas opcoes de categoria a palavra cordas e dps a seleciona
  end

  def upload(file_name)
    thumb = Dir.pwd + "/features/support/fixtures/images/" + file_name   #Recurso do ruby que faz obter o diretório de execucao do projeto
    find("#thumbnail input[type=file]", visible: false).set thumb #Encontra o elemento com esse input mesmo q ele esteja oculto
  end
end
