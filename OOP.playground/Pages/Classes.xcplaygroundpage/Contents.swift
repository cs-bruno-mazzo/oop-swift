//: # Orientação a Objetos em Swift

//: ## O que é?
//: Orientação a objetos é uma tecnica de programação onde você tenta modelar problemas


// O que é Programação orientada a Objeto (POO ou OOP em inglês)?
// - Mundo antes da POO
// - Justificativa
// - Benefícios
// - Recursos
// - Exemplo básicos

// Classes

// Uma classe é um template para os objetos

// Criar uma classe que represeta um animal
exemplo("Definição da classe animal") {
    class Animal {
    
    }
    
    // Criar um objeto do tipo animal
    let animal = Animal()
}


//: ## Atributos

// Uma classe pode conter atributos
exemplo("Adicionando atributos à classe Animal") {
    class Animal {
        //Um atributos é composto por nome e tipo
        let nome: String = ""
        let peso: Int = 0
    }
}

//: ## Construtores (Método `init`)
//: Ao contrário de Java, o método init do Swift precisa definir todos os atributos da classe.
//: O método `init` da classe Animal é um exemplo
exemplo("Definição da classe animal") {
    class Animal {
        //Um atributos é composto por nome e tipo
        let nome: String
        let peso: Int
        
        init(nome: String, peso: Int){
            self.nome = nome
            self.peso = peso
        }
    }
    
    //Para criar um objeto do tipo animal, agora precisamos chamar o construtor
    let animal = Animal(nome: "Bob", peso: 10)
    print(animal)
}


//: ## `init`s falhaveis
//: Em alguns casos, o método `init` pode falhar (caso os parametros sejam inválidos por exemplo).
//: Por isso Swift define `init?`.
//: Vamos redefinir o `init` da classe Animal para não aceitar pesos negativos

exemplo("Definindo um init opcional") {
    class Animal {
        
        let nome: String
        let peso: Int
        
        init?(nome: String, peso: Int){
            if peso < 0 {
                return nil
            }
            self.nome = nome
            self.peso = peso
        }
    }
    
    //Para criar um objeto do tipo animal, agora precisamos chamar o construtor, entretanto o tipo retornado agora é um opcional
    let Bob = Animal(nome: "Bob", peso: 10)
    if let Bob = Bob {
        print("Bob criado com sucesso")
    } else {
        print("Não foi possível criar o Bob")
    }
    
    let Willy = Animal(nome: "Willy", peso: -10)
    if let Willy = Willy {
        print("Willy criado com sucesso")
    } else {
        print("Não foi possível criar o Willy")
    }
}

//: ## Métodos
//: Métodos são operações que os objetos podem realizar
//: A sintaxe para se criar um método é:
//: 1- Keyword `func`
//: 2- Nome do método
//: 3- Lista de parametros entre parênteses
//: 4- Tipo de retorno no formato `-> Tipo` (se não tiver retorno é opcional)
exemplo("Definindo um método em uma classe") {
    class Pato {
        
        //Patos conseguem fazer Quack
        //Não possuí parâmetros
        //Retorno do tipo `String`
        func grasnar() -> String {
            return "Quack"
        }
    }
    
    //Para executar o método `grasnar` primeiro precisamos criar um pato
    let pato = Pato()
    
    //Com um pato criado, podemos fazer ele grasnar
    print(pato.grasnar())
}

exemplo("Definindo um método com parâmetros") {
    class Pato {
        
        //Patos conseguem voar
        //Possuí um parâmetro chamado distancia
        //Retorno do tipo `String`
        func voar(distancia: Int) -> String {
            return "Pato voou \(distancia) metros"
        }
    }
    
    //Para executar o método `voar` primeiro precisamos criar um pato
    let pato = Pato()
    
    //Com um pato criado, podemos fazer ele voar
    print(pato.voar(distancia: 10))
}


exemplo("Definindo um método com um parâmetros com valor padrão") {
    class Pato {
        
        //Patos conseguem voar
        //Possuí dois parâmetros: distancia e unidade
        //O parâmetro unidade não é obrigatório
        //Retorno do tipo `String`
        func voar(distancia: Int, unidade: String = "metros") -> String {
            return "Pato voou \(distancia) \(unidade)"
        }
    }
    
    //Para executar o método `voar` primeiro precisamos criar um pato
    let pato = Pato()
    
    //Com um pato criado, podemos fazer ele voar sem passar a unidade
    print(pato.voar(distancia: 10))
    
    //Com um pato criado, podemos fazer ele voar passando a unidade
    print(pato.voar(distancia: 100, unidade: "centimetros"))
}


exemplo("Definindo um método com parâmetros com nomes internos") {
    class Pato {
        
        //Patos conseguem voar até um ponto
        //Possuí dois parâmetros: pontoX e pontoY
        //Dentro do método pontoX é chamado de x e pontoY é chamado de y
        //Retorno do tipo `String`
        func voarAté(pontoX x: Int, pontoY y: Int) -> String {
            return "Pato voou até o ponto (\(x), \(y))"
        }
    }
    
    //Para executar o método `voar` primeiro precisamos criar um pato
    let pato = Pato()
    
    //Com um pato criado, podemos fazer ele voar sem passar a unidade
    print(pato.voarAté(pontoX: 10, pontoY: 20))
    
    
}

//: ## Métodos e atributos estáticos

exemplo("Definindo um método e atributo estático") {
    class Pato {
        
        static var numeroDePatosNoMundo = 0
        
        static func aumentarNumeroDePatosNoMundo() {
            Pato.numeroDePatosNoMundo += 1
        }
        
        init() {
            Pato.aumentarNumeroDePatosNoMundo()
        }
    }
    
    //Não temos pato no mundo
    print(Pato.numeroDePatosNoMundo)
    
    //Temos um pato no mundo
    let pato = Pato()
    print(Pato.numeroDePatosNoMundo)
    
    //Temos dois patos no mundo
    let segundoPato = Pato()
    print(Pato.numeroDePatosNoMundo)
    
    
}


//: ## Sobrecarga

exemplo("Definindo um método com um parâmetros com valor padrão") {
    class Pato {
        
        //Patos conseguem voar
        //Possuí um parâmetro chamado distancia
        //Retorno do tipo `String`
        func voar(distancia: Int) -> String {
            return self.voar(distancia: distancia, unidade: "metros")
        }
        
        //Patos conseguem voar
        //Possuí dois parâmetros: distancia e unidade
        //O parâmetro unidade não é obrigatório
        //Retorno do tipo `String`
        func voar(distancia: Int, unidade: String) -> String {
            return "Pato voou \(distancia) \(unidade)"
        }
    }
    
    let pato = Pato()
    
    print(pato.voar(distancia: 10))
    print(pato.voar(distancia: 100, unidade: "centimetros"))
}

//
// Modificadores de acesso

// Encapisulamento


// Protocolos (Interfaces)
// @OBJC


// Composição + Delegação
// Protocolos
// Structs

//: [Next](@next)
