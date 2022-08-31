import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-skills"
export default class extends Controller {
  static targets = ["form"]

  displayForm() {
    if (this.formTarget.classList.value.split(" ").pop() === "d-none") {
      this.formTarget.classList.remove("d-none")
    } else {
      this.formTarget.classList.add("d-none")
    }
  }
}
