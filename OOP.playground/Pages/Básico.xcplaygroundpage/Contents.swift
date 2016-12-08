//: [Previous](@previous)

//: # Swift

//: ## Histórico
//: Swift foi apresentada ao mundo em 2014. As principais caracteristicas que a Apple prometia para a linguagem era:
//: - Ser uma linguagem multi paradigma
//: - Ser uma linguagem rápida
//: - Ser uma linguagem segura
//: 
//: Em 2015 a linguagem foi transformada em open-source. Hoje estamos na versão 3.0 e muitas coisas já mudaram. Hoje a linguagem possui conceitos de orientação a objeto, programação funcional e orientada a protocolos.
//: Por causa disso, alguns conceitos de OO diferem um pouco de outras linguagens.

//: # Sintaxe
//: A sintaxe de swift lembra muito outras linguagens que derivaram de C. Ela deixa de lado a verbosidade de Objective-C e volta a uma notação semelhante a C, Java, C#...

//: ## Declaração de variaveis

// Declarar uma variavel em Swift consiste em:
// 1- keyword `var`
// 2- nome da variável
// 3- `:` e o tipo
// 4- `=` seguido pelo valor inicial

exemplo("Declaração de variável") {
    //Declaração completa de uma variável
    //`var` + nome + `:` + Tipo + `=` + valor
    var peso: Double = 75.5
    
    // É obrigatório definir o valor inicial antes de usar a variável, mas não é obrigatório definir o valor na mesma linha.
    var altura: Double
    // Tentar usar a altura para alguma operação geraria erro
    //var imc = peso / (altura * altura) // Gera erro de compilação
    
    // Depois de definida, podemos usar
    altura = 1.90
    
    // Posso usar a altura a partir daqui
    var imc = peso / (altura * altura)
    
    print(imc)
}



//: ### Inferencia
//: Se o tipo da variável pode ser descoberto pelo compilador, não precisamos declarar ele explicitamente.
//: Isso acontece quando iniciamos na mesma linha a variável ou quando vamos passar ela para algum método que já tem o tipo declarado

exemplo("Inferência") { 
    // O compilador automaticamente define a variável para ser do tipo Inteiro
    var idade = 22
    
    //O compilador não permite que mudemos o tipo dela
    //idade = 22.5 // Geraria erro de compilação porque 22.5 não é do tipo inteiro
    print(idade)
}

//: Você ainda pode definir o tipo caso o tipo padrão não seja o que você deseja
exemplo("Forçando o tipo") {
    // Por padrão `22` é do tipo `Int`. Se nós definirmos a variável como `Double` o compilador automaticamente irá usar o `22` do tipo double
    var tempoDeVida: Double = 22
    
    // A variável aceita qualquer do tipo `Double`
    tempoDeVida = 22.5
    
    print(tempoDeVida)
}




//: ### `let` e `var`
//: Swift possui dois `tipos` de declaração para valores. Um deles é o `var` e ele permite que você altere o valor da declaração depois da inicialização. O outro é o `let` e ele não pode ser alterado depois da inicialização

// `let` representa um valor constante
// Equivale a `final` em Java
exemplo("Let") { 
    let pi = 3.14
    // pi = 5 // Geraria erro de compilação
    
    // `var` representa uma variável, ou seja, pode ter seu valor alterado
    var raio = 5
    raio = 10
    
    print(raio)
}


// `let` precisa ser inicializado antes de ser usado, mas a inicialização não precisa ser feita na mesma linha
exemplo("Let inicializado depois da declaração") {
    let raio = 20
    let diametroGrande: Bool
    
    if raio * raio > 10 {
        diametroGrande = true
    } else {
        diametroGrande = false
    }
    
    print(diametroGrande)
}


//: ## Controle de Fluxo
//: Swift possui algumas alteranativas para realizar o controle de fluxo da aplicação.

//: ### if
//: Controle de fluxo pode ser feito com `if`s para verificar uma condição.


