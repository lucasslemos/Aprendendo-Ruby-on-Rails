spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas...")
spinner.auto_spin

coins= [
   {
     description: "Bitcoin",
     acronym: "BTC",
     url_image: "https://logospng.org/download/bitcoin/logo-bitcoin-2048.png"
    },
    
   {
     description: "Ethereum",
     acronym: "ETH",
     url_image: "https://banner2.cleanpng.com/20190418/rgf/kisspng-ethereum-portable-network-graphics-computer-icons-developers-icon-request-icon-ethereum-5cb941c1cb12b1.1213852915556448658318.jpg"
    },
    
   {
     description: "Dash",
     acronym: "DASH",
     url_image: "https://c7.uihere.com/files/1021/380/1020/dash-cryptocurrency-bitcoin-blockchain-ethereum-bitcoin.jpg"
    },
    
   {
     description: "Iota",
     acronym: "IOT",
     url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png"
    },
    
   {
     description: "ZCash",
     acronym: "ZEC",
     url_image: "https://www.cryptocompare.com/media/351360/zec.png"
    }
]
coins.each do |coin|
    Coin.find_or_create_by!(coin)
end

spinner.success("(Concluído)")