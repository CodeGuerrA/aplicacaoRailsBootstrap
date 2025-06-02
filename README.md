📚 Aplicação Rails com Bootstrap
Primeiro projeto com Rails simples

Este é um sistema web desenvolvido com Ruby on Rails e integrado ao Bootstrap, com foco no gerenciamento de livros e empréstimos. A aplicação permite o cadastro de usuários, controle de livros disponíveis e registro de empréstimos realizados.

🚀 Funcionalidades
Cadastro e autenticação de usuários

Adição, edição e exclusão de livros

Registro de empréstimos e devoluções

Interface moderna com Bootstrap

Organização pelo padrão MVC do Rails

🛠️ Tecnologias Utilizadas
Ruby on Rails

Bootstrap 5

HTML5, SCSS

SQLite

⚙️ Como Executar o Projeto
Apos clonar o repositorio

Instale as gems:
bundle install

Crie e migre o banco de dados:
rails db:create
rails db:migrate

Inicie o servidor Rails:
rails server

Acesse a aplicação em:
http://localhost:3000

📄 Estrutura Básica
app/controllers/
Contém os controladores MVC para usuários, livros e empréstimos.

app/models/
Modelos ActiveRecord para User, Book e Loan.

app/views/
Views em ERB que utilizam classes e componentes do Bootstrap para layout responsivo.

config/routes.rb
Rotas definidas para as funcionalidades principais (usuários, livros, empréstimos).

db/migrate/
Arquivos de migração que criam as tabelas de usuários, livros e empréstimos.

app/assets/stylesheets/
Arquivos SCSS personalizados para sobrescrever estilos do Bootstrap, quando necessário.
