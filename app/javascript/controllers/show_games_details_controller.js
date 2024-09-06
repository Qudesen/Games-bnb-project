import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-games-details"
export default class extends Controller {
  static targets = ["description", "voir"]

  connect() {
  }

  display() {
    this.descriptionTarget.classList.toggle("d-none")
    if ( this.voirTarget.innerText === "Voir +" ) {
      this.voirTarget.innerText = "Voir -";
    } else {
      this.voirTarget.innerText = "Voir +";
    }
  }
}
