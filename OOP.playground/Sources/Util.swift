import Foundation


public func exemplo(_ name: String, code: ()->()) {
    print("---------------------")
    print("Exemplo: \(name)")
    code()
}
