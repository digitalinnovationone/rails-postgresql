import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    if(localStorage.getItem("token") == null){
      this.htmlLogin()
    }
    else{
      this.getClientes()
    }
  }

  static base_uri = "http://127.0.0.1:3001";

  htmlLogin(element){
    const htmlLogin = `
      <form id="loginForm" data-action="submit->login#handleSubmit">
        <div>
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required>
        </div>
        <div>
          <label for="password">Senha:</label>
          <input type="password" id="password" name="password" required>
        </div>
        <div>
          <button type="submit">Entrar</button>
        </div>
      </form>
    `;

    this.element.innerHTML = htmlLogin;
  }

  async handleSubmit(event) {
    event.preventDefault();

    const email = this.element.querySelector("input[id='email']").value;
    const senha = this.element.querySelector("input[id='password']").value;

    const data = {
      email: email,
      senha: senha
    };

    const url = `${this.constructor.base_uri}/administradores/login`

    const response = await fetch(url, {
        method: 'POST', // Método da requisição
        headers: {
            'Content-Type': 'application/json', // Tipo de conteúdo
            // Adicione outros cabeçalhos conforme necessário
        },
        body: JSON.stringify(data) // Transforma os dados em JSON
    });
    const admComToken = await response.json();

    localStorage.setItem("token", admComToken.token);

    this.getClientes(this.element);
  }

  handleLogout(){
    localStorage.clear();
    this.htmlLogin();
  }

  async getClientes() {

    const url = `${this.constructor.base_uri}/clientes`;

    const token = localStorage.getItem("token");

    const response = await fetch(url, {
        method: 'GET', // Método da requisição
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${token}`,
        }
    });

    const clientes = await response.json();

    let innerHTML = `
      <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Telefone</th>
                <th>CPF</th>
                <th>Data de Criação</th>
            </tr>
        </thead>
        <tbody>
          ${
            clientes.map(cliente => `
              <tr>
                <td>${cliente.id}</td>
                <td>${cliente.nome}</td>
                <td>${cliente.telefone}</td>
                <td>${cliente.cpf}</td>
                <td>${cliente.created_at}</td>
              </tr>`
            ).join('')
          }
          </tbody>
        </table>

        <button data-action="click->login#handleLogout">Logout</button>
      `;

      this.element.innerHTML = innerHTML;
  }
}
