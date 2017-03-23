//: # Orientação a Objetos em Swift

//: ## O que é?
//: Orientação a objetos é um paradigma de programação onde você tenta solucionar problemas modelando objetos. Esses objetos possuem atributos e métodos característicos, por exemplo uma janela em um navegador pode ser um objeto `janela`, possuir o atributo `corDeFundo` e o método `trocarCorDeFundo()` que definem suas características e comportamentos durante o seu ciclo de vida.

// O que é Programação orientada a Objeto (POO ou OOP em inglês)?
// - Mundo antes da POO
// - Justificativa
// - Benefícios
// - Recursos
// - Exemplo básicos

// Objetos


//: ## Classes
//: Uma classe é um modelo onde podemos representar um objeto do mundo real e suas características, por exemplo, podemos criar um classe Animal para representar os animais e adicionar características através de atributos e métodos. Abaixo segue um exemplo de como podemos criar uma classe em swift.
//:
//: O passo (1) mostra como definimos uma classe em swift. Utilizando a palavra-chave `class` seguido pelo nome da classe.
//:
//: Instanciar um objeto é o ato de criar uma variável do tipo da nossa classe. Em (2) criamos uma variável chamada de animal e instanciamos a mesma com um objeto do tipo Animal.
exemplo("Definição da classe animal") {
    
    // (1) Definindo a classe Animal
    class Animal {
    
    }
    
    // (2) Criar um objeto do tipo animal
    let animal = Animal()
}

//: ## Atributos
//: Atributos, também conhecidos como variávies, representam características da classe, ou seja definem a sua estrutura. (1) Adicionamos dois atributos a nossa classe `Animal`: `nome` e `peso`, pois, em nosso projeto todo animal possui um nome e um peso.
exemplo("Adicionando atributos à classe Animal") {
    
    class Animal {
        // (1) Um atributos é composto por nome e tipo
        let nome: String = ""
        let peso: Int = 0
    }
}

//: ## Construtores (Método `init`)
//: O construtor é o método especial responsável por criar o nosso objeto. No swift esse método tem a sua assinatura descrita pela palavra-chave `init`, já no Java o construtor possui o mesmo nome da classe.
//:
//: Em swift, o construtor precisa iniciar (definir valores) todos os atributos da classe. No exemplo a seguir criamos um construtor para iniciar os atributos `nome` e `peso` da nossa classe Animal (1).
//:
//: Em seguida (2), instanciamos uma variável utilizando o nosso construtor, que recebe um `nome` e um `peso` por parâmetro.
exemplo("Definição da classe animal") {
    
    class Animal {
        // Um atributos é composto por nome e tipo
        let nome: String
        let peso: Int
        
        // (1)  Construtor que inicializa os atributos nome e peso
        init(nome: String, peso: Int){
            self.nome = nome
            self.peso = peso
        }
    }
    
    // (2) Para criar um objeto do tipo animal, agora precisamos chamar o construtor
    let animal = Animal(nome: "Bob", peso: 10)
    print(animal)
}
//: ## `inits` falhaveis
//: Em alguns casos, o método `init` pode falhar, por exemplo quando os parametros são inválidos, não retornando um objeto para a nossa variável e sim um valor nulo.
//:
//: Por isso Swift define `init?`, similar a declaração de um opcional pois agora ele pode retornar um objeto nulo.
//:
//: (1) Vamos redefinir o `init` da classe Animal para não aceitar pesos negativos, consequentemente ele deve ser falhavel para caso a condição não seja satisfeita ele retorne um objeto nulo.
//:
//: Em (2) e (3) vamos instanciar novos objetos e analisar se o construtor criou ou não o nosso objeto, ou seja se ele possui algum valor (2) ou se é simplesmente nulo (3).

exemplo("Definindo um init opcional") {
    class Animal {
        
        let nome: String
        let peso: Int
        
        // (1) Redefinindo init para init?
        init?(nome: String, peso: Int){
            if peso < 0 {
                return nil
            }
            self.nome = nome
            self.peso = peso
        }
    }
    
    //(2) Para criar um objeto do tipo animal, agora precisamos chamar o construtor, entretanto o tipo retornado agora é um opcional
    let Bob = Animal(nome: "Bob", peso: 10)
    if let Bob = Bob {
        print("Bob criado com sucesso")
    } else {
        print("Não foi possível criar o Bob")
    }
    
    // (3) Tentamos criar um objeto com peso negativo. O retorno será nulo
    let Willy = Animal(nome: "Willy", peso: -10)
    if let Willy = Willy {
        print("Willy criado com sucesso")
    } else {
        print("Não foi possível criar o Willy")
    }
}

