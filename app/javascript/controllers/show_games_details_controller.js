import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-games-details"
export default class extends Controller {
  static targets = ["description"]

  connect() {
    console.log('hello')
  }

  display() {
    console.log('toggled')
    this.descriptionTarget.classList.toggle("d-none")
  }
}
