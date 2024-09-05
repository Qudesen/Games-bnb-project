import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-calculator"
export default class extends Controller {
  static targets = ["price", "startDate", "endDate"]
  static values = { price: Number }

  calculate() {
    const start = this.startDateTarget.value
    const end = this.endDateTarget.value
    const startDate = new Date(start)
    const endDate = new Date(end)
    const result = ( endDate - startDate ) / (1000 * 60 * 60 * 24)
    this.priceTarget.innerHTML = `Prix de votre location : <strong> ${ this.priceValue * (1 + result).toFixed(2) } €</strong>`
    }
  }
