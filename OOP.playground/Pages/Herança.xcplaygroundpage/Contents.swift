//: [Anterior](@previous)
//: ## Herança
//: Uma classe pode especializar uma outra classe. Chamamos essa tecninca de herança.
//: Uma herança gera uma relação de `é um` entre duas classes
//: Exemplo: Um pato é um animal.
exemplo("Herança entre pato e animal") {
    class Animal {
        
    }
    
    class Pato: Animal {
        
    }
}

//: Como a relação é de `é um` todos os atributos e métodos definidos para a classe pai (ou super classe) são herdados pela classe filho
exemplo("Herança compartilhando métodos e atributos entre pato e animal") {
    class Animal {
        let nome: String
        
        init(nome: String) {
            self.nome = nome
        }
        
        func description() -> String {
            return "Animal: { nome: \(nome) }"
        }
    }
    
    class Pato: Animal {
        
    }
    
    let pato = Pato(nome: "Patolino")
    print(pato.description())
}

//: Uma subclasse pode sobrescrever métodos da sua super classe. Ou seja, pode alterar funcionalidade da super classe.
exemplo("Herança compartilhando métodos e atributos entre pato e animal") {
    class Animal {
        let nome: String
        
        init(nome: String) {
            self.nome = nome
        }
        
        func description() -> String {
            return "Animal: { nome: \(nome) }"
        }
    }
    
    class Pato: Animal {
        override func description() -> String {
            return "Pato: {  }"
        }
    }
    
    let pato = Pato(nome: "Patolino")
    print(pato.description())
}

//: Toda subclasse pode chamar os métodos da super classe usando a variável `super`
exemplo("Herança compartilhando métodos e atributos entre pato e animal") {
    class Animal {
        let nome: String
        
        init(nome: String) {
            self.nome = nome
        }
        
        func description() -> String {
            return "Animal: { nome: \(nome) }"
        }
    }
    
    class Pato: Animal {
        override func description() -> String {
            return "Pato: { super: { \(super.description()) }"
        }
    }
    
    let pato = Pato(nome: "Patolino")
    print(pato.description())
}


//: ## Polimorfismo
exemplo("Herança compartilhando métodos e atributos entre pato e animal") {
    class Animal {
        let nome: String
        
        init(nome: String) {
            self.nome = nome
        }
        
        func fazerSom() -> String? {
            return nil
        }
    }
    
    class Pato: Animal {
        override func fazerSom() -> String? {
            return "Quack"
        }
    }
    
    class Cachorro: Animal {
        override func fazerSom() -> String? {
            return "Au-au"
        }
    }
    
    let pato: Animal = Pato(nome: "Patolino")
    print(pato.fazerSom())
    
    let cachorro: Animal = Cachorro(nome: "Scooby-doo")
    print(cachorro.fazerSom())
    
    let animais: [Animal] = [pato, cachorro]
    for animal in animais {
        print(animal.fazerSom())
    }
}