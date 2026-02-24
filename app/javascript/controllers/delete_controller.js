import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String, confirmMessage: String }

  confirmDelete(e) {
    e.preventDefault();
    console.log(this.confirmMessageValue);
    const message = this.confirmMessageValue || "Are you sure you want to delete this item?";

    if (confirm(message)) {
      const form = document.createElement("form");
      form.method = "POST";
      form.action = this.urlValue;

      const methodInput = document.createElement("input");
      methodInput.type = "hidden";
      methodInput.name = "_method";
      methodInput.value = "delete";
      form.appendChild(methodInput);

      const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
      const csrfInput = document.createElement("input");
      csrfInput.type = "hidden";
      csrfInput.name = "authenticity_token";
      csrfInput.value = csrfToken;
      form.appendChild(csrfInput);

      document.body.appendChild(form);
      form.submit();
    }
  }
}
