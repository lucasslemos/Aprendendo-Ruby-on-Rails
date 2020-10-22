namespace :dev do
  desc "Configura o ambinte de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Executando tarefas...")
      spinner.auto_spin 
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Populando BD...") { %x(rails db:seed) }
      spinner.success('(Conluído com Sucesso!)')
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)      
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end  
  end
  
  desc "Cadastra as moedas"
  task add_coins: :environment do 
    show_spinner("Cadastrando moedas...") do
    coins= [
       {
         description: "Bitcoin",
         acronym: "BTC",
         url_image: "https://logospng.org/download/bitcoin/logo-bitcoin-2048.png",
         mining_type: MiningType.find_by(acronym: 'PoW')
        },
        
       {
         description: "Ethereum",
         acronym: "ETH",
         url_image: "https://banner2.cleanpng.com/20190418/rgf/kisspng-ethereum-portable-network-graphics-computer-icons-developers-icon-request-icon-ethereum-5cb941c1cb12b1.1213852915556448658318.jpg",
         mining_type: MiningType.all.sample
        },
        
       {
         description: "Dash",
         acronym: "DASH",
         url_image: "https://c7.uihere.com/files/1021/380/1020/dash-cryptocurrency-bitcoin-blockchain-ethereum-bitcoin.jpg",
         mining_type: MiningType.all.sample
        },
        
       {
         description: "Iota",
         acronym: "IOT",
         url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
         mining_type: MiningType.all.sample
        },
        
       {
         description: "ZCash",
         acronym: "ZEC",
         url_image: "https://www.cryptocompare.com/media/351360/zec.png",
         mining_type: MiningType.all.sample
        }
    ]
    coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]
      
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end

end

