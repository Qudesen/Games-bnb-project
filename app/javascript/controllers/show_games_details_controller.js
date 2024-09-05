import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-games-details"
export default class extends Controller {
  static targets = ["description"]

  connect() {

  }

  display() {

    this.descriptionTarget.classList.toggle("d-none")
  }
}
