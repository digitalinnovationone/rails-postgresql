import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  async connect() {
    const url = 'http://localhost:3001/'

    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const data = await response.json();

    this.element.innerHTML = `<pre>${data.mensagem}</pre>`
  }
}
