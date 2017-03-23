//: [Previous](@previous)

//: A verdadeira força da orientação a objetos vem da sua capacidade de esconder complexidade e permitir
//: que você construa e trabalhe com abstrações, porém essa caracteristica deve ser criada pelo programador.
//: Encapsulamento é a prática de esconder como uma classe realiza uma operação, obrigando a quem usa essa class a utilizar apenas a interface publica que ela fornece.

//: Um exemplo de encapsulamento é a classe NSDate. Essa classe tem como interface vários métodos para manipular datas. Entretanto, sua implementação é baseada em apenas um valor, a quantidade de segundos que se passaram desde 01 de janeiro de 1970. 
//: A interface da classe permite que você faça operações complexas como quantos meses existem entre duas datas, ou qual dia da semana a data pertence, sem você ser obrigado a se preocupar com toda a complexidade de calcular baseado em segundos.


//: # Modificadores de acesso
//: Modificadores de acesso existem em Objective C mas são muito pouco usados devido a natureza dinamica da linguagem permitir contornar eles.
//: Já em Swift, não é possível contornar eles, o que os torna uma ferramenta muito util para ajudar a encapsular como uma classe funciona.

//: ## Public
//: Todos as classes, métodos e atributos marcadas como `public` serão visiveis em qualquer lugar.
exemplo("Public") { 
    class Pato {
        public func quack() {
            print("Quack")
        }
    }
    
    let pato = Pato()
    pato.quack()
}

//: ## Private
//: Todos os métodos e atributos marcadas como `private` serão visiveis apenas dentro da classe que os declarar.
exemplo("Private") {
    class Pato {
        private func quack() {
            print("Quack")
        }
    }
    
    let pato = Pato()
    // Não conseguimos chamar Quack
//    pato.quack()
}

//: ## Protected
//: Swift não possui esse modificador de acesso, mas ele é tão comum dentro das linguagens que implementam OOP 
//: que precisa ser comentado. Atributos e metodos marcados como `protected` são visiveis pelas classe e subclasses de quem declarou eles.
//:

//: ## Internal
//: Todos os métodos e atributos marcados como `internal` só serão visiveis dentro do mesmo binário que ele foi declarado.

//: ## fileprivate
//: Todos os métodos e atributos marcadas como `fileprivate` serão visiveis apenas dentro do arquivo em que ele foi declarado

var str = "Hello, playground"

//: [Next](@next)