exemplo("If") {
    let idade = 20
    
    // O `if` não precisa de parênteses
    // O `else` é opcional e pode ser concatenado com mais um `if`, podendo gerar uma cadeia de `if, else if, else if , else`
    if idade < 16 {
        print("Não pode votar nem pode dirigir")
    } else if idade < 18 {
        print("Pode votar, mas não pode dirigir")
    } else {
        print("Pode votar e pode dirigir")
    }
}


//: ## for
//: `for` permite que um mesmo bloco de código seja executado várias vezes.
//: O `for` tradicional de C não é válido.
//: Pode ser usado para percorrer um intervalo definido ou uma coleção de valores

//: ### Intervalos
//: São poucos usados

exemplo("For em intervalos") {
    //`for` para um intervalo fechado de 0 até 5
    for index in 0...5 {
        print(index) // 0, 1, 2, 3, 4, 5
    }

    
    //`for` para um intervalo aberto de 0 até 5
    for index in 0..<5 {
        print(index) // 0, 1, 2, 3, 4
    }
}


//: ### `for` em coleções
//: `for` podem ser usados para percorrer Arrays e outros tipos de coleções

exemplo("For em coleções") { 
    let semana = ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"]
    
    for dia in semana {
        print(dia)
    }
    
    // Se precisarmos do index
    for (index, dia) in semana.enumerated() {
        print("\(index) - \(dia)")
    }
}



//: ## `switch` (Básico)
//: Um `switch` é uma alterantiva a uma cadeia de `if else if`
//: Em Swift, ele obrigatoriamente precisa ter todas as opções de valores (precisa ser exaustivo)
//: O `break` é opcional e por padrão o `switch` não continua a execução se chegar a outro cláusula `case`
//: Para poder executar a próxima cláusula `case` é necessário o comando `fallthrough`

exemplo("Swicth") { 
    let dia = "Quarta"
    
    switch dia {
    case "Sábado", "Domingo":
        print("Final de semana")
        //break é opcional
        
    default:
        //Todo Switch deve ser exastivo. Caso seja impossível ter um `case` pra todos os casos, `default` deve ser implementado
        print("Dia de semana")
        
    }
}


//: ## Opcionais
// `opcionais` (ou `?`) representa um valor opcional, ou seja, que pode ser nulo (em swift `nil`, em outras linguagens `Null`). Em Swift, um valor só pode conter `nil` se o tipo for `<Tipo>?`, exemplo: String?, Int?

exemplo("Opcionais") {
    
    var nome = "Swift"
    // nome = nil // Geraria erro de compilação
    
    var apelido: String? = nil
    apelido = "Swift"
    apelido = nil
    
    var inteiro: Int? = 5
}


//: ### Force Unwrap
//: Operador usado para recuperar o valor de um opcional. Se o opcional for nil, dá crash.

exemplo("Force Unwrap") { 
    var inteiro: Int? = 5
    if inteiro! == 5 {
        print("Inteiro igual a 5")
    }
}


//if apelido! == "Swift" { } // Gera um erro de execução: `fatal error: unexpectedly found nil while unwrapping an Optional value`


//: ### Valores padrão
//: Quando podemos dar um valor padrão, podemos usar o operador `??`
exemplo("Valores padrão") {
    var apelido: String? = nil
    if apelido ?? "" == "" {
        // O valor padrão é usado na comparação e por isso não gera erro
        print(apelido)
    }
}


//: ### `if let`
//: Quando devemos executar alguma operação apenas quando temos um valor, é recomendado utilizar um `if let`.
//: O `if let` cria uma nova variável dentro do `if` com o valor do opcional se ele tiver valor.

exemplo("if let") { 
    var inteiro: Int? = 5
    print(inteiro)
    if let valor = inteiro {
        //o tipo da variável `valor` é Int
        print(valor)
    }
}


//: ### `guard`
//: Quando só devemos executar um método se uma variável tiver valor, podemos usar o operador `guard`.
//: O operador `guard` pode definir variáveis para o resto do escopo depois dele.
//: Em caso de falha da condição, o usuário é obrigado a retornar do escopo do `guard`.

exemplo("guard") { 
    var inteiro: Int? = 5
    guard let valor = inteiro else {
        return
    }
    
    print(valor) //`valor` pode ser usado mesmo depois do `guard`.
}


//: [Next](@next)

