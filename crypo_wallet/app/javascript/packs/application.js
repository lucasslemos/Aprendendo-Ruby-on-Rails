require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//modificado
import "bootstrap"
import "../stylesheets/application"

document.addEventListener("turbulinks:load", () => {
	$('[data-toggle="tooltip"]').tooltip()
	$('[data-toggle="popover"]').popover()
})
//

