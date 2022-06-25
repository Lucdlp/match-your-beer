import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form"]
  static values = { url: String }

  update() {
    console.log(this.urlValue)
    fetch(`${this.formTarget.action}?${this.urlValue}`, {
      method: "GET",
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
