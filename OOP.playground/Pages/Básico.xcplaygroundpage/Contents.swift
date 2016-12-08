//: [Previous](@previous)



//: ## Histórico
//: Swift foi apresentada ao mundo em 2014. As principais caracteristicas que a Apple prometia para a linguagem era:
//: - Ser uma linguagem multi paradigma
//: - Ser uma linguagem rápida
//: - Ser uma linguagem segura
//: Hoje estamos na versão 3.0


//: ## Declaração de variaveis

// Declarar uma variavel em Swift consiste em:
// 1- keyword `var`
// 2- nome da variável
// 3- `:` e o tipo
// 4- `=` seguido pelo valor inicial

// Exemplo
var peso: Double = 75.5

// É obrigatório definir o valor inicial antes de usar a variável
var altura: Double
// Tentar usar a altura para alguma operação geraria erro
//var imc = peso / (altura * altura) // Gera erro de compilação

// Depois de definida, podemos usar
altura = 1.90

// Posso usar a altura a partir daqui
var imc = peso / (altura * altura)


//: ### Inferencia
//: Se o tipo da variável pode ser descoberto pelo compilador, não precisamos declarar ele explicitamente
//: Isso acontece quando iniciamos na mesma linha a variável ou quando vamos passar ela para algum método que já tem o tipo declarado

//: Exemplo
// O compilador automaticamente define a variável para ser do tipo Inteiro
var idade = 22

//O compilador não permite que mudemos o tipo dela
//idade = 22.5 // Geraria erro de compilação porque 22.5 não é do tipo inteiro


//: ### `let` e `var`

// `let` representa um valor constante
// Equivale a `final` em Java

let pi = 3.14
// pi = 5 // Geraria erro de compilação

// `var` representa uma variável, ou seja, pode ter seu valor alterado
var raio = 5
raio = 10

//: ## if
//: Controle de fluxo pode ser feito com `if`s. 

// O `if` não precisa de parênteses
// O `else` é opcional e pode ser concatenado com mais um `if`, podendo gerar uma cadeia de `if, else if, else if , else`
if idade < 16 {
    print("Não pode votar nem pode dirigir")
} else if idade < 18 {
    print("Pode votar, mas não pode dirigir")
} else {
    print("Pode votar e pode dirigir")
}

//: ## for
//: O `for` tradicional de C não é válido
//: Pode ser usado para percorrer um intervalo definido ou uma coleção de valores

//: ### Intervalos
//: São poucos usados

//`for` para um intervalo fechado de 0 até 5
for index in 0...5 {
    print(index)
}


//`for` para um intervalo aberto de 0 até 5
for index in 0..<5 {
    print(index)
}

//: ### `for` em coleções
let semana = ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"]

for dia in semana {
    print(dia)
}

// Se precisarmos do index
for (index, dia) in semana.enumerated() {
    print("\(index) - \(dia)")
}


//: ### `switch` (Básico)
//: Um `switch` é uma alterantiva a uma cadeia de `if else if`
//: Em Swift, ele obrigatoriamente precisa ter todas as opções de valores (precisa ser exaustivo)
//: O `break` é opcional e por padrão o `switch` não continua a execução se chegar a outro cláusula `case`
//: Para poder executar a próxima cláusula `case` é necessário o comando `fallthrough`

let dia = "Quarta"

switch dia {
case "Sábado", "Domingo":
    print("Final de semana")
 
default:
    print("Dia de semana")
 
}


//: ### Opcionais
// `opcionais` (ou `?`) representa um valor opcional, ou seja, que pode ser nulo (em swift `nil`, em outras linguagens `Null`)

var nome = "Swift"
// nome = nil // Geraria erro de compilação

var apelido: String? = nil


var inteiro: Int? = 5

//: ### Force Unwrap
//: Operador usado para recuperar o valor de um opcional. Se o opcional for nil, dá crash.

if inteiro! == 5 {
    print("Inteiro igual a 5")
}

//if apelido! == "Swift" { } // Gera um erro de execução: `fatal error: unexpectedly found nil while unwrapping an Optional value`


//: ### Valores padrão
//: Quando podemos dar um valor padrão, podemos usar o operador `??`

if apelido ?? "" == "Swift" {
    // O valor padrão é usado na comparação e por isso não gera erro
}


//: ### `if let`
//: Quando devemos executar alguma operação apenas quando temos um valor, é recomendado utilizar um `if let`.
//: O `if let` cria uma nova variável dentro do `if` com o valor do opcional se ele tiver valor.

if let valor = inteiro {
    //o tipo da variável `valor` é Int
}


//: ### `guard`
//: Quando só devemos executar um método se uma variável tiver valor, podemos usar o operador `guard` no inicio do método.
//: O operador `guard` pode definir variáveis para o resto do escopo depois dele.
//: Em caso de falha da condição, o usuário é obrigado a retornar do escopo do `guard`.

guard let valor = inteiro else {
    fatalError()
}

print(valor) //`valor` pode ser usado mesmo depois do `guard`.


//: [Next](@next)