//: ## Métodos
//: Métodos são operações que os objetos podem realizar, normalmente comparados com comportamentos que são desejados pelo objeto. Por exemplo um pato tem o comportamento de gransar (emitir som), voar, andar e etc. Esses comportamentos podem ser expressados através de métodos dentro do corpo da nossa classe.
//:
//: Um métdo deve possuir um nome, um tipo de retorno e parâmetros de entrada esse conjunto é chamado de assinatura do método. O objetivo do método é receber um certo parâmetro, realizar algum processamento e retornar uma resposta. Existem métodos que não necessitam de parâmetros e/ou que não retornam nada apenas realizam um processamento.
//:
//: Em swift a sintaxe para se criar um método é:
//: - Palavra-chave `func`;
//: - Nome do método;
//: - Lista de parametros entre parênteses;
//: - Tipo de retorno no formato `-> Tipo` (se não tiver retorno é opcional).
//:
//: Em (1) temos a nome do método como `grasnar`, os `()` indicam que o método não recebe nenhuma parâmetro e `->` sinaliza o tipo de retorno que no caso é `String`
//:
//: Para executar esse método precisamos primeiramente criar e instanciar uma variável (2) e posteriormente acessar o método através do `.` (ponto) (3)
exemplo("Definindo um método em uma classe") {
    
    class Pato {
        
        // Patos conseguem fazer Quack
        // Não possuí parâmetros
        // Retorno do tipo `String`
        // (1)
        func grasnar() -> String {
            return "Quack"
        }
    }
    
    // (2) Para executar o método `grasnar` primeiro precisamos criar um pato
    let pato = Pato()
    
    // (3) Com um pato criado, podemos fazer ele grasnar
    print(pato.grasnar())
}

//: (4) Vamos criar o método `voar` que recebe uma `distancia` por parâmetro do tipo `Int` e retonar uma `String` descrevendo a distância percorrida durante o vôo.
//:
//: Para chamar o método utilizamos o mesmo processo realizado no exemplo anterior: criamos e instânciamos uma variável para em seguida chamar o método `voar` (5) e (6).
exemplo("Definindo um método com parâmetros") {
    class Pato {
        
        // Patos conseguem voar
        // Possuí um parâmetro chamado distancia
        // Retorno do tipo `String`
        // (4)
        func voar(distancia: Int) -> String {
            return "Pato voou \(distancia) metros"
        }
    }
    
    // (5) Para executar o método `voar` primeiro precisamos criar um pato
    let pato = Pato()
    
    // (6) Com um pato criado, podemos fazer ele voar
    print(pato.voar(distancia: 10))
}
//: Podemos ter um parâmetro com valor padrão. Isso significa que caso não seja passado nada naquele parâmetro o método irá atribuir à variável o valor padrão definido.
//:
//: No passo (7) reescrevemos o nosso método `voar`que agora recebe dois parâmetros: `distancia` e `unidade` sendo que este segundo possui um valor padrão, caso não seja passado nenhum valor o padrão será utilizado como pode ser visto em (8). Em (9) esse valor padrão é sobrescrito com `centimetros`.
exemplo("Definindo um método com um parâmetros com valor padrão") {
    
    class Pato {
        
        // Patos conseguem voar
        // Possuí dois parâmetros: distancia e unidade
        // O parâmetro unidade não é obrigatório
        // Retorno do tipo `String`
        // (7)
        func voar(distancia: Int, unidade: String = "metros") -> String {
            return "Pato voou \(distancia) \(unidade)"
        }
    }
    
    // Para executar o método `voar` primeiro precisamos criar um pato
    let pato = Pato()
    
    // Com um pato criado, podemos fazer ele voar sem passar a unidade
    // (8)
    print(pato.voar(distancia: 10))
    
    // (9) Com um pato criado, podemos fazer ele voar passando a unidade
    print(pato.voar(distancia: 100, unidade: "centimetros"))
}

