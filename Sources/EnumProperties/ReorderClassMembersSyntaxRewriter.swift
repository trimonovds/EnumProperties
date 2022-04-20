import Foundation
import SwiftSyntax

public class ReorderClassMembersSyntaxRewriter: SyntaxRewriter {
    public override func visit(_ node: ClassDeclSyntax) -> DeclSyntax {
        print(node.members.children.filter { $0.is(VariableDeclSyntax.self) }) 
        return DeclSyntax(node)
    }
}