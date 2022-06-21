import UIKit
import Darwin

enum UserType
{
    case admin, editor, author, reader
}

struct User
{
    let type = UserType.admin
    var nombre = "Juanjo"
    
    func typeOf(usuario: User) -> UserType
    {
        return type
    }
    
    switch type
    {
        case usertype

        default:()
    }
}