//: Nomes internos atuam como placeholder, eles auxiliam a declaração do método para tornar a leitura mais compreensivel. No exemplo abaixo trocamos `x` por `atePontoX` e `y` por `ePontoY` (10).

exemplo("Definindo um método com parâmetros com nomes internos") {
    class Pato {
        
        // Patos conseguem voar até um ponto
        // Possuí dois parâmetros: pontoX e pontoY
        // Dentro do método pontoX é chamado de x e pontoY é chamado de y
        // Retorno do tipo `String`
        // (10)
        func voar(atePontoX x: Int, ePontoY y: Int) -> String {
            return "Pato voou até o ponto (\(x), \(y))"
        }
    }
    
    // Para executar o método `voar` primeiro precisamos criar um pato
    let pato = Pato()
    
    // Com um pato criado, podemos fazer ele voar sem passar a unidade
    print(pato.voar(atePontoX: 10, ePontoY: 20))
    
}

//: ## Métodos e atributos estáticos
//: Métodos e/ou atributos podem ser antecedidos pela palavra-chave `static` (1) e (2) a qual indica que aquele método e/ou atributo é estático, ou seja, ele faz parte da classe e não do objeto e será compartilhado por todas as instâncias daquela classe. Já que ele pertence à classe e não ao objeto não é necessário uma instância da classe para acessa-lo.
//:
//: No exemplo abaixo temos um atributo `static` que conta o número de patos no mundo e ao criarmos um novo pato o método construtor chama o método `aumentarNumeroDePatosNoMundo()` incrementando a variável.
//:
//: Em (3) nós temos `0` patos no mundo, (4) após a criação do nosso objeto `pato` esse valor é incrementado e em (5) o valor da variável estática é `2`.

exemplo("Definindo um método e atributo estático") {
    class Pato {
        
        // (1)
        static var numeroDePatosNoMundo = 0
        
        // (2
        static func aumentarNumeroDePatosNoMundo() {
            Pato.numeroDePatosNoMundo += 1
        }
        
        init() {
            Pato.aumentarNumeroDePatosNoMundo()
        }
    }
    
    // (3) Não temos pato no mundo
    print(Pato.numeroDePatosNoMundo)
    
    // (4) Temos um pato no mundo
    let pato = Pato()
    print(Pato.numeroDePatosNoMundo)
    
    // (5) Temos dois patos no mundo
    let segundoPato = Pato()
    print(Pato.numeroDePatosNoMundo)
    
    
}


//: ## Sobrecarga
//: A sobrecargar de métodos é a habilidade de permitir a existência de métodos com nomes iguais mas assinaturas diferentes, ou seja o método deve possuir o tipo de retorno ou parâmetros diferentes.
//:
//: - (1) criamos o método `voar`, que recebe um `Int` por parâmetro e retona uma `String`;
//: - (2) criamos o método `voar`, que recebe um `Int` por parâmetro e retona um `Int`;
//: - (3) criamos o método `voar`, que recebe dois parâmetros: um `Int` e um `String` e retonar uma `String`.
//:
//: Em todos os exemplos o nome do método é o mesmo (`voar`) mudando apenas os parâmetros ou o tipo de retorno.

exemplo("Definindo um método com um parâmetros com valor padrão") {
    class Pato {
        
        // Patos conseguem voar
        // Possuí um parâmetro chamado distancia
        // Retorno do tipo `String`
        // (1)
        func voar(distancia: Int) -> String {
            return self.voar(distancia: distancia, unidade: "metros")
        }
        
        // Retorna a distância passada por parâmetro
        // (2)
        func voar(distancia: Int) -> Int {
            return distancia
        }
        
        // Patos conseguem voar
        // Possuí dois parâmetros: distancia e unidade
        // O parâmetro unidade não é obrigatório
        // Retorno do tipo `String`
        // (3)
        func voar(distancia: Int, unidade: String) -> String {
            return "Pato voou \(distancia) \(unidade)"
        }
    }
    
    let pato = Pato()
    
    let texto: String = pato.voar(distancia: 10)
    print(texto)
    print(pato.voar(distancia: 100, unidade: "centimetros"))
}

// Protocolos (Interfaces)
// @OBJC


// Composição + Delegação
// Protocolos
// Structs

//: [Next](@next)
