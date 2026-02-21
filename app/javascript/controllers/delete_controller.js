import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }

  connect() {
    this.deleteButtonTarget.addEventListener("click", this.confirmDelete.bind(this))
  }

  confirmDelete(e){ 
    e.preventDefault()

    if (confirm("¿Estás seguro de que deseas eliminar este producto?")) {
        const form = document.createElement("form")
        form.method = "POST"
        form.action = this.urlValue

        const methodInput = document.createElement("input")
        methodInput.type = "hidden"
        methodInput.name = "_method"
        methodInput.value = "delete"
        form.appendChild(methodInput)

        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
        const csrfInput = document.createElement("input")
        csrfInput.type = "hidden"
        csrfInput.name = "authenticity_token"
        csrfInput.value = csrfToken
        form.appendChild(csrfInput)

        document.body.appendChild(form)
        form.submit()
    }
  }
}
