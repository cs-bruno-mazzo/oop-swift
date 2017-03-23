//: [Previous](@previous)


//: # Structs
//: Structs são semelhantes a classes e server como um tipo de unidade básica na construção da sua aplicação. Structs aceitam attributos e métodos assim como classes, mas não podem ser herdadas. Outra diferença importante é que structs tem como padrão semantica de valor ao contrário de classes que possuem semantica de objeto.

//: ## Semantica de valor
//: Structs são utilizadas para abstrair valores. Valores são imutaveis. Ou seja, assim como um `int`, qualquer operação realizada sobre ele não muda o valor do `int` e sim cria um novo valor com o resultado da operação.

exemplo("Valor") { 
    var valor1 = 5
    //Valor2 é uma copia do valor1 e não uma referencia ao mesmo valor.
    var valor2 = valor1
    
    //Quando mudamos o valor1, não mudamos o valor2
    valor1 = 10
    print(valor2)
}

exemplo("Struct Valor") { 
    struct Valor {
        var inteiro = 10
    }
    
    var valor1 = Valor()
    //Valor2 é uma copia de valor 1
    var valor2 = valor1
    
    //Alterando valor1 não alteramos o valor2
    valor1.inteiro = 120
    
    print(valor2)
}

//: Structs podem conter métodos
exemplo("Métodos em uma struct") { 
    struct Valor {
        var inteiro = 10
        
        func printValue() {
            print(self.inteiro)
        }
    }
    
    var valor1 = Valor()
    valor1.printValue()
}


//: Métodos que alteram o valor da struct precisam ser marcados como mutating e seus efeitos serão só visiveis na struct que chamar ele. Valores declarados como `let` não podem chamar esses métodos.
exemplo("Mutating Struct") { 
    struct Valor {
        var inteiro = 10
        
        mutating func increment() {
            self.inteiro = self.inteiro + 1
        }
    }
    
    var valor1 = Valor()
    valor1.increment()
    print(valor1)
    
    
    let valor2 = valor1
    //Não conseguimos chamar increment porque o valor2 é imutavel
    //valor2.increment()
    print(valor2)
}

//: Structs podem implementar protocols
protocol Logable {
    func log()
}

exemplo("Interface em uma Struct") {
    struct Valor: Logable {
        var inteiro = 10
        
        mutating func increment() {
            self.inteiro = self.inteiro + 1
        }
        
        func log() {
            print("Valor: \(self.inteiro)")
        }
    }
    
    var valor1 = Valor()
    valor1.increment()
    valor1.log()
}

//: [Next](@next)
