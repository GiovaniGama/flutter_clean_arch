# Visualizador de CEP - Flutter

Este é um projeto básico em Flutter que permite visualizar informações de um CEP inserido pelo usuário. O foco principal está na implementação do código utilizando Clean Architecture e princípios SOLID, garantindo um código modular, testável e escalável.

## 📌 Tecnologias Utilizadas
- Flutter  
- Dart  
- Clean Architecture  
- SOLID  

## 🎨 Design System
O projeto mantém a organização de estilos separadamente, incluindo:
- **Cores**: Definidas em um arquivo específico para garantir consistência.  
- **Fontes**: Configuradas centralmente para fácil reutilização.  
- **Bordas**: Estilos de borda padronizados para componentes.  

## 📂 Estrutura do Projeto
```
lib/
│── core/                 # Camada central (helpers, design system, etc.)
│── data/                 # Fontes de dados (API, models, repositories)
│── domain/               # Regras de negócio (entities, use cases)
│── presentation/         # Interface do usuário (widgets, páginas, controllers)
│── main.dart             # Arquivo principal
```

## 🚀 Como Executar
1. Clone o repositório:  
   ```bash
   git clone https://github.com/GiovaniGama/flutter_clean_arch.git
   ```  
2. Acesse o diretório do projeto:  
   ```bash
   cd flutter_clean_arch
   ```  
3. Instale as dependências:  
   ```bash
   flutter pub get
   ```  
4. Execute o projeto:  
   ```bash
   flutter run
   ``` 